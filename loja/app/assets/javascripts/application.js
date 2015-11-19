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
});