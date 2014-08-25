//
// Rennequinepolis
// RechPlaces implementation
//
// Author: Daniel Maxime, 2326
// 

var util    = require('util');
var events  = require('events');
var oracle  = require("./modules/oracle");
var http    = require('http');

var RechPlaces = function() {
	var self = this;
	events.EventEmitter.call(this);
	
	var oradata = {
		'hostname': '10.142.1.101',
		'user': 'maxux_cc1',
		'password': 'maxux_cc1',
		'database': 'orcl',
	};
	
	this.connection = null;
	
	//
	// single movie information
	//
	
	this.single = function(movie, response, root) {
		var calling = new events.EventEmitter();
		var remain = 0;
		
		self.connection.execute(
			"CALL SGBDCC.MovieInfo(:1, :2, :3, :4)",
			[
				movie,
				new oracle.OutParam(oracle.OCCICURSOR),
				new oracle.OutParam(oracle.OCCICURSOR),
				new oracle.OutParam(oracle.OCCICURSOR)
			],
			function(error, results) {
				console.log(error);
				self.singleset(results, response);
			}
		);
		
		return calling;
	};
	
	this.singleset = function(results, response) {
		if(results == undefined) {
			response.set({'Content-Type': 'application/json'});
			response.send(JSON.stringify({error: "error"}));
			return;
		}
		
		console.log(results);
		var rs = results;
		
		var data = {
			movie: {
				id: rs.returnParam[0].ID,
				title: rs.returnParam[0].TITLE,
				overview: rs.returnParam[0].OVERVIEW,
				certification: rs.returnParam[0].CERTIFICATION,
				image: rs.returnParam[0].IMAGE.toString('base64'),
			},
			actors: [],
			progra: []
		};
		
		for(var i = 0; i < rs.returnParam1.length; i++)
			data.actors.push(rs.returnParam1[i].NAME);
		
		for(var i = 0; i < rs.returnParam2.length; i++) {
			data.progra.push({
				timeslot: rs.returnParam2[i].TIME_SLOT,
				day: rs.returnParam2[i].DAY,
				room: rs.returnParam2[i].ROOM,
				remaining_seats: rs.returnParam2[i].REMAINING_SEATS,
				seats: rs.returnParam2[i].SEATS
			});
		}
		
		response.set({'Content-Type': 'application/json'});
		response.send(JSON.stringify(data));
	};
	
	//
	// movie set information
	//
	
	this.search = function(fields, response, root) {
		var calling = new events.EventEmitter();
		var movies = [];
		var remain = 0;
		var args   = [];
		var argidx = 1;
		
		var request = "DECLARE                     \n" +
			      "v_data SGBDCC.RecordSearch; \n" +
			      "BEGIN                       \n";
		
		if(fields.popularity_value != undefined) {
			request += "v_data.popularity_value := :" + (argidx++) + ";\n";
			args.push(fields.popularity_value);
			
			request += "v_data.popularity_type := :" + (argidx++) + ";\n";
			args.push(fields.popularity_type);
		}
		
		if(fields.perenity_value != undefined) {
			request += "v_data.perenity_value := :" + (argidx++) + ";\n";
			args.push(fields.perenity_value);
			
			request += "v_data.perenity_type := :" + (argidx++) + ";\n";
			args.push(fields.perenity_type);
		}
		
		if(fields.title != undefined) {
			request += "v_data.title := :" + (argidx++) + ";\n";
			args.push(fields.title);
		}
			
		request += "SGBDCC.Search(v_data, :" + (argidx++) + ");\n";
		request += "END;\n";
		
		args.push(new oracle.OutParam(oracle.OCCICURSOR));
		
		console.log(request);
		console.log(args);
		
		self.connection.execute(
			request,
			args,
			function(error, results) {
				if(error != undefined)
					console.log(error);
				
				self.todayset(results, response);
			}
		);
		
		return calling;
	};
	
	this.today = function(response, root) {
		var calling = new events.EventEmitter();
		var movies = [];
		var remain = 0;
		
		self.connection.execute(
			"call sgbdcc.MovieSearch(:1)",
			[
				new oracle.OutParam(oracle.OCCICURSOR)
			],
			function(error, results) {
				self.todayset(results, response);
			}
		);
		
		return calling;
	};
	
	this.todayset = function(results, response) {
		if(results == undefined) {
			response.set({'Content-Type': 'application/json'});
			response.send(JSON.stringify({error: "error"}));
			return;
		}
		
		var data = results.returnParam;
		var setlist = [];
		
		for(var i = 0; i < data.length; i++) {
			console.log(data[i]);
			var item = {
				movie: {
					id: data[i].ID,
					title: data[i].TITLE,
					overview: data[i].OVERVIEW,
					certification: data[i].CERTIFICATION,
					popularity: data[i].POPULARITY,
					perenity: data[i].PERENITY,
				},
				image: data[i].IMAGE.toString('base64')
			};
			
			setlist.push(item);
		}
		
		response.set({'Content-Type': 'application/json'});
		response.send(JSON.stringify(setlist));
	};
	
	
	//
	// http handling
	//
	this.parse = function(response, query) {
		if(typeof query.ids == 'string')
			query.ids = [query.ids];
		
		console.log(query);
		
		if(query.today != undefined) {
			var handler = new this.today(response, this);
			
		} else if(query.movie != undefined) {
			var handler = new this.single(query.movie, response, this);
			
		} else var handler = new this.search(query, response, this);
	};
	
	oracle.connect(oradata, function(error, connection) {
		if(error) {
			console.log(error);
			process.exit(1);
		}
		
		self.connection = connection;
		console.log("[+] oracle: connected");
	});
	
	console.log("[+] rechplaces: initializing");
};

util.inherits(RechPlaces, events.EventEmitter);
module.exports = RechPlaces;
