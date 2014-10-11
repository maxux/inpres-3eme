var events   = require('events');
var fs       = require('fs');
var readline = require('readline');
var util     = require('util');
var net      = require('net');

var PetraServer = function(host, port) {
	var self   = this;
	
	this.host  = host;
	this.port  = port;
	this.petra = null;
	
	this.sensors = [
		{code: 'L1', value: 0},
		{code: 'L2', value: 0},
		{code: 'T',  value: 0},
		{code: 'S',  value: 0},
		{code: 'CS', value: 0},
		{code: 'AP', value: 0},
		{code: 'PP', value: 0},
		{code: 'DE', value: 0},
	];
	
	this.actuators = [
		{code: 'CP', value: 0},
		{code: 'C1', value: 0},
		{code: 'C2', value: 0},
		{code: 'PV', value: 0},
		{code: 'PA', value: 0},
		{code: 'AA', value: 0},
		{code: 'GA', value: 0},
	];
	
	events.EventEmitter.call(this);
	
	this.run = function() {
		var self = this;
		
		setInterval(function() {
			if(!self.ready)
				return;
			
			/* checking each sensors port */
			for(i = 0; i < self.sensors.length; i++)
				self.update(i);
				
		}, 1000);
	};
	
	this.update = function(json) {
		var self = this;
		
		console.log(json);
		
		for(var i = 0; i < json[0].length; i++) 
			this.sensors[i].value = json[0][i];
		
		for(var i = 0; i < json[1].length; i++) 
			this.actuators[i].value = json[1][i];
		
		this.emit('petra-change', [this.sensors, this.actuators]);
	};
	
	this.request = function(object, connection) {
		// console.log(object);
		
		if(object.request == 'status') {
			console.log('[+] Petra: status');
			return this.petra_status(connection);
		}
		
		if(object.request == 'toggle') {
			console.log('[+] Petra: toggle: ' + object.payload.port);
			return this.actuators_toggle(object.payload.port);
		}
		
		if(object.request == 'write') {
			console.log('[+] Petra: write: ' + object.payload.port + ', ' + object.payload.value);
			var i = this.actuators_get(object.payload.port);
			return this.actuators_change(i, object.payload.value);
		}
		
		if(object.request == 'ping') {
			connection.sendUTF(JSON.stringify({
				event: 'pong',
				data: null
			}));
		}
	};
	
	this.petra_status = function(connection) {
		connection.sendUTF(JSON.stringify({
			event: 'petra-change',
			data: [this.sensors, this.actuators]
		}));
	};
	
	this.actuators_get = function(code) {
		for(i = 0; i < this.actuators.length; i++)
			if(this.actuators[i].code == code)
				return i;
	}
	
	this.actuators_toggle = function(actuators) {
		i = this.actuators_get(actuators);
		return this.actuators_change(i, (this.actuators[i].value) ? 0 : 1);
	};
	
	this.actuators_change = function(index, value) {
		self.petra.write("SET " + this.actuators[index].code + ' ' + value);		
		return true;
	};
	
	this.construct = function() {	
		self.petra = net.connect({host: this.host, port: this.port}, function() {
			console.log('[+] Connected to Petra Server');
		});
		
		//
		// got data from petra
		//
		self.petra.on('data', function(data) {
			lines = data.toString().split("\n");
			
			for(var i = 0; i < lines.length - 1; i++)
				self.update(JSON.parse(lines[i]));
		});
		
		self.petra.on('end', function() {
			console.log('[-] Connection to Petra Server lost');
		});
	};
	
	this.construct();
};

util.inherits(PetraServer, events.EventEmitter);

module.exports = PetraServer;
