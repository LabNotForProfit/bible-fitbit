var bookId;

function reviewBook(url) {
    window.location.href = url + '?count=' + $('#question-number option:selected').val() + '&type=' + $('#question-type option:selected').val();
}

$(function() {
    bookId = $('#bookId').remove().html();
	// Change button CSS and animate knob on button click
	$(".completed-button").click(function() {
        $.ajax({
            type: 'POST',
            url: '/api/books',
            data: { bookId: bookId },
            error: function(data) {
                // if completing the book failed, make a notification
                $("body").prepend(data.responseText);
                setTimeout(function() {
                    // in 5 seconds, remove the first notification-container
                    $('body > .notification-container').get(0).remove();
                }, 5001)
            },
            success: function(data) {
                $(".completed-button").attr('class', 'completed-button-done btn btn-success btn-lg disabled');
                $('.dial').each(function () {
                    var $this = $(this);
                    var myVal = $this.attr("rel");
                    $this.knob({});
                    $({ value: 0 }).animate({value: myVal}, {
                        duration: 2500,
                        easing: 'swing',
                        step: function () {
                            $this.val(Math.ceil(this.value)).trigger('change');
                        }
                    });
                });
            }
        });
	});
    if ($('.completed-button-done').length > 0) {
        $('.dial').each(function () {
            var $this = $(this);
            var myVal = $this.attr("rel");
            $this.knob({});
            $({ value: 0 }).animate({value: myVal}, {
                duration: 2000,
                easing: 'swing',
                step: function () {
                    $this.val(Math.ceil(this.value)).trigger('change');
                }
            });
        });
    }

    $(".completed-button").hover(function() {
        $(".completed-button").removeClass("btn-danger");
        $(".completed-button").addClass("btn-success");
    }, function() {
        $(".completed-button").removeClass("btn-success");
        $(".completed-button").addClass("btn-danger");
    })
});