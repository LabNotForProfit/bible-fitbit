var verses = {};
var bookId = '';

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
		bookId: bookId
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

function getBookId() {
	var url = window.location.href.split('/');
	bookId = url[url.length - 1].split('?')[0];
}

function showAnswers() {
	$('.blanks-hidden').removeClass('blanks-hidden');
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
	getBookId();
	var passages = shuffle($('.show-passages').remove());
	var byChapter = '<h3>Pick the correct chapter (e.g. 25)</h3>';
	var count = 0;
	$.each(passages, function(index, passage) {
		count++;
		var children = $(passage).children();
		var reference = $(children[0]).html();
		var verse = [];
		for (var i = 1; i < children.length; i++) {
			verse.push($(children[i]).text());
		};
		verses[reference] = verse.join(' ').replace(/”/g, '" ').replace(/“/g, '"').replace(/‘/g, "'").replace(/’/g, "'").replace(/([.,!])/g, '$1 ').replace(/([,.]) "/g, '$1"').replace(/ +/g, ' ').trim();
		byChapter += '<div class="row blanks-padding">';
		byChapter += '<div class="col-md-2"><div class="row"><div class="col-md-2">' + count + '.</div><div class="col-md-10"><input id="' + reference + '" class="blanks-chapter-answer"><div class="blanks-icon"></div></div></div></div>';
		byChapter += '<div class="col-md-8">' + verses[reference] + '</div>';
		byChapter += '<div class="col-md-2 blanks-hidden">' + reference + '</div>';
		byChapter += '</div>';
	});
	byChapter += '<div class="row blanks-padding">';
	byChapter += '<div class="col-xs-1"></div>';
	byChapter += '<div class="col-lg-10 text-right">' + '<button id="checkAnswers" class="btn btn-default btn-lg ghost-button-twitter" onclick="checkAnswers();">Check Answers</button>' + '</div>';
	byChapter += '</div>';
	$('#pickChapter').html(byChapter);
	$('input').focus(function() {
    	$('.blanks-padding').removeClass('white');
        $(this).parent('div').parent('div').parent('div').parent('div').addClass('white');
    }).blur(
    function(){
        $(this).parent('div').parent('div').parent('div').parent('div').removeClass('white');
    });
    $('.blanks-padding').hover(function() {
    	$('.blanks-padding').removeClass('white');
    	$(this).addClass('white');
    }, function() {
    	$(this).removeClass('white');
    });
});
