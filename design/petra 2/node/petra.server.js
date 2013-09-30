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
		
		for(var i = 0; i < json.length; i++) 
			this.sensors[i].value = json[i];
		
		this.emit('sensors-change', this.sensors);
	};
	
	this.request = function(object, connection) {
		// console.log(object);
		
		if(object.request == 'status') {
			console.log('[+] Petra: sensors-status');
			return this.sensors_status(connection);
		}
		
		if(object.request == 'poweroff') {
			console.log('[+] Petra: poweroff: ' + object.payload.sensors);
			return this.sensors_poweroff(object.payload.sensors);
		}
		
		if(object.request == 'poweron') {
			console.log('[+] Petra: poweron: ' + object.payload.sensors);
			return this.sensors_poweron(object.payload.sensors);
		}
		
		if(object.request == 'toggle') {
			console.log('[+] Petra: toggle: ' + object.payload.sensors);
			return this.sensors_toggle(object.payload.sensors);
		}
		
		if(object.request == 'ping') {
			connection.sendUTF(JSON.stringify({
				event: 'pong',
				data: null
			}));
		}
	};
	
	this.sensors_status = function(connection) {
		connection.sendUTF(JSON.stringify({
			event: 'sensors-change',
			data: this.sensors
		}));
	};
	
	this.actuators_get = function(code) {
		for(i = 0; i < this.actuators.length; i++)
			if(this.actuators[i].code == code)
				return i;
	}
	
	this.actuators_poweroff = function(actuators) {
		return this.actuators_change(this.actuators_get(actuators), 1);
	};
	
	this.actuators_poweron = function(actuators) {
		return this.actuators_change(this.actuators_get(actuators), 0);
	};
	
	this.actuators_toggle = function(actuators) {
		i = this.actuators_get(actuators);
		return this.actuators_change(i, (this.actuators[i].value) ? 0 : 1);
	};
	
	this.sensors_change = function(index, value) {
		// fs.writeFile(this.sensors_path(this.sensors[index].id), value);
				
		// update local data and notify change
		this.emit('sensors-change', this.sensors[index]);
		this.sensors[i].value = value;
		
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
			self.update(JSON.parse(data.toString()));
		});
		
		self.petra.on('end', function() {
			console.log('[-] Connection to Petra Server lost');
		});
	};
	
	this.construct();
};

util.inherits(PetraServer, events.EventEmitter);

module.exports = PetraServer;
