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
	
	for(var i = 0; i < data.length; i++)
		table.append($('<tr>').html($('<td>').html(data[i].key)));
}

function ajaxsearch(root) {
	var output = {};
	
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
	
	$.post('/rechci', output).done(result);
			
	return false;
}
