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
                beforeSend: function(jqXHR, settings) {
                    jqXHR.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
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
