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
					
					var checkUser = $("#userList").find("tbody :checked");
			        if(checkUser.size() == 1){
			            $("#editUserId").val(checkUser.val());
			            checkUser.parent().parent().each(function(){
			                $("#editUserName").val($(this).children().eq(1).text());
			                $("#editPassword").val($(this).children().eq(2).text());
			            });
			            $(".popup").show();
						$(".popup .popup-add").hide();
						$(".popup .popup-edit").show();
						$(".popup .popup-user").hide();
						$(".popup .popup-ask").hide();
						$(".popup .popup-ask").hide();
			        }else if(checkUser.size() < 1){
			            alert("请选择一个用户！");
			            return false;
			        }else {
			            alert("只能选择一个用户！");
			            return false;
			        }
					
					})
					
					tablist.next().next().click(function(){
						var checkUser = $("#userList").find("tbody :checked");
				        if(checkUser.size() == 1){
				            $("#auditUserId").val(checkUser.val());
				            checkUser.parent().parent().each(function(){
				                $("#editUserName").val($(this).children().eq(1).text());
				                $("#editPassword").val($(this).children().eq(2).text());
				            });
				        	$(".popup").show();
							$(".popup .popup-add").hide();
							$(".popup .popup-edit").hide();
							$(".popup .popup-user").show();
							$(".popup .popup-ask").hide();
				        }else if(checkUser.size() < 1){
				            alert("请选择一个用户！");
				            return false;
				        }else {
				            alert("只能选择一个用户！");
				            return false;
				        }
					
					})
					
					tablist.next().next().next().click(function(){
						var checkUser = $("#userList").find("tbody :checked");
				        if(checkUser.size() >= 1){
				            $("#auditUserId").val(checkUser.val());
				            checkUser.parent().parent().each(function(){
				                $("#editUserName").val($(this).children().eq(1).text());
				                $("#editPassword").val($(this).children().eq(2).text());
				            });
				            $(".popup").show();
							$(".popup .popup-add").hide();
							$(".popup .popup-edit").hide();
							$(".popup .popup-user").hide();
							$(".popup .popup-ask").show();
				        }else {
				            alert("请选择一个用户！");
				            return false;
				        }
					
					})
					//角色管理弹出框
					var table2 = $(".tablebox-role .tablist2>li:nth-child(4)")
						
						table2.click(function(){
							$(".popup").show();
							$(".popup .popup-add-role").show();
							$(".popup .popup-add-editor").hide();
							$(".popup .popup-role-authorization").hide();
							$(".popup .popup-ask").hide();
							})
					
						table2.next().click(function(){
							var checkUser = $("#roleList").find("tbody :checked");
					        if(checkUser.size() == 1){
//					            $("#userId").val(checkUser.val());
//					            checkUser.parent().parent().each(function(){
//					                $("#editUserName").val($(this).children().eq(1).text());
//					                $("#editPassword").val($(this).children().eq(2).text());
//					            });
					            $(".popup").show();
								$(".popup .popup-add-role").hide();
								$(".popup .popup-add-editor").show();
								$(".popup .popup-role-authorization").hide();
								$(".popup .popup-ask").hide();
					        }else if(checkUser.size() < 1){
					            alert("请选择一个角色！");
					            return false;
					        }else {
					            alert("只能选择一个角色！");
					            return false;
					        }
						
							})
					
					
						table2.next().next().click(function(){
							$(".popup").show();
							$(".popup .popup-add-role").hide();
							$(".popup .popup-add-editor").hide();
							$(".popup .popup-role-authorization").show();
							$(".popup .popup-ask").hide();
							})
							
						table2.next().next().next().click(function(){
						var checkUser = $("#roleList").find("tbody :checked");
				        if(checkUser.size() >= 1){
				            //$("#auditUserId").val(checkUser.val());
//				            checkUser.parent().parent().each(function(){
//				                $("#editUserName").val($(this).children().eq(1).text());
//				                $("#editPassword").val($(this).children().eq(2).text());
//				            });
				            $(".popup").show();
				            $(".popup .popup-add-role").hide();
							$(".popup .popup-add-editor").hide();
							$(".popup .popup-role-authorization").hide();
							$(".popup .popup-ask").show();
				        }else {
				            alert("请选择一个角色！");
				            return false;
				        }
					
					})
					
					
					
					
					
			//弹出框关闭
			$(".popup .clos").click(function(){
				
				$(".popup").hide();
				
			})
			
			//添加用户框的添加按键
	        $("#btn_user_add").click(function(){
	            var addUserName = $("#addUserName").val();
	            var addPassword = $("#addPassword").val();
	            if(addUserName != "" && addPassword != ""){
	                var data = "name="+addUserName+"&pwd="+addPassword;
	                $.ajax({
	                    url:"${pageContext.request.contextPath}/userController/reg",
	                    type:"get",
	                    data:data,
	                    dataType:"json",
	                    cache:false,
	                    success:function(response){
	                        if(response.success){
	                            location.href="${pageContext.request.contextPath}/userController/manager";
	                        }
	                    }
	                });
	            }else {
	                alert("请填写用户名或密码！");
	            }
	        });
	
			 //弹出编辑用户框
