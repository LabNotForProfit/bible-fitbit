var verses = {};
var book = '';

function checkAnswers() {
	var score = 0;
	$('.blanks-chapter-answer').each(function(index, answer) {
		var $answer = $(answer);
		var $icon = $answer.next();
		var reference = $answer.attr('id').split(':')[0].split(' ');
		var chapter = reference[reference.length - 1];
		if (chapter == $answer.val()) {
			$icon.addClass('green fa fa-check');
			score++;
		} else {
			$icon.addClass('red fa fa-close');
		}
	});
	var $checkAnswers = $('#checkAnswers');
	$('#score').text(score);
	$checkAnswers.text('Review Again').attr('onclick', 'reset()');
	$checkAnswers.after('<button id="showAnswers" class="btn btn-default btn-lg ghost-button-twitter" onclick="showAnswers();">Show Answers</button>');
	saveScore(score / Object.keys(verses).length);
}

function saveScore(score) {
	var requestObject = {
		score: score,
		book: book
	};
	$.ajax({
		type: 'POST',
		url: '/api/fill_in_blanks',
		data: requestObject,
		dataType: 'json',
		success: function(data) {
			console.log("SAVED");
		}
	});
}

function getBook() {
	var url = window.location.href.split('/');
	book = url[url.length - 1];
}

function showAnswers() {
	$('.blanks-hidden').removeClass();
}

function reset() {
	window.location.href = window.location.href;
}

function shuffle(array) {
	var currentIndex = array.length, temporaryValue, randomIndex;

	// While there remain elements to shuffle...
	while (0 !== currentIndex) {
		// Pick a remaining element...
		randomIndex = Math.floor(Math.random() * currentIndex);
		currentIndex -= 1;

		// And swap it with the current element.
		temporaryValue = array[currentIndex];
		array[currentIndex] = array[randomIndex];
		array[randomIndex] = temporaryValue;
	}
	return array;
}

$(function() {
	$('.v, .s1, .b').remove();
	getBook();
	var passages = shuffle($('.show-passages').remove());
	var byChapter = '<h3>Pick the correct chapter (e.g. 25)</h3>';
	$.each(passages, function(index, passage) {
		var children = $(passage).children();
		var reference = $(children[0]).html();
		var verse = [];
		for (var i = 1; i < children.length; i++) {
			verse.push($(children[i]).text());
		};
		verses[reference] = verse.join(' ').replace(/”/g, '" ').replace(/“/g, '"').replace(/‘/g, "'").replace(/’/g, "'").replace(/\./g, '. ').replace(/\. "/g, '."').replace(/\?/g, '? ').replace(/ +/g, ' ').trim();
		byChapter += '<div class="row blanks-padding">';
		byChapter += '<div class="col-xs-1"><input id="' + reference + '" class="blanks-chapter-answer"><div class="blanks-icon"></div></div>';
		byChapter += '<div class="col-lg-9">' + verses[reference] + '</div>';
		byChapter += '<div class="col-xs-2 blanks-hidden">' + reference + '</div>';
		byChapter += '</div>';
	});
	byChapter += '<div class="row blanks-padding">';
	byChapter += '<div class="col-xs-1"></div>';
	byChapter += '<div class="col-lg-10 text-right">' + '<button id="checkAnswers" class="btn btn-default btn-lg ghost-button-twitter" onclick="checkAnswers();">Check Answers</button>' + '</div>';
	byChapter += '</div>';
	$('#pickChapter').html(byChapter);
});
