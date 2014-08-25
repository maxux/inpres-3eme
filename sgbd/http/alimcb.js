$(document).ready(function() {
	$.datepicker.setDefaults($.datepicker.regional["fr"]);
	
	$('.date').datepicker({
		dateFormat: 'yy-mm-dd',
	});
});

function result(data) {
	console.log(data);
	var table = $('#result table');
	
	table.empty();
	
	if(!data.length)
		table.append($('<tr>').html($('<td>').html('Aucun résultat')));
	
	for(var i = 0; i < data.length; i++) {
		ckbox = '<input type="checkbox" checked="checked" name="ids" value="' + data[i].id + '" />';
		span  = '<span onclick="preview(\'' + data[i].id  + '\')">' + data[i].key + '</span>';
		
		table.append($('<tr>').html($('<td>').html(ckbox + ' ' + span)));
	}
	
	$('#alim').css('display', 'block');
}

function mklist(items) {
	var html = '<ul>';
	
	if(items.name == undefined) {	
		for(var index in items)
			html += '<li>' + items[index].name + '</li>';
			
	} else html += '<li>' + items.name + '</li>';
	
	html += '</ul>';
	
	return html;
}

function mktable(items) {
	var html = '<table>';
	
	for(var index in items) {
		html += '<tr><td>' + index + '</td><td>';
			
		if(typeof items[index] == 'object' && items[index] != null) {
			html += mklist(items[index]);
			
		} else html += items[index];
		
		html += '</td>';
	}
	
	html += '</table>';
	
	return html;
}

function preview(id) {
	$.get('/rechci?id=' + id).done(function(data) {
		console.log(data);
		$.fancybox(mktable(data));
	});
}

function ajaxsearch(root) {
	var output = {};
	
	if(root.id.value) {
		output.id = root.id.value;
		
	} else {
		if(root.title.value)
			output.title = root.title.value;
		
		if(root.actor.value)
			output.actor = root.actor.value;
			
		if(root.director.value)
			output.director = root.director.value;
		
		if(root.genre.value)
			output.genre = root.genre.value;
		
		if(root.certification.value)
			output.certification = root.certification.value;
		
		if(root.vote_avg_max.value)
			output.vote_avg_max = root.vote_avg_max.value;
		
		if(root.vote_avg_min.value)
			output.vote_avg_min = root.vote_avg_min.value;
		
		if(root.vote_max.value)
			output.vote_max = root.vote_max.value;
		
		if(root.vote_min.value)
			output.vote_min = root.vote_min.value;
		
		if(root.release_min.value)
			output.release_min = root.release_min.value;
			
		if(root.release_max.value)
			output.release_max = root.release_max.value;
	}
	
	$.post('/rechci', output).done(result);
			
	return false;
}

function command(root) {
	if(!$("input:checked").length) {
		alert('Vous devez choisir au moins un film');
		return false;
	}
	
	$("#fullpage").css('visibility', 'visible');
	$("#fullpage").css('opacity', 0.95);
	
	$("#progressbar").progressbar({
		value: false
	});
	
	$("#process").css('opacity', 1);
	
	return true;
}
