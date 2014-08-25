//
// Rennequinepolis
// RechCI implementation
//
// Author: Daniel Maxime, 2326
// 

var util    = require('util');
var events  = require('events');
var sqlite3 = require('./modules/sqlite3').verbose();
var MaxuxCouchDB = require('./modules/maxux-couch/maxux-couch');
var oracle  = require("./modules/oracle");
var http    = require('http');

var AlimCB = function(db_file) {
	var db = new sqlite3.Database(db_file);
	events.EventEmitter.call(this);
	
	var couch_host = '10.142.1.2';
	var couch_port = 5984;
	var baseurl    = '/movies/';
	var self       = this;
	
	this.def_mean     = 7.5;
	this.def_stddev   = 2;
	this.picture_base = 'http://cf2.imgobject.com/t/p/' + 'w185/';
	
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
		var self      = this;
		
		var actors    = new Array();
		var directors = new Array();
		var genres    = new Array();
		var companies = new Array();
		var languages = new Array();
		
		this._movie = movie;
		
		if(movie.data.poster_path != null)
			this._path  = root.picture_base + movie.data.poster_path;
			
		else this._path = null;
		
		var args    = [
			movie.data._id,
			movie.data.title,
			movie.data.vote_average,
			movie.data.vote_count,
			movie.count,
			movie.data.overview,
			null,
			(movie.data.release_date != "") ? new Date(movie.data.release_date) : null,
			(movie.data.certification == undefined) ? null : movie.data.certification,
			movie.data.runtime,
		];
		
		if(movie.data.production_countries.length > 0)
			args[10] = movie.data.production_countries[0].iso_3166_1;
			
		else args[10] = null;
		
		var argind = 12;
		//
		// actors
		//
		for(var i = 0; i < movie.data.actors.length; i++) {
			actors.push(':' + (argind));
			args[argind++ - 1] = movie.data.actors[i].name;
		}
		
		//
		// directors
		//
		for(var i = 0; i < movie.data.directors.length; i++) {
			directors.push(':' + (argind));
			args[argind++ - 1] = movie.data.directors[i].name;
		}
		
		//
		// genres
		//
		for(var i = 0; i < movie.data.genres.length; i++) {
			genres.push(':' + (argind));
			args[argind++ - 1] = movie.data.genres[i].name;
		}
		
		//
		// companies
		//
		for(var i = 0; i < movie.data.production_companies.length; i++) {
			companies.push(':' + (argind));
			args[argind++ - 1] = movie.data.production_companies[i].name;
		}
		
		//
		// languages
		//
		for(var i = 0; i < movie.data.spoken_languages.length; i++) {
			languages.push(':' + (argind));
			args[argind++ - 1] = movie.data.spoken_languages[i].iso_639_1.toUpperCase();
		}
		
		var stuff = 
			"DECLARE                         \n" +
			"  m movies%rowtype;             \n" +
			"  x_a artists_t;                \n" +
			"  x_d artists_t;                \n" +
			"  x_g genres_t;                 \n" +
			"  x_c companies_t;              \n" +
			"  x_l langs_t;                  \n" +
			"BEGIN                           \n" +
			"  m.id := :1;                   \n" +
			"  m.title := :2;                \n" +
			"  m.vote_average := :3;         \n" +
			"  m.vote_count := :4;           \n" +
			"  m.nb_copies := :5;            \n" +
			"  m.overview := :6;             \n" +
			"  m.rating := :7;               \n" +
			"  m.released_date := :8;        \n" +
			"  m.certification := :9;        \n" +
			"  m.runtime := :10;             \n" +
			"  m.production_country := :11;  \n" +
			"  x_a := artists_t(" + actors.join(',')    + "); \n" +
			"  x_d := artists_t(" + directors.join(',') + "); \n" +
			"  x_g := genres_t("  + genres.join(',')    + "); \n" +
			"  x_c := companies_t(" + companies.join(',') + "); \n" +
			"  x_l := langs_t("  + languages.join(',') + "); \n" +
			"  SGBDCB.AlimCB(m, x_a, x_d, x_g, x_c, x_l); \n" + 
			"END;                            ";
			
		console.log(stuff);
		console.log(args);
		
		root.connection.execute(stuff, args, function(err, results) {
			if(err != undefined) {
				console.log(err);
				calling.emit('download-finished');
				return;
			}
			
			console.log(results);				
			
			if(self._path == null) {
				console.log("[-] no poster found, skipping");
				calling.emit('download-finished');
				return;
			}
			
			var options = {
				host: '10.142.1.103',
				port: 80,
				path: 'blob.php?image=' + self._path + '&movie=' + self._movie.data._id
			};
			
			console.log(options);
			
			var req = http.request(options, function(resp) {
				resp.on('data', function(chunk) {
					console.log('[+] download finished: ' + chunk);
					calling.emit('download-finished');
				});
				
			});
			
			req.on('error', function(e) {
				console.log("[-] request: " + e.message);
				calling.emit('download-finished');
			});

			req.end();
		});
		
		console.log("[+] waiting response from Oracle database");
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
					new opts.parent.process(opts.root.movies[opts.index], calling, opts.parent);
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
			// response.set({'Content-Type': 'text/html'});
			response.send("<pre>Commande: " + items.length + " film(s) commandé(s)</pre>");
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
