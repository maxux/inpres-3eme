var Parser = function(input, remote) {
	var ip = 0;       // instruction pointer
	var labels = {};  // labels (functions) table
	var vars = {};    // variables table
	
	var __debug = false;
	var __stop = false;
	
	var self = this;
	var lines = input.split("\n");
	
	// default delay between each instruction
	var __delay = (__debug) ? 400 : 1;
	
	var callback = null;
	
	function init() {
		//
		// building labels table
		//
		for(var i = 0; i < lines.length; i++) {
			var line = lines[i];
			
			if(line[line.length - 1] == ':') {
				labels[line] = i; // saving line number
				lines[i] = '';    // removing line from code
			}
		}
		
		debug("[+] labels:");
		debug(labels);
		
		// execute first instruction
		execute();
	}
	
	//
	// getters
	//
	function getvalue(id) {
		var data = remote.laststate;
		
		// sensors
		for(var i = 0; i < data[0].length; i++)
			if('$' + data[0][i].code == id)
				return data[0][i].value;
		
		// actuators
		for(var i = 0; i < data[1].length; i++)
			if('$' + data[1][i].code == id)
				return data[1][i].value;
		
		console.log("[-] unknown identifier: " + id);
		return 0;
	}
	
	function getvar(name) {
		return vars[name];
	}
	
	function gets(item) {
		// petra variable
		if(item[0] == '$')
			return getvalue(item);
		
		// constant
		if(isNumber(item))
			return parseInt(item);
		
		// local variable
		return getvar(item);
	}
	
	function isNumber(n) {
		return !isNaN(parseFloat(n)) && isFinite(n);
	}
	
	//
	// interrupt handler
	//
	this.__callback = function() {
		console.log("[+] interruption, calling handler");
		// call the callback registered function
		ip = labels[callback + ':'];
		next();
	}
	
	//
	// if's
	//
	function if_equals(a1, a2, label) {
		if(a1 == a2)
			return running('call ' + label);
		
		return true;
	}
	
	function if_notequals(a1, a2, label) {
		if(a1 != a2)
			return running('call ' + label);
		
		return true;
	}
	
	function if_gt(a1, a2, label) {
		if(a1 > a2)
			return running('call ' + label);
		
		return true;
	}
	
	function if_lt(a1, a2, label) {
		if(a1 < a2)
			return running('call ' + label);
		
		return true;
	}
	
	function if_modulo(a1, a2, label) {
		if(a1 % a2)
			return running('call ' + label);
		
		return true;
	}
	
	//
	// parser
	//
	function running(line) {		
		//
		// working on current instruction
		//
		var words = line.split(' ');
		debug(words);
		
		switch(words[0]) {			
			case 'write':
				console.log("[+] writing: " + words[1] + ", " + parseInt(words[2]));
				
				var _port = words[1].replace('$', '');
				remote.write('write', {port: _port, value: parseInt(words[2])});
				return true;
			break;
			
			case 'sleep':
				console.log("[+] sleeping: " + words[1] + "ms");
				next(parseInt(words[1]));
				return false;
			break;
			
			case 'call':
				if(labels[words[1] + ':']) {
					ip = labels[words[1] + ':'];
					
				} else console.log("[-] unknown label: " + words[1]);
				return true;
			break;
			
			case 'print':
				console.log(">> " + getvar(words[1]));
				return true;
			break;
			
			case 'if':
				var a1 = gets(words[1]);
				var a2 = gets(words[3]);
				
				switch(words[2]) {
					case '==':
						return if_equals(a1, a2, words[4]);
					break;
					
					case '!=':
						return if_notequals(a1, a2, words[4]);
					break;
					
					case '>':
						return if_gt(a1, a2, words[4]);
					break;
					
					case '<':
						return if_lt(a1, a2, words[4]);
					break;
					
					case '%':
						return if_modulo(a1, a2, words[4]);
					break;
					
					default:
						console.log("[-] unknown statement: " + words[2]);
						return true;
				}
			break;
			
			case 'interrupt':
				if(labels[words[1] + ':']) {
					console.log("[+] registering callback with label: " + words[1]);
					callback = words[1];
					remote.callback = self.__callback;
					
				} else console.log("[-] unknown label: " + words[1]);
				return true;
			break;
			
			case 'detach':
				console.log("[+] detaching");
				return false;
			break;
		}
		
		switch(words[1]) {
			// variable assignation
			case '=':
				vars[words[0]] = gets(words[2]);
				debug(vars);
				return true;
			break;
			
			case '+=':
				vars[words[0]] = vars[words[0]] + gets(words[2]);
				debug(vars);
				return true;
			break;
		}
		
		console.log("[-] unknown instruction: " + words[0]);
		return true;
	}
	
	function next(delay) {
		ip++;
		
		if(!self.__stop)
			setTimeout(execute, (delay == undefined) ? __delay : delay);
		
		else self.stop();
	}
	
	function execute() {
		//
		// running next line
		//
		if(ip == lines.length) {
			console.log("[+] end of script");
			return self.stop();
		}
		
		if(lines[ip] == '' || lines[ip][0] == '#') {
			debug('[ ] empty line or commented line');
			return next();
		}
		
		debug("[+] processing: " + lines[ip]);
		
		if(running(lines[ip]))
			next();
	}
	
	this.stop = function() {
		console.log("[+] stopping.");
		__stop = true;
		remote.callback = null; // remove callback
	}
	
	function debug(str) {
		if(__debug)
			console.log(str);
	}
	
	init();
}
