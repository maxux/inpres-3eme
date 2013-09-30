//
// Rennequinepolis
// RechCI implementation
//
// Author: Daniel Maxime, 2326
// 

var util = require('util');
var events = require('events');
var sqlite3 = require('./modules/sqlite3').verbose();

var RechCI = function(db_file) {
	var db = new sqlite3.Database(db_file);
	events.EventEmitter.call(this);
	
	this.tableappend = function(table, from, where) {
		from.push(table);
		where.push(table + '.id = t.id');
		
		return table;
	};
	
	this.search = function(fields, response, root) {
		var calling = new events.EventEmitter();
		var self = this;
		
		// building query multipart
		var from  = new Array('title t');
		var where = new Array();
		var args  = {};
		
		if(fields.title != undefined) {
			where.push('t.key LIKE $title');
			args.$title = '%' + fields.title + '%';
		}
		
		if(fields.actor != undefined) {
			var alias = root.tableappend('actors_name', from, where);
			where.push(alias + '.key LIKE $actor');
			args.$actor = '%' + fields.actor + '%';
		}
		
		if(fields.director != undefined) {
			var alias = root.tableappend('directors_name', from, where);
			where.push(alias + '.key LIKE $director');
			args.$director = '%' +  fields.director + '%';
		}
		
		if(fields.genre != undefined) {
			var alias = root.tableappend('genres_name', from, where);
			where.push(alias + '.key LIKE $genre');
			args.$genre = '%' + fields.genre + '%';
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
				fields.vote_max = 9999999999;
			
			// skip if full range
			if(fields.vote_min != 0 || fields.vote_max != 9999999999) {
				var alias = root.tableappend('vote_count', from, where);
				where.push(alias + '.key >= $vote_min AND ' + alias + '.key <= $vote_max');
				args.$vote_min = fields.vote_min;
				args.$vote_max = fields.vote_max;
			}
		}
		
		//
		// DATE: load it at boot from sql
		//
		
		
		var sqlquery = "SELECT t.id, t.key FROM " + from.join(', ') + 
		               " WHERE " + where.join(' AND ') + " LIMIT 10";
		 
		console.log(sqlquery);
		console.log(args);
		// return calling;
		
		db.all(
			sqlquery,
			args,
			function(err, rows) {
				// console.log(rows);
				
				if(rows != undefined)
					calling.emit('got-results', response, rows);
					
				else calling.emit('got-results', response, []);
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
	
	console.log("[+] rech ci: initialized");
};

util.inherits(RechCI, events.EventEmitter);
module.exports = RechCI;
