// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .

$(document).ready(function() {
	var i=180;
	var j=180;
	$("#js-categories").click(function() {
		$("#js-categories_expanded").slideToggle("slow");
		$("#js-categories_icon").css({
			WebkitTransform: 'rotateX(' + i + 'deg)',
			WebkitTransition: '0.5s'
		});
		i-=180;
	});
	$("#js-menu").click(function() {
		$("#js-menu_expanded").slideToggle("slow");
		$("#js-menu_icon").css({
			WebkitTransform: 'rotateX(' + j + 'deg)',
			WebkitTransition: '0.5s'
		});
		j+=180;
	});
/*
	$(".js-sortable").click(function() {
		var toggleClass = $(this).hasClass('asc') ? 'desc' : 'asc';
		$('js-sortable').removeClass('asc').removeClass('desc');
		$(this).addClass(toggleClass);

		var colIndex = $(this).prevAll().length;
		var tbody = $(this).closest("table").find("tbody");
		var rows = tbody.find("tr");

		rows.sort(function(a,b) {
			var A = $(a).find("td").eq(colIndex).text();
			var B = $(b).find("td").eq(colIndex).text();

			if (!isNaN(A)) A = Number(A);
			if (!isNaN(B)) B = Number(B);

			return toggleClass == 'asc' ? A>B : B>A;
		});
		$.each(rows,function(index,ele) {
			tbody.append(ele);
		});
	});
*/
});