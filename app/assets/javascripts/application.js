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
//= require jquery_ujs
//= require turbolinks
//= require jquery-ui/autocomplete
//= require_tree ./common

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
	$("img").load(function() {
    	$(this).wrap(function(){
    		return '<span class="image-wrap ' + $(this).attr('class') + '" style="position:relative; display:inline-block; background:url(' + $(this).attr('src') + ') no-repeat center center; " />';
    	});
    $(this).css("opacity","0");
  	});
})