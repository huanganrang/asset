<%@page import="org.apache.xmlbeans.impl.xb.xsdschema.IncludeDocument.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>华鑫资产管理系统</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/style/index.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/jslib/index.js" />
<%@include file="/assets/common.jsp"%>
<style type="text/css">
.menu-text {
    float: none;
    padding-left: 10px;
}
.nav-list>li>a {
    display: block;
    height: 36px;
    line-height: 36px;
    padding: 0;
}

.nav-list>li>a:hover {
   color: #ED6C44;
}
.skin-1 .nav-list>li.open>a, .skin-1 .nav-list>li.open>a:hover {
    color: #D07053;
    background-color: #222a2d;
}

.nav-list>li:hover:before {
    display: inline-block;
    content: "";
    position: absolute;
    z-index: 1;
    left: 0;
    top: 0;
    bottom: 0;
    max-width: 0;
    overflow: hidden;
    border-left: 3px solid #ED6C44;
    }
.menu-span{
			width: 41px;
			height: 37px;
			line-height: 37px;
			display: inline-block;
			vertical-align: middle;
}
.navbar-container {
    padding-left: 0px;
}

.navbar {
    background: #ffffff;
}
.menu-search{
			background: url("assets/images/search.png") #414b51 center center no-repeat;
}
.menu-ledger{
			background: url("assets/images/ledger.png") #414b51 center center no-repeat;
}
.menu-manage{
			background: url("assets/images/manage.png") #414b51 center center no-repeat;
}
.menu-report{
			background: url("assets/images/report.png") #414b51 center center no-repeat;
}
.menu-system{
			background: url("assets/images/system.png") #414b51 center center no-repeat;
}
.menu-updown{
			background: url("assets/images/updown.png") #414b51 center center no-repeat;
}
.menu-zutai{
			background: url("assets/images/zutai.png") #414b51 center center no-repeat;
}
.menu-head{
			background: url("assets/images/head.png") #414b51 center center no-repeat;
}

.logout{
	background: url("assets/images/logout.png") #414b51 center center no-repeat;
    display: inline-block;
    width: 17px!important;
    height: 17px;
    line-height: 17px;
    text-shadow: none;
    font-size: 18px;
    position: absolute;
    right: 11px;
    top: 11px;
    padding: 0;
    color: #666;
}

