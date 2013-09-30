var http = require('http');
var util = require('util');
var events = require('events');

var MaxuxCouchDB = function(host, port) {
	var options = {
		host: host,
		port: port,
		path: null,
	};
	
	events.EventEmitter.call(this);
	
	this.request = function(path, __call_options) {
		console.log('[+] couchdb: loading ' + path);
		options.path = path;
		
		var req = http.request(options, function(resp) {
			var data = '';
			
			// appending chunk
			resp.on('data', function(chunk) {
				data += chunk;
			});
			
			resp.on('end', function() {
				console.log('[+] couchdb: ' + path + ' downloaded');
				req.emit('json', JSON.parse(data), __call_options);
			});
			
		}).on('error', function(e) {console.log("[-] request: " + e.message);});

		req.end();
		return req;
	}
};

util.inherits(MaxuxCouchDB, events.EventEmitter);
module.exports = MaxuxCouchDB;
