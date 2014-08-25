var currentlist = null;
var slots = ["", "10h", "14h", "18h", "22h"];
var weekdays = ["Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche"];
var months = ["janvier", "février", "mars", "avril", "mai", "juin", "juillet", "août", "septembre", "octobre", "novembre", "décembre"];

function movielist(list) {
	console.log(list);
	var delay = 0;
	
	// clearing current list
	$('#movies ul').html('');
	
	for(var i = 0; i < list.length; i++) {
		var item = list[i];
		
		$('#movies ul').append($('<li onclick="movieinfo(' + item.movie.id + ');">' +
			'<div class="image">' +
			'<img src="data:image/jpg;base64,' + item.image + '" alt="" />' +
			'<h4><span>Pérénité: ' + item.movie.perenity.toFixed(2) + '</span><br />' + 
			'<span>Popularité: ' + item.movie.popularity +  '</span></h4>' +
			'<h3>' + item.movie.title + '</h3>' +
			'</div>' +
			'</li>'
			
		).hide().delay(delay).fadeIn(400));
		
		delay += 150;
	}
}

function result(data) {
	movielist(data);
}

function ajaxsearch(root) {
	var output = {};
	
	if(root.title.value)
		output.title = root.title.value;
	
	if(root.popularity_value.value) {
		output.popularity_value = root.popularity_value.value;
		output.popularity_type = root.popularity_type.value;
	}
		
	if(root.perenity_value.value) {
		output.perenity_value = root.perenity_value.value;
		output.perenity_type = root.perenity_type.value;
	}
	
	$.post('/rechplaces', output).done(result);
			
	return false;
}

function mklist(items) {
	var output = '';
	
	for(var i = 0; i < items.length; i++) {
		if(i > 5)
			output += '<li style="display: none;">' + items[i] + '</li>';
		else output += '<li>' + items[i] + '</li>';
		
		if(i == 5)
			output += '<li onclick="$(this).remove(); $(\'#moreinfo ul li\').show();" style="cursor: hand;">voir plus</li>';
	}
	
	return output;
}

function orderdata(data) {
	var ordered = [{
		day: data[0].day,
		show: [{
			room: data[0].room,
			seats: data[0].seats,
			timeslot: data[0].timeslot,
			remain: data[0].remaining_seats,
			movie: data[0].movie,
			indice: 0
		}]
	}];
	
	for(var i = 1; i < data.length; i++) {
		var found = 0;
		var thisshow = {
			room: data[i].room,
			seats: data[i].seats,
			timeslot: data[i].timeslot,
			remain: data[i].remaining_seats,
			movie: data[i].movie,
			indice: i
		};
		
		for(var j = 0; j < ordered.length; j++) {
			if(ordered[j].day == data[i].day) {
				ordered[j].show.push(thisshow);	
				found = 1;
			}
		}
		
		if(!found) {
			ordered.push({
				day: data[i].day,
				show: [thisshow]
			});
		}
	}
	
	//
	// small ordering
	//
	function cmp1(a, b) {
		if(new Date(a.day) < new Date(b.day))
			return -1;
			
		if(new Date(a.day) > new Date(b.day))
			return 1;
			
		return 0;
	};
	
	function cmp2(a, b) {
		if(a.timeslot < b.timeslot)
			return -1;
			
		if(a.timeslot > b.timeslot)
			return 1;
			
		return 0;
	};
	
	for(var i = 0; i < ordered.length; i++)
		ordered[i].show = ordered[i].show.sort(cmp2);
	
	return ordered.sort(cmp1);
}

function getDateString(value) {
	return weekdays[value.getDay()] + ' ' +
	       value.getDate() + ' ' + 
	       months[value.getMonth()] + ' ' +
	       value.getFullYear();
}

function progtable(data) {
	// saving current list on global
	currentlist = data;
	
	var ordered = orderdata(data);
	var output = '';
	
	for(var i = 0; i < ordered.length; i++) {
		output += '<h2>' + getDateString(new Date(ordered[i].day)) + '</h2>';
		output += '<ul>';
		
		for(var j = 0; j < ordered[i].show.length; j++) {
			var temp  = ordered[i].show[j];
			var _class = 'free';
			
			if(temp.remain <= (temp.seats / 2))
				_class = 'warning';
			
			if(!temp.remain)
				_class = 'full';
			
			output += '<li class="' + _class + '">' + 
			          '<strong>[' + slots[temp.timeslot] + ']</strong> ' +
			          'salle #' + temp.room + ': ' + 
			          temp.remain + '/' + temp.seats + ' places restantes. ' +
			          ((temp.remain > 0) ?
					  '(commander ' +
					  '<input type="number" min="1" id="caddie_' + temp.indice + '" value="1" /> ' + 
					  'place(s) ' + 
					  '<button onclick="addcaddie(' + temp.indice + ');">ajouter au panier</button>)'
					  : ''
			          )
			          '</li>';
		}
		
		output += '</ul>';
	}
	
	return output;
}

function showprog(id, _page) {
	$('#summary').hide();
	$('#progra').show();
	$('#progra').html('<div class="pages">Aller à la page: </div>');
	
	var pages = [];
	
	$.post('/rechplaces', {movie: id, progra: true, page: _page}).done(function(data) {
		for(var i = 0; i < (data.total / 7).toFixed(0); i++)
			pages.push('<a href="#" onclick="showprog(' + id + ', ' + (i + 1) + ');">' + (i + 1) + '</a>');
		
		$('.pages').append('[' + pages.join(',') + ']');
		$('#progra').append(progtable(data.progra));
	});
}

