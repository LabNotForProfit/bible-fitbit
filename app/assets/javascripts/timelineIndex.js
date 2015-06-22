var books = [];

$(function () {
	$('.cd-date').each(function() {
		var book = $(this).text();
		if ($.inArray(book, books) === -1) {
			books.push($(this).text())
		}
	});
	var $bookSearch = $('#bookSearch');
	$bookSearch.autocomplete({
		source: books
	})
	$bookSearch.bind('enterKey', function(e) {
		$(document).scrollTop($('#' + $('#bookSearch').val()).offset().top);
	});
	$bookSearch.keyup(function(e) {
		if (e.keyCode == 13) {
			$(this).trigger('enterKey');
		}
	});
});