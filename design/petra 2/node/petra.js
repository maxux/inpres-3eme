//
// Petra Remote Control
// Daniel Maxime, 2326
// 

var PetraWebSocket = require('./petra.websocket.js');
var WebSocket = new PetraWebSocket(8081, handler);

var PetraServer = require('./petra.server.js');
var petra = new PetraServer('syna', 8788);

var express = require('./modules/express');
var app = express();

// static contents
app.use(express.static('./http'));

// dynamic contents
app.use(express.bodyParser());
app.listen(8080);


/* root handler on new connection */
function handler(connection) {
	var petra_change = function(value) {
		console.log("[+] Sending update to <" + connection.remoteAddress + ">");
		connection.sendUTF(JSON.stringify({
			event: "petra-change",
			data: value
		}));
	};
	
	var connection_message = function(message) {
		if(message.type != 'utf8')
			return;
		
		try {
			console.log('[+] Client <' + connection.remoteAddress + '>: ' + message.utf8Data);
			petra.request(JSON.parse(message.utf8Data), connection);
			
		} catch(err) {
			console.log(err);
		}
	};
	
	petra.on('petra-change', petra_change);
	connection.on('message', connection_message);
	
	// removing each handlers listeners on close
	connection.on('close', function() {
		connection.removeAllListeners();	
		petra.removeListener('petra-change', petra_change);
	});
}

