var bookId;

$(function() {
    bookId = $('#bookId').remove().html();
	// Change button CSS and animate knob on button click
	$(".completed-button").click(function() {
    	if ($(this).attr('class') == 'completed-button') {
        	$(".completed-button").attr('class', 'completed-button-done');
            var requestObject = {
                bookId: bookId
            }
            $.ajax({
                type: 'POST',
                url: '/api/books',
                data: requestObject,
                error: function(data) {
                    console.log(data)
                    $("body").prepend(data.responseText);
                    setTimeout(function() {
                        // in 5 seconds, remove the first notification-container
                        $('body > .notification-container').get(0).remove();
                    }, 5001)
                },
                success: function(data) {
                    window.location.href = '/timeline/edit';
                }
            });
        } else {
            console.log("already completed");
    	}
	});
    if ($('.completed-button-done').length > 0) {
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