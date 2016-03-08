// JavaScript Document
$(document).ready(function(){
	
	
	$(".nav li").click(function(){
		$(this).children(".subNav").slideDown();
		$(this).children(".subNav").css({"top":"50px"})
		
		})
	
	})