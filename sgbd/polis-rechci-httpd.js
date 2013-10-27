//
// Rennequinepolis
// Static web pages server, used for web-ui
//
// Author: Daniel Maxime, 2326
// 

var express = require('./modules/express');

//
// load RechCI interface
//
var RechCI = require('./polis-rechci.js');
rechci = new RechCI('./db/cache.sqlite3');

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

app.post('/rechci', function(req, res) {
	rechci.parse(res, req.body);
});

app.get('/rechci', function(req, res) {
	rechci.preview(res, req);
});

app.listen(8080);
