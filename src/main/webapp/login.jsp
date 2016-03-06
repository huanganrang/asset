<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>华鑫资产管理系统</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="${pageContext.request.contextPath}/assets/css/reset.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<header><h1></h1></header>
<main>
	<div class="title">
   		 <h2>华鑫证券资产管理系统</h2>
         <p>Huaxin asset management ststem</p>
    </div>
    <article>
    	<div class="msg1">
        	<a></a>
            <input name="name" id="name" placeholder="用户名"/>
        </div>
        <div class="msg2">
        	<a class="icon"></a>
            <input type="password" id="pwd"  name="pwd"  placeholder="密码"/>
        </div>
        <div class="msg3">
            <input type="checkbox"/>
            <a href="#">记住密码</a>
            <a href="#">忘记密码</a>
        </div>
        
        <div id="msg" style="float:right;color:red;width:100px;height:20px"></div>
      <input type="button" id="submit" value="登录"/>
    </article>
</main>

<script src="${pageContext.request.contextPath}/assets\js\jquery-2.0.3.min.js"></script>

		<!-- <![endif]-->

		<!--[if IE]>
<script src="${pageContext.request.contextPath}/assets\js\jquery-1.10.2.min.js"></script>
<![endif]-->

		<!--[if !IE]> -->
		
<script type="text/javascript">
$(function(){
	$("#submit").click(function(){
		$("#msg").hide();
		var data = "name="+$("#name").val()+"&pwd="+$("#pwd").val();
		$.ajax({
			url:"userController/login",
			type:"post",
			data:data,
			dataType:"json",
			cache:false,
			success:function(response){
				if(response.success){
				    location.href="${pageContext.request.contextPath}/home.jsp"; 
				}else{
					 $("#msg").text("用户名密码错误");
					 $("#msg").show();
				}
			},
			error:function(e){
				 $("#msg").text("服务器内部错误");
				 $("#msg").show();
			}
	});
});
	
	
});



</script>

</body>
</html>