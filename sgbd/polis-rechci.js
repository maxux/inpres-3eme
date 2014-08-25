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

var RechCI = function(db_file) {
	var db = new sqlite3.Database(db_file);
	events.EventEmitter.call(this);
	
	var couch_host = '10.142.1.2';
	var couch_port = 5984;
	var baseurl = '/movies/';
	
	this.tableappend = function(table, from, where, indice) {
		// alias with indice appended if set
		if(indice != undefined)
			var temp = table + indice;
		else
			var temp = table;
		
		from.push(table + ' ' + temp);
		where.push(temp + '.id = t.id');
		
		return temp;
	};
	
	this.search = function(fields, response, root) {
		var calling = new events.EventEmitter();
		var self = this;
		
		// building query multipart
		var from  = new Array('title t');
		var where = new Array();
		var args  = {};
		
		if(fields.id != undefined) {
			where.push('t.id = $id');
			args.$id = fields.id;
		}
		
		if(fields.title != undefined) {
			where.push('t.key LIKE $title');
			args.$title = '%' + fields.title + '%';
		}
		
		if(fields.actor != undefined) {
			// split different actors
			var list = fields.actor.split(',');
			
			// iterate on each actors
			for(var i = 0; i < list.length; i++) {
				var alias = root.tableappend('actors_name', from, where, i);
				where.push(alias + '.key LIKE $actor' + i);
				
				// affecting variable value and trim spaces
				eval('args.$actor' + i + ' = \'%' + list[i].trim() + '%\';');
			}
		}
		
		if(fields.director != undefined) {
			var list = fields.director.split(',');
			
			for(var i = 0; i < list.length; i++) {
				var alias = root.tableappend('directors_name', from, where, i);
				where.push(alias + '.key LIKE $director' + i);				
				eval('args.$director' + i + ' = \'%' + list[i].trim() + '%\';');
			}
		}
		
		if(fields.genre != undefined) {
			var alias = root.tableappend('genres_name', from, where);
			where.push(alias + '.key LIKE $genre');
			args.$genre = '%' + fields.genre + '%';
		}
		
		if(fields.certification != undefined) {
			var alias = root.tableappend('certification', from, where);
			where.push(alias + '.key LIKE $certif');
			args.$certif = '%' + fields.certification + '%';
		}
		
		if(fields.vote_avg_min != undefined || fields.vote_avg_max != undefined) {
			if(fields.vote_avg_min == undefined || isNaN(parseFloat(fields.vote_avg_min)))
				fields.vote_avg_min = 0;
			
			if(fields.vote_avg_max == undefined || isNaN(parseFloat(fields.vote_avg_max)))
				fields.vote_avg_max = 10;
			
			// skip if full range
			if(fields.vote_avg_min != 0 || fields.vote_avg_max != 10) {
				var alias = root.tableappend('vote_average', from, where);
				where.push(alias + '.key >= $vote_avg_min AND ' + alias + '.key <= $vote_avg_max');
				args.$vote_avg_min = fields.vote_avg_min;
				args.$vote_avg_max = fields.vote_avg_max;
			}
		}
		
		if(fields.vote_min != undefined || fields.vote_max != undefined) {
			if(fields.vote_min == undefined || isNaN(parseFloat(fields.vote_min)))
				fields.vote_min = 0;
			
			if(fields.vote_max == undefined || isNaN(parseFloat(fields.vote_max)))
				fields.vote_max = 9999999999; // Luuuulz
			
			// skip if full range
			if(fields.vote_min != 0 || fields.vote_max != 9999999999) {
				var alias = root.tableappend('vote_count', from, where);
				where.push(alias + '.key >= $vote_min AND ' + alias + '.key <= $vote_max');
				args.$vote_min = fields.vote_min;
				args.$vote_max = fields.vote_max;
			}
		}
		
		if(fields.release_min != undefined || fields.release_max != undefined) {
			if(fields.release_min == undefined || isNaN(parseFloat(fields.release_min)))
				fields.release_min = '1000-01-01';
			
			if(fields.release_max == undefined || isNaN(parseFloat(fields.release_max)))
				fields.vote_max = '3000-01-01'; // Luuuulz
			
			// skip if full range
			if(fields.vote_min != '1000-01-01' || fields.vote_max != '3000-01-01') {
				var alias = root.tableappend('release_date', from, where);
				where.push(alias + '.key >= $release_min AND ' + alias + '.key <= $release_max');
				
				args.$release_min = fields.release_min;
				args.$release_max = fields.release_max;
			}
		}
		
		//
		// DATE: load it at boot from sql
		//
		
		
		var sqlquery = "SELECT t.id, t.key FROM " + from.join(', ') + 
		               " WHERE " + where.join(' AND ') + " LIMIT 50";
		 
		console.log(sqlquery);
		console.log(args);
		// return calling;
		
		db.all(
			sqlquery,
			args,
			function(err, rows) {
				if(rows == undefined)
					rows = [];
				
				calling.emit('got-results', response, rows);
			}
		);
		
		return calling;
	};
	
	this.parse = function(response, query) {
		console.log('[+] rech ci: query: ');
		console.log('[+] rech ci: ---------');
		console.log(query);
		console.log('[+] rech ci: ---------');
		
		var handler = new this.search(query, response, this);
		
		handler.on('got-results', function(response, items) {
			console.log(items);
			
			response.set({'Content-Type': 'application/json'});
			response.send(JSON.stringify(items));
		});
	};
	
	this.preview = function(response, request) {
		response.set({'Content-Type': 'application/json'});
		
		if(request.query.id == undefined) {
			response.send(JSON.stringify({error: 'invalid id'}));
			return;
		}
		
		var couch = new MaxuxCouchDB(couch_host, couch_port);
		
		console.log('[+] preview: processing: ' + request.query.id);
		couch.request(baseurl + request.query.id).on('json', function(json) {
			response.send(JSON.stringify(json));
		});
	};
	
	console.log("[+] rech ci: initialized");
};

util.inherits(RechCI, events.EventEmitter);
module.exports = RechCI;
