//
// Rennequinepolis
// Static web pages server, used for web-ui
//
// Author: Daniel Maxime, 2326
// 

var express = require('./modules/express');

//
// load interfaces
//
var CmdPlaces = require('./polis-cmdplaces.js');
cmdplaces = new CmdPlaces();

//
// provides a more complexe web server
// which parse the query and reply from cache database
// and give a static file access to http folder
//
var app = express();

// static contents
app.use(express.static('./http'));

// dynamic contents
app.use(express.bodyParser());

app.post('/rechplaces', function(req, res) {
	cmdplaces.parse(res, req.body);
});

app.post('/cmdplaces', function(req, res) {
	cmdplaces.save(res, req.body);
});

app.listen(8080);
