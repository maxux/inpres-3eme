//
// Rennequinepolis
// Loader for cache database
//
// Author: Daniel Maxime, 2326
// 

// loading required libraries
var fs = require('fs');

// FIXME
fs.unlinkSync('./db/cache.sqlite3');

// opening sqlite 
if(!fs.existsSync('./db/cache.sqlite3')) {
	console.log('[+] core: database not found');
	
	// loading CouchDB views and creating index on sqlite
	var SetupCI = require('./polis-setupci.js');
	setupci = new SetupCI('10.142.1.2', 5984, './db/cache.sqlite3');
	setupci.run();
	
} else console.log('[+] core: database already exists');
