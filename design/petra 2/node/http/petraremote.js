var PetraRemote = function() {
	this.socket;
	this.self = this;
	
	this.sensors = [
		{code: 'L1', name: 'Cut-Out #1'},
		{code: 'L2', name: 'Cut-Out #2'},
		{code: 'T',  name: 'Epaisseur'},
		{code: 'S',  name: 'Slot'},
		{code: 'CS', name: 'Chariot stable'},
		{code: 'AP', name: 'Bras'},
		{code: 'PP', name: 'Plongeur'},
		{code: 'DE', name: 'Bac d\'entrée'},
	];
	
	this.actuators = [
		{code: 'CP', name: 'Position chariot'},
		{code: 'C1', name: 'Convoyeur 1'},
		{code: 'C2', name: 'Convoyeur 2'},
		{code: 'PV', name: 'Ventouse'},
		{code: 'PA', name: 'Plongeur'},
		{code: 'AA', name: 'Bras'},
		{code: 'GA', name: 'Grappin'},
	];

	this.connect = function() {
		var self = this;
		
		this.socket = new WebSocket("ws://syna:8081/", "petrasock");
		
		this.socket.onopen = function() {
			$('#status').html('Connecté au serveur');
			$('#status').attr('class', 'success');
			
			// request current gpio status
			self.write('status', null);
		}
		
		this.socket.onmessage = function(msg) {
			json = JSON.parse(msg.data);
			console.log(json);
			
			if(json.event == 'sensors-change') {
				self.updateallsensors(json.data);				
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
		this.write('toggle', {gpio: id});
	};

	this.write = function(req, payl) {
		if(this.socket.readyState != this.socket.OPEN)
			return;
		
		this.socket.send(JSON.stringify({
			request: req,
			payload: payl
		}));
	};

	this.updateallsensors = function(data) {
		for(i = 0; i < data.length; i++)
			this.updatesensor(data[i]);
	};

	this.updatesensor = function(node) {
		$('#button_' + node.code).removeClass('on');
		$('#button_' + node.code).removeClass('off');
		$('#button_' + node.code).addClass((node.value) ? 'on' : 'off');
	};

	this.createall = function() {
		$('#data #sensors').html('');
		
		for(i = 0; i < this.sensors.length; i++) {
			// oclass = ((data[i].value) ? 'off' : 'on') + ' button';
			oclass = 'off button';
			oid    = 'button_' + this.sensors[i].code;
			
			$('#data #sensors').append(
				'<span id="' + oid + '" class="' + oclass + '">' + 
				this.sensors[i].name + 
				'</span>'
			);
			
			$('#data #sensors').append('<br />');
		}
		
		$('#data #actuators').html('');
		
		for(i = 0; i < this.actuators.length; i++) {
			// oclass = ((data[i].value) ? 'off' : 'on') + ' button';
			oclass = 'off button';
			ojs    = 'petraremote.toggle(\'' + this.actuators[i].code + '\');';
			oid    = 'button_' + this.actuators[i].code;
			
			$('#data #actuators').append(
				'<span id="' + oid + '" class="' + oclass + '" onclick="' + ojs +'">' + 
				this.actuators[i].name + 
				'</span>'
			);
			
			$('#data #actuators').append('<br />');
		}
	};
	
	this.disableall = function() {
		$("#data #sensors span").each(function(index) {
			$(this).attr('class', 'disabled button');
		});
		
		$("#data #actuators span").each(function(index) {
			$(this).attr('class', 'disabled');
		});
	};
	
	this.createall();
	this.connect();
};
