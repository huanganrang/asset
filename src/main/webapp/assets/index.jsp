<%@page import="org.apache.xmlbeans.impl.xb.xsdschema.IncludeDocument.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>华鑫资产管理系统</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<%@include file="/assets/common.jsp"%>
<style type="text/css">
.menu-text {
    float: none;
    padding-left: 10px;
}
.nav-list>li>a {
    display: block;
    height: 38px;
    line-height: 36px;
    padding: 0 16px 0 0px;
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
</style>
</head>
<body>
		<div class="navbar navbar-default" id="navbar">
			<div class="navbar-container" id="navbar-container">
				<div class="navbar-header pull-left" style="width:190px;height:45px;background-color:#ed6c44">
					<a href="#" class="navbar-brand" style="width:86px;height:36px;background:url(${pageContext.request.contextPath}/assets/images/logo.png) no-repeat;margin:5px 10px 0px 50px">
					</a><!-- /.brand -->
				</div><!-- /.navbar-header -->

				<div class="navbar-header pull-right" role="navigation">
					<h4>华鑫证券资产管理系统</h4>
				</div><!-- /.navbar-header -->
			</div><!-- /.container -->
		</div>

		<div class="main-container" id="main-container">
			<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script>
			<div class="main-container-inner">
			<div class="sidebar" id="sidebar">
					<script type="text/javascript">
						try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
					</script>
					<ul class="nav nav-list">
						<li>
							<a href="javascript:void(0)" src="${pageContext.request.contextPath}/home">
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

					<script type="text/javascript">
						try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
					</script>
				</div>
				<div class="main-content">
					<div class="page-content">
					<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div class="hr32"></div>	
								<iframe id="mainFrame" frameborder='0' width='100%' height='500px'  scrolling="no" src="${pageContext.request.contextPath}/home"></iframe>	
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
			$(".nav-list a").click(function(){
				//$("#mainFrame").src=;
				var src =$(this).attr("src");
				if(undefined != src){
					$("#mainFrame").attr("src",src);
				}
			})
			
			 $("body").addClass("skin-1"); 
			 $(".ace-nav > li.grey").addClass("dark"); 
			
		});
		</script>
</body>
</html>