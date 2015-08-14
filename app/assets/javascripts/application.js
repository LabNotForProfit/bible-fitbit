// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require jquery-ui/autocomplete
//= require_tree ./common
//= require highcharts
//= require highcharts/highcharts-more
//= require turbolinks

function saveBadge() {
	var name = $('#badgeName').val();
	if (name == '') {
		alert('Error: Name cannot be empty!');
		return;
	}

	var requestObject = {
		name: name,
		description: $('#badgeDescription').val()
	}
	$.ajax({
		type: 'POST',
		url: '/api/badges',
		data: requestObject,
		success: function(data) {
			window.location.href = '/api/badges';
		}
	})
}

$(document).ready(function() {
	$(".avatar-container img").load(function() {
    	$(this).wrap(function(){
    		return '<span class="image-wrap ' + $(this).attr('class') + '" style="position:relative; display:inline-block; background: #F3F3F3 url(' + $(this).attr('src') + ') no-repeat center center; " />';
    	});
    $(this).css("opacity","0");
  	});

  	// Workaround to prevent input cursor from appear on dial
	// Also means you can't select the dial number
	$('.dial').mousedown(function(e) {
		e.preventDefault();
		$(this).blur();
		return false;
	})

	$("#sign-in-link").click(function(e) {
		e.preventDefault();
		$.ajax({
			url: "/api/users/sign_in",
			type: "GET",
			success: function(data) {
				$(".form").fadeOut("fast", "swing", function() {
					$(".form").html(data).fadeIn("slow");
				});
				// blur background
				$(".home-image").addClass("blur");
			}
		})
	});
	$("#sign-up-link").click(function (e) {
		e.preventDefault();
		$.ajax({
			url: "api/users/sign_up",
			type: "GET",
			success: function(data) {
				$(".form").fadeOut("fast", "swing", function() {
					$(".form").html(data).fadeIn("slow");
				});
				$(".home-image").addClass("blur");
			}
		})
	})
})

function createDial() {
	$(".dial").knob({
	    'min':0,
	    'max':100,
	    'fgColor': '#337AB7',
	    'font': 'Ruda',
	    'readOnly':true
	});
}