function moreinfo(data) {
	console.log(data);
	
	var html = $('<div id="moreinfo">').html(
		'<h1 class="movie-info">' + data.movie.title + '</h1>' +
		'<h2>Certifié: ' + data.movie.certification + ' | ' +
		'<a href="#" onclick="showprog(' + data.movie.id + ', 1);">voir la programmation</a></h2>' +
		
		'<table id="summary" style="width: 60%;">' + 
		'<tr>' + 
		'<td><img src="data:image/jpg;base64,' + data.movie.image + '" alt="" /></td>' +
		'<td>' + data.movie.overview + '</td>' +
		'</tr>' +
		'<tr>' + 
		'<td>Acteurs:</td>' +
		'<td><ul>' + mklist(data.actors) + '</ul></td>' +
		'</tr>' +
		'</table>' +
		
		'<div id="progra" style="width: 100%; display: none;">'
	);
	
	$.fancybox(html);
}

function movieinfo(id) {
	$.post('/rechplaces', {movie: id}).done(moreinfo);
}

function isempty(obj) {
	for(var x in obj)
		return 0;
	
	return 1;
}

//
// Caddie
//
function caddiefinish(data) {
	console.log(data);
	var caddie = $.jStorage.get('caddie', {empty: true});
	
	// removing successfull movie
	for(var x in data) {
		if(data[x] == 0) {
			delete caddie[x];
			delete data[x];
			continue;
		}
	}
	
	// checking if there is some movie still present
	if(isempty(caddie)) {
		$('#current-caddie').html('Votre commande a été effecutée avec succès ! Merci.');
		$.jStorage.deleteKey('caddie');
		caddieupdate();
		return;
	}
	
	var html = 'Votre commande est passée, excepté pour le(s) film(s) suivant(s): ' +
	           '<ul>';
	           
	for(var x in data) {
		html += '<li>';
		html += '<ins>[' + getDateString(new Date(caddie[x].day)) + '] ' + caddie[x].title +
		        ', à ' + slots[caddie[x].timeslot] + ', salle #' + caddie[x].room + ':</ins><br />' + 
		        '<span class="full">';
		
		switch(data[x]) {
			case -1:
				html += 'Le nombre de place disponible n\'est plus suffisant';
			break;
			
			default:
				html += 'Erreur inconnue. Merci de signaler ceci ' + 
				'avec le code approprié [' + data[x] + '] à un administrateur.' + 
				'Merci.';
		}
		
		html += '</span></li>';
	}
	
	html += '</ul>';
	
	$('#current-caddie').html(html);
	
	$.jStorage.set('caddie', caddie);	
	caddieupdate();
}

function caddieconfirm() {
	var caddie = $.jStorage.get('caddie', {empty: true});
	
	$('#current-caddie').html('<span>Validation en cours...</span><div id="progressbar"></div>');
	$("#progressbar").progressbar({ value: false });
	
	$.post('/cmdplaces', {list: caddie}).done(caddiefinish);
}

function caddieremove(index, root) {
	var caddie = $.jStorage.get('caddie', {});
	
	delete caddie[index];
	$.jStorage.set('caddie', caddie);
	
	caddieupdate();
	$(root).parent().remove();
	
	if(!$('ul.caddie-list li').length) {
		$('#current-caddie').html('<strong>Panier vide</strong>');
		$.jStorage.deleteKey('caddie');
	}
}

function caddieshow() {
	var caddie = $.jStorage.get('caddie', {empty: true});
	console.log(caddie);
	
	var html   = '<div id="current-caddie">' + 
	             '<ul class="caddie caddie-list">';
	
	for(var x in caddie) {
		html += '<li><ins>' + caddie[x].title + '</ins>, ' + getDateString(new Date(caddie[x].day)) + '<br />' + 
		        caddie[x].count + ' place(s) ' +
		        'pour la séance de <strong>' + slots[caddie[x].timeslot] + '</strong> ' +
		        'dans la salle <strong>' + caddie[x].room + '</strong>' + 
		        '<a href="#" style="float: right;" onclick="caddieremove(\'' + x + '\', this);">[supprimer]</a>' + 
		        '</li>';
	}
	
	html += '</ul>';
	html += '<button onclick="caddieconfirm();">Valider ma commande</button>';
	html += '</div>';
	
	if(caddie.empty != undefined)
		html = '<strong>Panier vide</strong>';
	
	$.fancybox(html);
}

function caddierequest(root, _title, _count) {
	return {
		day: root.day,
		room: parseInt(root.room),
		timeslot: parseInt(root.timeslot),
		count: parseInt(_count),
		movie: root.movie,
		title: _title
	};
}

function addcaddie(id) {
	console.log(currentlist[id]);
	
	// reload caddie from backup
	var caddie = $.jStorage.get('caddie', {});
	var count  = $('#caddie_' + id).val();
	var index  = currentlist[id].day + '-' + 
	             currentlist[id].room + '-' +
	             currentlist[id].timeslot + '-' +
	             currentlist[id].movie;
	
	// if already exists, updating count, else inserting new one
	if(caddie[index] == undefined || caddie[index] == null)
		caddie[index] = caddierequest(currentlist[id], $('h1.movie-info').html(), count);
		
	else caddie[index].count += parseInt(count);
	
	// saving caddie
	$.jStorage.set('caddie', caddie);
		
	caddieupdate();
}

function caddieupdate() {
	var caddie = $.jStorage.get('caddie', {});
	console.log(caddie);
	
	var total = 0;
	
	for(var x in caddie)
		total += caddie[x].count;
		
	$('.caddie a.root-summary').html('Panier: ' + total + ' place' + ((total > 1) ? 's' : ''));
}

$(document).ready(function() {
	$.post('/rechplaces', {today: true}).done(movielist);
	caddieupdate();
});
