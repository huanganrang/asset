// JavaScript Document
$(document).ready(function(){
	//var textContent ="";
//	var filtericon =$("table th:nth-child(1)")
//	$("table th").hover(function(){
//		$("table th").css({"background":"#ededed"});
//		$(this).not(filtericon).css({"background":"#f60"});
//		textContent = $(this).not(filtericon).html();
//		//alert(textContent);
//		//js    方法1 this.innerHTML="删除/更改";
//		//jqury 方法2 $(this).html("删除/更改");
//		$(this).not(filtericon).html("删除/更改");
//	
//		},function(){
//			$(this).not(filtericon).html(textContent);
//			
//			})
//	
//		
//		filtericon.click(function(){
//			$(this).children().attr({"src":"images/Screen-icon2.png"})
//			$("table th").not(filtericon).css({"padding-bottom":"20px","border-bottom":"2px solid #ccc"})
//			$("table th").parent().css({"padding-bottom":"50px"})
//			$(".tablebox").css({"top":"260px"})
//			})
	
	
		
		
	
	//鼠标悬停是侧边tab的时候
	var navtable = $("main .nav li")
	    
		navtable.hover(function(){
			navtable.children().hide();
			$(this).children().show();
			
			},function(){
				
			$(this).children().hide();	
				
				
				})
		//用户管理与角色管理切换
				
			$(".list li:nth-child(1)").click(function(){
				$(".tablebox-user").show();
				$(".tablebox-role").hide();
				})
			$(".list li:nth-child(2)").click(function(){
				$(".tablebox-role").show();
				$(".tablebox-user").hide();
				})
			
			
			
			//用户管理弹出框
			var tablist = $(".tablist li:nth-child(4)")
				
				tablist.click(function(){
					$(".popup").show();
					$(".popup .popup-add").show();
					$(".popup .popup-edit").hide();
					$(".popup .popup-user").hide();
					$(".popup .popup-ask").hide();
					$(".popup .popup-ask").hide();
					
					})
					
					tablist.next().click(function(){
					$(".popup").show();
					$(".popup .popup-add").hide();
					$(".popup .popup-edit").show();
					$(".popup .popup-user").hide();
					$(".popup .popup-ask").hide();
					$(".popup .popup-ask").hide();
					
					})
					
					tablist.next().next().click(function(){
					$(".popup").show();
					$(".popup .popup-add").hide();
					$(".popup .popup-edit").hide();
					$(".popup .popup-user").show();
					$(".popup .popup-ask").hide();
					
					
					})
					
					tablist.next().next().next().click(function(){
					$(".popup").show();
					$(".popup .popup-add").hide();
					$(".popup .popup-edit").hide();
					$(".popup .popup-user").hide();
					$(".popup .popup-ask").show();
					
					
					})
					//角色管理弹出框
					var table2 = $(".tablebox-role .tablist2>li:nth-child(4)")
						
						table2.click(function(){
							$(".popup").show();
							$(".popup .popup-add-role").show();
							$(".popup .popup-add-editor").hide();
							$(".popup .popup-role-authorization").hide();
						
							})
					
						table2.next().click(function(){
							$(".popup").show();
							$(".popup .popup-add-role").hide();
							$(".popup .popup-add-editor").show();
							$(".popup .popup-role-authorization").hide();
						
							})
					
					
						table2.next().next().click(function(){
							$(".popup").show();
							$(".popup .popup-add-role").hide();
							$(".popup .popup-add-editor").hide();
							$(".popup .popup-role-authorization").show();
						
							})
					
					
					
					
					
			//弹出框关闭
			$(".popup .clos").click(function(){
				
				$(".popup").hide();
				
				
				
				})
			
			
			
	
		})