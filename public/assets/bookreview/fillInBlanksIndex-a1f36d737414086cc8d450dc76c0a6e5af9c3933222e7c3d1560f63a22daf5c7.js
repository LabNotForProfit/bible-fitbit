function updateGo() {
	var $goButton = $('#goButton')
	var href = $goButton.attr('href').split('/');
	href[3] = $('#books option:selected').val();
	$goButton.attr('href', href.join('/'));
}


$(function() {
	console.log('fillInBlanksIndex.js');
});
