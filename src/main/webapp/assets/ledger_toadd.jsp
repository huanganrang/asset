<%@page import="org.apache.xmlbeans.impl.xb.xsdschema.IncludeDocument.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>华鑫资产管理系统</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- basic styles -->
<link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css" />

<!--[if IE 7]>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/font-awesome-ie7.min.css" />
<![endif]-->

<!-- page specific plugin styles -->
<!-- fonts 
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets\css\cyrillic.css" />
-->
<!-- ace styles -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/jslib/jquery-easyui-1.3.6/themes/default/easyui.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace-rtl.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace-skins.min.css" />

<!--[if lte IE 8]>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace-ie.min.css" />
<![endif]-->

<!-- inline styles related to this page -->

<!-- ace settings handler -->

<script src="${pageContext.request.contextPath}/assets/js/ace-extra.min.js"></script>

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

<!--[if lt IE 9]>
<script src="${pageContext.request.contextPath}/assets/js/html5shiv.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/respond.min.js"></script>
<![endif]-->
</head>
<body>

		<%@include file="/assets/assets_header.jsp"%>
		<input type="hidden" id="rootpath" value="${pageContext.request.contextPath}"/>
		<input type="hidden" id="columns" value="${columns}"/>
		<div class="main-container" id="main-container">
			<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script>

			<div class="main-container-inner">
				<%@include file="/assets/assets_menu.jsp"%>
				<div class="main-content">
					<div class="breadcrumbs" id="breadcrumbs">
						<script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script>
					</div>

					<div class="page-content">
						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div class="hr32"></div>
								  <table id="dg"  style="width:700px;height:450px">
								  <tr>
								  <td><a href="javascript:void(0)" id="asset2">电脑</a></td>
								  <td><a href="javascript:void(0)" id="asset3">服务器</a></td>
								  <td><a href="javascript:void(0)" id="asset4">网络设备</a></td>
								  <td><a href="javascript:void(0)" id="asset5">安全类设备</a></td>
								  </tr>
								  
								  <tr>
								  <td><a href="javascript:void(0)" id="asset6">机房基础</a></td>
								  <td><a href="javascript:void(0)" id="asset7">办公类设备</a></td>
								  <td><a href="javascript:void(0)" id="asset8">其它类</a></td>
								  <td><a href="javascript:void(0)" id="asset9">软件类</a></td>
								  </tr>
								  
								   <tr>
								  <td><a href="javascript:void(0)" id="asset10">配件类</a></td>
								  <td><a href="javascript:void(0)" id="asset11">低置易耗器</a></td>
								  <td><a href="javascript:void(0)" id="asset12">储存类</a></td>
								  <td><a href="javascript:void(0)" id="asset13">办公室办公</a></td>
								  </tr>
								  </table>
								    <!--[if !IE]> -->

									<script src="${pageContext.request.contextPath}/assets\js\jquery-2.0.3.min.js"></script>
							
									<!-- <![endif]-->
							
									<!--[if IE]>
							<script src="${pageContext.request.contextPath}/assets\js\jquery-1.10.2.min.js"></script>
							<![endif]-->
							
									<!--[if !IE]> -->
							
									<script type="text/javascript">
										window.jQuery || document.write("<script src='${pageContext.request.contextPath}/assets/js/jquery-2.0.3.min.js'>"+"<"+"script>");
									</script>
							
									<!-- <![endif]-->
							
									<!--[if IE]>
							<script type="text/javascript">
							 window.jQuery || document.write("<script src='${pageContext.request.contextPath}/assets/js/jquery-1.10.2.min.js'>"+"<"+"script>");
							</script>
							<![endif]-->

							<script type="text/javascript">
								if("ontouchend" in document) document.write("<script src='${pageContext.request.contextPath}/assets/js/jquery.mobile.custom.min.js'>"+"<"+"script>");
							</script>
							<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
							<script src="${pageContext.request.contextPath}/assets/js/typeahead-bs2.min.js"></script>
									<script src="${pageContext.request.contextPath}/jslib/jquery-easyui-1.3.6/jquery.easyui.min.js"></script>
									<script type="text/javascript" src="${pageContext.request.contextPath}/jslib/jquery-easyui-1.3.6/locale/easyui-lang-zh_CN.js"></script>
								    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/datagrid-filter.js"></script>
								    <script type="text/javascript">
									   $(function(){
										   $("#dg td a").click(function(){
											   var id = $(this).attr("id");
											   location.href="${pageContext.request.contextPath}/ledger/add?type="+id.replace("asset","");
										   });
									   });
								    </script>
								<!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div><!-- /.main-content -->
		
		
		<!-- ace scripts -->
		<script src="${pageContext.request.contextPath}/assets/js/ace.min.js"></script>
</body>
</html>