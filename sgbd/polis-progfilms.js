//
// Rennequinepolis
// Static web pages server, used for web-ui
//
// Author: Daniel Maxime, 2326
// 

var oracle  = require("./modules/oracle");
var express = require('./modules/express');

var oradata = {
	'hostname': '10.142.1.101',
	'user': 'maxux_cc1',
	'password': 'maxux_cc1',
	'database': 'orcl',
};

var self = this;
var connection;

oracle.connect(oradata, function(error, connection) {
	if(error) {
		console.log(error);
		process.exit(1);
	}
	
	self.connection = connection;
	console.log("[+] oracle: connected");
});
	
var app = express();
app.use(express.static('./http'));

// dynamic contents
app.use(express.bodyParser());

app.get('/progfilms', function(req, res) {
	res.set({'Content-Type': 'application/json'});
	
	var stuff = "SELECT * FROM projection p WHERE TRUNC(day) = TRUNC(CURRENT_DATE + 1)";
	
	self.connection.execute(stuff, [], function(err, results) {
		if(err != undefined) {
			console.log(err);
			return;
		}
		
		console.log(results);
		res.send(JSON.stringify(results));
	});
});

app.listen(8080);
