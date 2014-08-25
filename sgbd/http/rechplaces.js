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
			remain: data[0].remaining_seats
		}]
	}];
	
	for(var i = 1; i < data.length; i++) {
		var found = 0;
		
		for(var j = 0; j < ordered.length; j++) {
			if(ordered[j].day == data[i].day) {
				ordered[j].show.push({
					room: data[i].room,
					seats: data[i].seats,
					timeslot: data[i].timeslot,
					remain: data[i].remaining_seats
				});
				
				found = 1;
			}
		}
		
		if(!found) {
			ordered.push({
				day: data[i].day,
				show: [{
					room: data[i].room,
					seats: data[i].seats,
					timeslot: data[i].timeslot,
					remain: data[i].remaining_seats
				}]
			})
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
	
	for(var i = 0; i < ordered.length; i++) {
		ordered[i].show = ordered[i].show.sort(cmp2);
	}
	
	return ordered.sort(cmp1);
}

function getDateString(value) {
	return value.getDate() + "/" + (value.getMonth() + 1);
}

function progtable(data) {
	var ordered = orderdata(data);
	var output = '';
	var slots = ["", "10h", "14h", "18h", "22h"];
	
	for(var i = 0; i < ordered.length; i++) {
		output += '<h2>' + getDateString(new Date(ordered[i].day)) + '</h2>';
		output += '<ul>';
		
		for(var j = 0; j < ordered[i].show.length; j++) {
			var temp = ordered[i].show[j];
			output += '<li>[' + slots[temp.timeslot] + 
			          '] salle #' + temp.room + ': ' + 
			          temp.remain + '/' + temp.seats + ' places restantes</li>';
		}
		
		output += '</ul>';
	}
	
	return output;
}

function moreinfo(data) {
	console.log(data);
	
	var html = $('<div id="moreinfo">').html(
		'<h1>' + data.movie.title + '</h1>' +
		'<h2>Certifié: ' + data.movie.certification + ' | ' +
		'<a href="#" onclick="$(\'#summary\').hide(); $(\'#progra\').show();">voir la programmation</a></h2>' +
		
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
		
		'<div id="progra" style="width: 60%; display: none;">' + 
		progtable(data.progra)
	);
	
	$.fancybox(html);
}

function movieinfo(id) {
	$.post('/rechplaces', {movie: id}).done(moreinfo);
}

$(document).ready(function() {
	$.post('/rechplaces', {today: true}).done(movielist);
});
