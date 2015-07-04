var passages = [];
var verses = {};

function checkAnswers() {
	$('.blanks-icon').removeClass().addClass('blanks-icon');
	$('.blanks-chapter-answer').each(function(index, answer) {
		var $answer = $(answer);
		var $icon = $answer.next();
		var chapter = $answer.attr('id').split(' ')[1].split(':')[0];
		if (chapter == $answer.val()) {
			$icon.addClass('green fa fa-check');
		} else {
			$icon.addClass('red fa fa-close');
		}
	});
}

$(function() {
	console.log('fillInBlanks.js');
	$('.v, .s1, .b').remove();
	passages = $('.show-passages').remove();
	var byChapter = '<h3>Pick the correct chapter</h3>';
	$.each(passages, function(index, passage) {
		var children = $(passage).children();
		var reference = $(children[0]).html();
		var verse = [];
		for (var i = 1; i < children.length; i++) {
			verse.push($(children[i]).text());
		};
		verses[reference] = verse.join(' ').replace(/”/g, '" ').replace(/“/g, '"').replace(/‘/g, "'").replace(/’/g, "'").replace(/ +/g, ' ').trim();
		byChapter += '<div class="row blanks-padding">';
		byChapter += '<div class="col-xs-1"><input id="' + reference + '" class="blanks-chapter-answer"><div class="blanks-icon"></div></div>	';
		byChapter += '<div class="col-lg-10">' + verses[reference]+ '</div>';
		byChapter += '</div>';
	});
	byChapter += '<div class="row blanks-padding">';
	byChapter += '<div class="col-xs-1"></div>';
	byChapter += '<div class="col-lg-10 text-right">' + '<button class="btn btn-default btn-lg ghost-button-twitter" onclick="checkAnswers();">Check Answers</button>' + '</div>';
	byChapter += '</div>';
	$('#pickChapter').html(byChapter);
});
