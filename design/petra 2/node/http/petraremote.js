var PetraRemote = function() {
	this.socket;
	this.self = this;
	
	this.server = "syna";
	this.port   = 8081;
	
	this.buttons = [
		// sensors
		{type: 0, code: 'L1', name: 'Cut-Out #1', values: ["non", "oui"]},
		{type: 0, code: 'L2', name: 'Cut-Out #2', values: ["non", "oui"]},
		{type: 0, code: 'T',  name: 'Epaisseur',  values: ["0", "1"]},
		{type: 0, code: 'S',  name: 'Slot',       values: ["non-présent", "présent"]},
		{type: 0, code: 'CS', name: 'Chariot stable', values: ["instable", "stable"]},
		{type: 0, code: 'AP', name: 'Bras',           values: ["tapis 1", "tapis 2"]},
		{type: 0, code: 'PP', name: 'Plongeur',       values: ["levé", "baissé"]},
		{type: 0, code: 'DE', name: 'Bac d\'entrée',  values: ["pas vide", "vide"]},
		
		// actuators
		{type: 1, code: 'CP', name: 'Position chariot', values:
			["bac d'entrée", "tapis 1", "tapis 2", "bac ko"]},
		{type: 1, code: 'C1', name: 'Tapis 1',  values: ["arrêté", "en fonction"]},
		{type: 1, code: 'C2', name: 'Tapis 2',  values: ["arrêté", "en fonction"]},
		{type: 1, code: 'PV', name: 'Ventouse', values: ["inactif", "actif"]},
		{type: 1, code: 'PA', name: 'Plongeur', values: ["baissé", "levé"]},
		{type: 1, code: 'AA', name: 'Bras',     values: ["tapis 1", "tapis 2"]},
		{type: 1, code: 'GA', name: 'Grappin',  values: ["inactif", "actif"]},
	];

	this.connect = function() {
		var self = this;
		
		this.socket = new WebSocket("ws://" + self.server + ":" + self.port + "/", "petrasock");
		
		this.socket.onopen = function() {
			$('#status').html('Connecté au serveur');
			$('#status').attr('class', 'success');
			
			// request current gpio status
			self.write('status', null);
		}
		
		this.socket.onmessage = function(msg) {
			json = JSON.parse(msg.data);
			console.log(json);
			
			if(json.event == 'petra-change') {
				self.updateallbuttons(json.data);				
				return;
			}
			
			$('#status').html('Unknown event: ' + json.event);
		}
		
		this.socket.onclose = function() {
			$('#status').html('Connection lost');
			$('#status').attr('class','error');
			
			// retry to connect
			setTimeout(function() { self.connect() }, 2000);
			self.disableall();
		}
	};
	
	this.toggle = function(id) {
		this.write('toggle', {port: id});
	};

	this.write = function(req, payl) {
		if(this.socket.readyState != this.socket.OPEN)
			return;
		
		this.socket.send(JSON.stringify({
			request: req,
			payload: payl
		}));
	};

	this.updateallbuttons = function(data) {
		// sensors
		for(var i = 0; i < data[0].length; i++)
			this.updatebutton(data[0][i]);
		
		// actuators
		for(var i = 0; i < data[1].length; i++)
			this.updatebutton(data[1][i]);
	};

	this.updatebutton = function(node) {
		$('#button_' + node.code).removeClass('on');
		$('#button_' + node.code).removeClass('off');
		$('#button_' + node.code).removeClass('disabled');
		$('#button_' + node.code).addClass((node.value) ? 'on' : 'off');
		
		for(i = 0; i < this.buttons.length; i++)
			if(this.buttons[i].code == node.code)
				break;
				
		$('#button_' + node.code).html(
			this.buttons[i].name + ': ' + this.buttons[i].values[node.value]
		);
	};

	this.createall = function() {
		$('.data #sensors').html('');
		
		for(i = 0; i < this.buttons.length; i++) {
			oclass = 'off button';
			ojs    = 'petraremote.toggle(\'' + this.buttons[i].code + '\');';
			oid    = 'button_' + this.buttons[i].code;
			type   = (this.buttons[i].type) ? "actuators" : "sensors";
			
			$('.data #' + type).append(
				'<span id="' + oid + '" class="' + oclass + '"' + 
				((this.buttons[i].type) ? ' onclick="' + ojs + '"' : '') + '">' + 
				this.buttons[i].name + 
				'</span>'
			);
			
			$('.data #' + type).append('<br />');
		}
	};
	
	this.disableall = function() {
		$(".data span").each(function(index) {
			$(this).attr('class', 'disabled button');
		});
	};
	
	this.createall();
	this.connect();
};
