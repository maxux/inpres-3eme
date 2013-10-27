//
// Rennequinepolis
// RechCI implementation
//
// Author: Daniel Maxime, 2326
// 

var util = require('util');
var events = require('events');
var sqlite3 = require('./modules/sqlite3').verbose();
var MaxuxCouchDB = require('./modules/maxux-couch/maxux-couch');
var oracle = require("./modules/oracle");

var AlimCB = function(db_file) {
	var db = new sqlite3.Database(db_file);
	events.EventEmitter.call(this);
	
	var couch_host = '10.142.1.2';
	var couch_port = 5984;
	var baseurl    = '/movies/';
	var self       = this;
	
	this.def_mean   = 7.5;
	this.def_stddev = 2;
	
	var picture_base = 'http://cf2.imgobject.com/t/p/' + 'w185/';
	
	var oradata = {
		'hostname': '10.142.1.101',
		'user': 'maxux_cb',
		'password': 'maxux_cb',
		'database': 'orcl',
	};
	
	this.connection = null;
	
	this.gaussian = function(mean, stddev) {
		var theta = 2 * Math.PI * Math.random();
		var rho = Math.sqrt(-2 * Math.log(1 - Math.random()));
		var scale = stddev * rho;

		return Math.abs(Math.round(mean + scale * Math.cos(theta)));
	};
	
	//
	// prepare and sending all the stuff to PL/SQL part
	// this should be done for each movie to transfert
	//
	this.process = function(movie, calling, root) {
		console.log(movie);
		
		var artists = new Array();
		var args    = [
			movie.data.title,
			movie.data.vote_average,
			movie.data.vote_count,
			movie.count,
			movie.data.overview,
			null,
			new Date(movie.data.release_date),
			(movie.data.certification == undefined) ? null : movie.data.certification,
			movie.data.runtime,
		];
		
		var stuff = 
			"DECLARE                         " +
			" m movies%rowtype;              " +
			" s artists_t;                   " +
			"BEGIN                           " +
			"  m.title := :1;                " +
			"  m.vote_average := :2;         " +
			"  m.vote_count := :3;           " +
			"  m.nb_copies := :4;            " +
			"  m.overview := :5;             " +
			"  m.rating := :6;               " +
			"  m.released_date := :7;        " +
			"  m.certification := :8;        " +
			"  m.runtime := :9;              " +
			"  m.production_country := :10;  ";
			;
		
		if(movie.data.production_countries.length > 0)
			args[9] = movie.data.production_countries[0].iso_3166_1;
			
		else args[9] = null;
		
		for(var i = 0; i < movie.data.actors.length; i++) {
			artists.push(':' + (i + 11));
			args[i + 10] = movie.data.actors[i].name;
		}
		
		stuff += 
			"  s := artists_t(" + artists.join(',') + "); ";
		
		stuff += 
			"  SGBDCB.AlimCB(m, s);          " +
			"END;                            ";
		
		console.log(stuff);
		console.log(args);
		
		root.connection.execute(stuff, args, function(err, results) {
			console.log(err);
			console.log(results);
		});
	};
	
	this.alim = function(fields, response, root) {
		var calling = new events.EventEmitter();
		var self    = this;
		this.remain  = fields.ids.length;
		this.movies  = new Array();
		
		for(var i = 0; i < fields.ids.length; i++) {
			this.movies[i] = {
				id: parseInt(fields.ids[i]),
				count: root.gaussian(root.def_mean, root.def_stddev)
			};
			
			var couch = new MaxuxCouchDB(couch_host, couch_port);
		
			console.log('[+] preview: processing: ' + this.movies[i].id);
			couch.request(baseurl + this.movies[i].id, {parent: root, root: self, index: i}).on('json',
				function(json, opts) {
					// copy json data
					opts.root.movies[opts.index].data = json;
					
					// calling database processing
					opts.parent.process(opts.root.movies[opts.index], calling, opts.parent);
				}
			);
		}
		
		//
		// fired when a movie is fully parsed and inserted into CB
		//
		calling.on('process-done', function(id) {
			if(--self.remain == 0)
				self.calling.emit('download-finished', self.movies);
		});
		
		//
		// fired when everything is done, returning data to client
		//
		calling.on('download-finished', function(movies) {
			console.log(movies);
			
			// processing
			calling.emit('got-results', response, self.movies);
		});
		
		return calling;
	};
	
	this.parse = function(response, query) {
		if(typeof query.ids == 'string')
			query.ids = [query.ids];
		
		console.log(query);
		
		var handler = new this.alim(query, response, this);
		
		handler.on('got-results', function(response, items) {
			console.log(items);
			
			response.set({'Content-Type': 'application/json'});
			response.send(JSON.stringify(items));
		});
	};
	
	oracle.connect(oradata, function(error, connection) {
		if(error) {
			console.log(error);
			process.exit(1);
		}
		
		self.connection = connection;
		console.log("[+] oracle: connected");
	});
	
	console.log("[+] alim cb: initializing");
};

util.inherits(AlimCB, events.EventEmitter);
module.exports = AlimCB;