</style>
</head>
<body>
		<header class="navbar navbar-default" id="navbar">
			<div class="navbar-container" id="navbar-container">
				<div class="navbar-header pull-left" style="width:190px;height:70px;background-color:#ed6c44">
					<a  id = "logo" href="javascript:void(0)" class="navbar-brand" style="width:86px;height:50px;background:url(${pageContext.request.contextPath}/assets/images/logo.png) no-repeat 40% 60%;margin:5px 10px 0px 50px">
					</a><!-- /.brand -->
				</div><!-- /.navbar-header -->
				
			
					<ul class="list">
				 	<li>
				    	<div class="listmin">
				        	<a>环境监控系统</a>
				            <a>运维管理系统</a>
				            <a>能源管理系统</a>
				        </div>
				    </li>
				    <li><a href="#"></a></li>
				    <li>华鑫证券资产管理系统</li>
				    <li><input type="text" id="key" name="key"/></li>
				    <li></li>
				    
				 </ul>
				
			</div><!-- /.container -->
		</header>

		<div class="main-container" id="main-container" style="height:100%;">
			<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script>
			<div class="main-container-inner" style="height:100%;">
			<div class="sidebar" id="sidebar" style="height:100%;">
					<script type="text/javascript">
						try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
					</script>
					<ul class="nav nav-list">
						<li>
							<a href="javascript:void(0)" src="${pageContext.request.contextPath}/asset/searchHome">
								<span class="menu-span menu-search"></span>
								<span class="menu-text"> 搜索 </span>
							</a>
						</li>

						<li>
							<a href="#">
								<span class="menu-span menu-updown"></span>
								<span class="menu-text"> 上下架 </span>
							</a>
						</li>

						<li>
							<a href="#" class="dropdown-toggle">
								<span class="menu-span menu-manage"></span>
								<span class="menu-text"> 设备管理 </span>

								<b class="arrow icon-angle-down"></b>
							</a>

							<ul class="submenu">
								<li>
									<a href="#">
										<i class="icon-double-angle-right"></i>
										模拟方案
									</a>
								</li>

								<li>
									<a href="#">
										<i class="icon-double-angle-right"></i>
										上下架工单
									</a>
								</li>
							</ul>
						</li>

						<li>
							<a href="#" class="dropdown-toggle">
								<span class="menu-span menu-ledger"></span>
								<span class="menu-text"> 台账管理 </span>

								<b class="arrow icon-angle-down"></b>
							</a>

							<ul class="submenu">
								<li>
									<a href="javascript:void(0)" src="${pageContext.request.contextPath}/ledger/detail">
										<i class="icon-double-angle-right"></i>
									     台账明细
									</a>
								</li>

								<li>
									<a href="javascript:void(0)" src="${pageContext.request.contextPath}/stock/tostock">
										<i class="icon-double-angle-right"></i>
										库存
									</a>
								</li>
								
								<li>
									<a href="javascript:void(0)" src="${pageContext.request.contextPath}/account/toaccount">
										<i class="icon-double-angle-right"></i>
										对账
									</a>
								</li>
								
								<li>
									<a href="javascript:void(0)" src="${pageContext.request.contextPath}/scrap/toscrap">
										<i class="icon-double-angle-right"></i>
										报废库
									</a>
								</li>
								
								<li>
									<a href="javascript:void(0)" src="${pageContext.request.contextPath}/allocation/toallocation">
										<i class="icon-double-angle-right"></i>
										调拨
									</a>
								</li>
							</ul>
						</li>

						<li>
							<a href="#" class="dropdown-toggle">
								<span class="menu-span menu-report"></span>
								<span class="menu-text"> 系统报表 </span>

								<b class="arrow icon-angle-down"></b>
							</a>

							<ul class="submenu">
								<li>
									<a href="#">
										<i class="icon-double-angle-right"></i>
										历史事件
									</a>
								</li>

								<li>
									<a href="#">
										<i class="icon-double-angle-right"></i>
										系统日志
									</a>
								</li>

								<li>
									<a href="#">
										<i class="icon-double-angle-right"></i>
										操作日志
									</a>
								</li>
							</ul>
						</li>

						<li>
								<a href="#" class="dropdown-toggle">
								<span class="menu-span menu-system"></span>
								<span class="menu-text">系统管理</span>
								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu">
								<li>
									<a href="javascript:void(0)" src="${pageContext.request.contextPath}/system/system">
										<i class="icon-double-angle-right"></i>
										用户管理
									</a>
								</li>

								<li>
									<a href="javascript:void(0)" src="${pageContext.request.contextPath}/system/roleManager">
										<i class="icon-double-angle-right"></i>
										角色管理
									</a>
								</li>
							</ul>
						</li>

						<li>
						
							<a href="#" class="dropdown-toggle">
								<span class="menu-span menu-zutai"></span>
								<span class="menu-text"> 系统组态 </span>
								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu">
								<li>
									<a href="javascript:void(0)" src="${pageContext.request.contextPath}/jbmachineroom/jbMachineRoomHtml5.jsp">
										<i class="icon-double-angle-right"></i>
										模拟部署
									</a>
								</li>

								<li>
									<a href="#">
										<i class="icon-double-angle-right"></i>
										机房维护
									</a>
								</li>
							</ul>
						</li>
						
						
					</ul><!-- /.nav-list -->

					<div class="sidebar-collapse" id="sidebar-collapse">
						<i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
					</div>
					
					<ul class="nav nav-list" id="log_ul" style="position:fixed; bottom: 0px;width:190px;z-index: 99">
						<li>
							<a href="javascript:void(0)"  class="dropdown-toggle" onclick="return false;">
								<span class="menu-span menu-head"></span>
								<span class="menu-text"> 金榜智能 </span>
								<b class="logout" id="logout"></b>
							</a>
						</li>
					</ul> 
					
					

					<script type="text/javascript">
						try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
					</script>
				</div>
				<div class="main-content" style="height:100%;">
					<div class="page-content" style="height:100%;">
					<div class="row" style="height:100%;">
							<div class="col-xs-12" style="height:100%;">
								<!-- PAGE CONTENT BEGINS -->
								<iframe id="mainFrame" frameborder='0' width='100%' height='100%'  scrolling="no" src="${pageContext.request.contextPath}/home"></iframe>	
							</div>
		</div>

					</div><!-- /.page-content -->
				</div><!-- /.main-content -->

			
			</div><!-- /.main-container-inner -->

			<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="icon-double-angle-up icon-only bigger-110"></i>
			</a>
		</div><!-- /.main-container -->
		<script type="text/javascript">
		$(function(){
			
			if($("#sidebar").hasClass("menu-min")){
				$("#log_ul").width(34);
			}else{
				$("#log_ul").width(190);
			}
			
			$(".nav-list a").click(function(){
				//$("#mainFrame").src=;
				var src =$(this).attr("src");
				if(undefined != src){
					$("#mainFrame").attr("src",src);
				}
			})
			
			$("#sidebar-collapse").click(function(){
				if($("#sidebar").hasClass("menu-min")){
					$("#log_ul").width(34);
				}else{
					$("#log_ul").width(190);
				}
			});

			$("#logout").click(function(){
				 $.ajax({
		    			url:"${pageContext.request.contextPath}/userController/logout",
		    			type:"get",
		    			dataType:"json",
		    			cache:false,
		    			success:function(response){
		    				if(response.success){
		    					location.href=rootpath+"/index";
		    				}
		    			},
		    			error:function(e){
		    			}
		    		});
			});
			

			var g=$(".list li:nth-child(5)");

			g.click(function(){
				//if($(this).children().css("display")=="none"){
					//	$(this).children().css({"display":"block"});
						//}
				var src="${pageContext.request.contextPath}/asset/headerSearch?key="+$("#key").val();;
				$("#mainFrame").attr("src",src);
			});
			
			var sm = $(".list li:nth-child(1)")
			 var oppen = false
			sm.click(function(){
					 if (oppen) {
							 oppen = false;
							 $(this).children().hide();
						 } else {
							 oppen = true;
						 	 $(this).children().show();
						};
						})
			
			 $("body").addClass("skin-1"); 
			 $(".ace-nav > li.grey").addClass("dark"); 
			 
			 $("#logo").click(function(){
				 $('#mainFrame').attr('src',rootpath+'/home');
			 });
			
		});
		</script>
</body>
</html>