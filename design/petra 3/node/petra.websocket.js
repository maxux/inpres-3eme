var WebSocketServer = require('websocket').server;
var http = require('http');

var PetraWebSocket = function(port, handler) {
	var server = http.createServer(function(req, response) {
		response.writeHead(404);
		response.end();
		
	}).listen(port);

	wsServer = new WebSocketServer({
		httpServer: server,
		autoAcceptConnections: false
	});

	function valide(origin) {
		// check origin
		return true;
	}
	
	wsServer.on('request', function(request) {
		if(!valide(request.origin)) {
			request.reject();
			return;
		}
		
		// accpting connection
		try {
			var connection = request.accept('petrasock', request.origin)
			
		} catch(err) {
			console.log("[-] WebSocket: error: " + err);
			return;
		}
		
		console.log('[+] WebSocket: client accepted: ' + request.remoteAddress);
		
		new handler(connection);
		
		connection.on('close', function() {
			console.log('[+] WebSocket: client disconnected');
		});
	});
};

module.exports = PetraWebSocket;
