//
// Rennequinepolis
// SetupCI implementation
//
// Author: Daniel Maxime, 2326
// 

var util = require('util');
var events = require('events');
var sqlite3 = require('./modules/sqlite3');
var MaxuxCouchDB = require('./modules/maxux-couch/maxux-couch');

var SetupCI = function(couch_host, couch_port, db_file) {
	var couch_host = couch_host;
	var couch_port = couch_port;
	
	var couch = new MaxuxCouchDB(couch_host, couch_port);
	var db = new sqlite3.Database(db_file);
	
	var tables = [
		{view: 'actors_name',    type: 'text'},
		{view: 'certification',  type: 'text'},
		{view: 'directors_name', type: 'text'},
		{view: 'genres_name',    type: 'text'},
		{view: 'release_date',   type: 'text'},
		{view: 'title',          type: 'text'},
		{view: 'vote_average',   type: 'float'},
		{view: 'vote_count',     type: 'integer'},
	];
	
	this.calling = new events.EventEmitter();
	
	//
	// create each tables on sqlite database
	//
	this.create_table = function() {
		console.log('[+] setup ci: creating tables');
		
		db.serialize(function() {
			// creating tables
			for(var i = 0; i < tables.length; i++) {
				db.run('CREATE TABLE ' + tables[i].view + 
				       ' (id integer, key ' + tables[i].type + ', primary key (id, key))');
			}
			
			// initialize transactions
			db.run("BEGIN TRANSACTION");
			
			console.log('[+] tables created');
		});
	};
	
	//
	// trim all keys
	// warning: no type check, key must be a string
	//
	this.clean = function(json) {
		for(var i = 0; i < json.rows.length; i++)
			if(json.rows[i].key != null)
				json.rows[i].key = json.rows[i].key.trim();	
	};
	
	//
	// insert each json rows from couchdb received
	// into sqlite corresponding table
	//
	this.insert = function(json, options) {
		console.log('[+] setup ci: ' + options.table.view + ': ' +
		            'importing ' + json.rows.length + ' entries');
		
		//
		// trim data only if it's a text field
		// processing on the json before the for to avoid
		// an iterative check on type
		//
		if(options.table.type == 'text')
			options.caller.clean(json);
		
		for(var i = 0; i < json.rows.length; i++) {
			db.run(
				'INSERT OR IGNORE INTO ' + options.table.view + ' VALUES (?, ?)',
				parseInt(json.rows[i].id),
				json.rows[i].key
			);
		}

		options.caller.calling.emit('sub-process-done', json.rows.length);
	};
	
	//
	// foreach tables, downloading corresponding view
	// from couchdb then inserting result in sqlite
	//
	this.process = function() {
		var remain = tables.length;
		var total = 0;
		var baseurl = '/movies/_design/main/_view/';
		
		console.log('[+] setup ci: processing');
		
		for(var i = 0; i < tables.length; i++) {
			var options = {
				caller: this,
				table: tables[i],
			};
			
			// initialize couchdb object, there is no connection made
			// at this point
			var couch = new MaxuxCouchDB(couch_host, couch_port);
			
			console.log('[+] setup ci: processing: ' + tables[i].view);

			// downloading data from couchdb
			couch.request(baseurl + tables[i].view, options).on('json', this.insert);
		}		
		
		//
		// notify callback when everything is finished
		// just end transaction and creating sqlite index
		// then closing the database to flush everything on disk
		//
		this.calling.on('sub-process-done', function(rows) {
			total += rows;
			
			if(!--remain) {
				console.log('[+] setup ci: well done, ' + total + ' entries inserted');
				
				db.run("END TRANSACTION");
				
				for(var i = 0; i < tables.length; i++)
					db.run('CREATE INDEX ' + tables[i].view + '_key ON ' +
					       tables[i].view + ' (key)');
					       
				console.log('[+] setup ci: syncing database...');
				
				db.close();
			}
		});
	};
	
	this.run = function() {		
		this.create_table();
		this.process();
	};
	
	console.log("[+] setup ci: initialized");
};

util.inherits(SetupCI, events.EventEmitter);
module.exports = SetupCI;
