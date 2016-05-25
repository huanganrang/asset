// JavaScript Document
$(document).ready(function(){
	
	$(".nav li").click(function(){
		$(this).children(".subNav").slideDown();
		$(this).children(".subNav").css({"top":"50px"});
		
		})
		
		
	
		var g=$(".list li:nth-child(4)");
		g.click(function(){
				if($(this).children().css("display")=="none"){
					$(this).children().css({"display":"block"});
				}
				alert("111");
			});
			
			$(".rightlist").click(function(){
				$(this).next().css({"display":"block"});
				$(this).hide();
				})
			$(" .rightlistreturn").click(function(){
				$(this).parent().prev().show();
				$(this).parent().hide();
				
				})
			
			$(".bottomlist").click(function(){
				$(this).next().css({"display":"block"});
				$(this).hide();
				
				})
			$(" .bottomlistrutern").click(function(){
				$(this).parent().prev().show();
				$(this).parent().hide();
				
				})
				
				
				
				var system_management = $(".list li:nth-child(1)")
				 var oppen = false
			system_management.click(function(){
						 if (oppen) {
							 oppen = false;
							 $(this).children().hide();
							 $(this).next().css({"left":"30px"})
							 } else {
								 oppen = true;
							 $(this).children().show();
							$(this).next().css({"left":"330px"})	 
								 
								 };
							
							
							
							
							
							})
				
				
				
				
				
				
				
				
		
	})