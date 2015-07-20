// This is a manifest file that'll be compiled into timelineEdit.js, which will include all the files
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
//= require_tree .

function changeOrder() {

}

$(document).ready(function() {
	var wall = new Freewall("#freewall");
	wall.reset({
		selector: '.brick',
		animate: true,
		cellW: 200,
		cellH: 160,
		onResize: function() {
			wall.refresh();
		}
	});
	wall.addCustomEvent('onBlockLoad', function(setting){
		console.log(setting);
	});
	wall.fitWidth();

	$("#book-order-select").change(function() {
		var order = "";
		order = $("#book-order-select option:selected").get(0).value;
		$.ajax({
			type: "GET",
			url: "/timeline/edit",
			data: { sort_order: order }, 
			success: function(data) {
				$("#freewall").html(data);
				wall.fitWidth();
			}
		})

	})
});