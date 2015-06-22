var books = [];

$(function () {
	$('.cd-date').each(function() {
		var book = $(this).text();
		if ($.inArray(book, books) === -1) {
			books.push($(this).text());
		}
	});
	var $bookSearch = $('#bookSearch');
	$bookSearch.autocomplete({
		source: books
	})
	$bookSearch.bind('enterKey', function(e) {
		var url = window.location.href;
		var urlInfo = url.split('#');
		console.log(urlInfo[0] + '#' + $('#bookSearch').val().split(' ').join(''));
		window.location.href = urlInfo[0] + '#' + $('#bookSearch').val().split(' ').join('');
	});
	$bookSearch.keyup(function(e) {
		if (e.keyCode == 13) {
			$(this).trigger('enterKey');
		}
	});
});