//		    $("#btn_user_edit").click(function(){
//		        var checkUser = $("#userList").find("tbody :checked");
//		        if(checkUser.size() == 1){
//		            $("#userId").val(checkUser.val());
//		            checkUser.parent().parent().each(function(){
//		                $("#editUserName").val($(this).children().eq(1).text());
//		                $("#editPassword").val($(this).children().eq(2).text());
//		            });
//		            $("#editUserContent").show();
//		        }else if(checkUser.size() < 1){
//		            alert("请选择一个用户！");
//		            return false;
//		        }else {
//		            alert("只能选择一个用户！");
//		            return false;
//		        }
//		    });

		    //编辑用户框的编辑按键
		    $("#btn_user_edit").click(function(){
		        var userId = $("#userId").val();
		        var editPassword = $("#editPassword").val();
		        if(userId != "" && editPassword != ""){
		            var data = "id="+userId+"&pwd="+editPassword;
		            $.ajax({
		                url:"${pageContext.request.contextPath}/userController/editPwd",
		                type:"get",
		                data:data,
		                dataType:"json",
		                cache:false,
		                success:function(response){
		                    if(response.success){
		                        location.href="${pageContext.request.contextPath}/userController/manager";
		                    }
		                }
		            });
		        }else {
		            alert("请填写用户名或密码！");
		        }
		    });

		    //批量删除用户
		    $("#btn_user_del").click(function(){
		        var checkUsers = $("#userList").find("tbody :checked");
		        if(checkUsers.size() >= 1){
	                var ids = checkUsers.map(function() {
	                    return $(this).val();
	                }).get().join(',');
	                var data = "ids="+ids;
	                $.ajax({
	                    url:"${pageContext.request.contextPath}/userController/batchDelete",
	                    type:"post",
	                    data:data,
	                    dataType:"json",
	                    cache:false,
	                    success:function(response){
	                        if(response.success){
	                            location.href="${pageContext.request.contextPath}/userController/manager";
	                        }
	                    }
	                });
		        }else {
		            alert("请选择至少一个用户！");
		            return false;
		        }
		    });
		    
		  //添加用户框的取消按键
	        $("#btn_user_del_cancel").click(function(){
	        	$(".popup").hide();
	        });
		    
		    //用户权限修改的修改按键
	        $("#btn_user_audit").click(function(){
	            var checkRoles = $("#userRoleList").find("tbody :checked");
	            if(checkRoles.size() >= 1){
	                var roleIds = checkRoles.map(function() {
	                    return $(this).val();
	                }).get().join(',');
	                var ids = $("#ids").val();
	                if(roleIds != "" && ids != ""){
	                    var data = "ids="+ids+"&roleIds="+roleIds;
	                    $.ajax({
	                        url:"${pageContext.request.contextPath}/userController/grant",
	                        type:"post",
	                        data:data,
	                        dataType:"json",
	                        cache:false,
	                        success:function(response){
	                            if(response.success){
	                                location.href="${pageContext.request.contextPath}/userController/manager";
	                            }
	                        }
	                    });
	                }
	            }else {
	                alert("请选择角色！");
	                return false;
	            }
	        });
			
			
			
	
		})