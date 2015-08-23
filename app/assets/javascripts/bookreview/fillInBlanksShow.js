var verses = {};
var bookId = '';
var type = '';

function checkAnswers() {
	var score = 0;
	$('.blanks-chapter-answer').each(function(index, answer) {
		var $answer = $(answer);
		var $icon = $answer.next();
		var reference = $answer.attr('id').split(':')[0].split('_');
		var chapter = reference[reference.length - 1];
		if (chapter == $answer.val()) {
			$icon.addClass('green fa fa-check');
			score++;
		} else {
			$icon.addClass('red fa fa-close');
		}
	});

	$('.blanks-fill-question').each(function(index, question){
		var $user_answers = $(this).children('.blanks-fill-answer');
		var num_correct = 0;
		var num_blanks = $user_answers.length;
		console.log(num_blanks);
		$user_answers.each(function(index, answer) {
			var $icon = $(answer).next();
			var correctAnswer = $(answer).attr('id')
			var givenAnswer = $(answer).val();
			if(givenAnswer.trim().toLowerCase() == correctAnswer.trim().toLowerCase()) {
				$icon.addClass('green fa fa-check');
				num_correct++;
			} else {
				$icon.addClass('red fa fa-close');
			}
		});
		// you get a point for getting at least half correct
		if(num_correct >= num_blanks / 2) {
			score++
		}
	});
	
	var $checkAnswers = $('#checkAnswers');
	$('#score').text(score);
	$checkAnswers.text('Review Again').attr('onclick', 'reset()');
	$checkAnswers.after('<button id="showAnswers" class="btn btn-default btn-lg ghost-button-twitter" onclick="showAnswers();">Show Answers</button>');
	saveScore(score, $('#questionNumber').html()); // Now send the score (num correct) and total questions separately
}

function saveScore(num_correct, num_questions) {
	var requestObject = {
		num_correct: num_correct,
		num_questions: num_questions,
		bookId: bookId,
		type: type
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

function getQuizType() {
	type = $("#q-type").html();
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
	getBookId();
	getQuizType();
	$('.answer-field').val("");
	// $('.v, .s1, .b').remove();
	// var passages = $('.show-passages').remove();
	// var byChapter = '<h3>Pick the correct chapter (e.g. 25)</h3>';
	// var count = 0;
	// $.each(passages, function(index, passage) {
	// 	count++;
	// 	var children = $(passage).children();
	// 	var reference = $(children[0]).html();
	// 	var answer = $(children[1]).html();
	// 	if(reference == "Romans Test:Test") {
	// 		console.log("Test Question")
	// 	}
	// 	var verse = [];
	// 	for (var i = 2; i < children.length; i++) {
	// 		verse.push($(children[i]).text());
	// 	};
	// 	verses[reference] = verse.join(' ').replace(/”/g, '" ').replace(/“/g, '"').replace(/‘/g, "'").replace(/’/g, "'").replace(/([.,!])/g, '$1 ').replace(/([,.]) "/g, '$1"').replace(/ +/g, ' ').trim();
	// 	byChapter += '<div class="row blanks-padding">';
	// 	byChapter += '<div class="col-md-2"><div class="row"><div class="col-md-2">' + count + '.</div><div class="col-md-10"><input id="' + reference + '" class="blanks-chapter-answer"><div class="blanks-icon"></div></div></div></div>';
	// 	byChapter += '<div class="col-md-8">' + verses[reference] + '</div>';
	// 	byChapter += '<div class="col-md-2 blanks-hidden">' + answer + '</div>';
	// 	byChapter += '</div>';
	// });
	// byChapter += '<div class="row blanks-padding">';
	// byChapter += '<div class="col-xs-1"></div>';
	// byChapter += '<div class="col-lg-10 text-right">' + '<button id="checkAnswers" class="btn btn-default btn-lg ghost-button-twitter" onclick="checkAnswers();">Check Answers</button>' + '</div>';
	// byChapter += '</div>';
	// $('#pickChapter').html(byChapter);
	$('input').focus(function() {
    	$('.blanks-padding').removeClass('grey');
        $(this).parents('.row.blanks-padding').addClass('grey');
    }).blur(
    function(){
        $(this).parents('.row.blanks-padding').removeClass('grey');
    });
    $('.blanks-padding').hover(function() {
    	$('.blanks-padding').removeClass('grey');
    	$(this).addClass('grey');
    }, function() {
    	$(this).removeClass('grey');
    });
});
