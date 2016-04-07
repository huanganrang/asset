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
		<input type="hidden" id="company" value='${company}'/>
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

						<!-- <ul class="breadcrumb">
							<li>
								<i class="icon-home home-icon"></i>
								<a href="#">首页</a>
							</li>
							<li class="active">搜索</li>
						</ul>.breadcrumb -->
					</div>

					<div class="page-content">
						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div class="hr32"></div>
								
								 <input id="file_upload" name="file_upload" type="file" />
								 <input id="exportBtn"  value="导出" type="button"  />
								 <form id="downloadTable" target="downloadIframe" method="post" style="display: none;">
								  <input id="fileName" name="fileName"  value="" type="hidden"  />
								</form>
								<iframe id="downloadIframe" name="downloadIframe" style="display: none;"></iframe>
								
								
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
									<script src="${pageContext.request.contextPath}/assets/js/jquery.uploadify-3.1.min.js"></script>
								    <script type="text/javascript">
								    
								    $(function(){
									        	var rootpath = $("#rootpath").val();
									        	$("#file_upload").uploadify({
											        // 指定swf文件
											        'swf': rootpath+'/assets/js/uploadify/uploadify.swf',
											        'fileObjName':'file',
											        // 后台处理的页面
											         'uploader':rootpath+'/account/upload',
											        // 按钮显示的文字
											        'buttonText': '导入',
											        'formData':{type:-1},
											        // 允许上传的文件后缀
											        'fileTypeExts': '*.xls;*.xlsx',
											        'auto': true,
											        // 设置为true将允许多文件上传
											        'multi': false,
											        onUploadSuccess :function(event, response, status){
											        	var data = jQuery.parseJSON(response);
											        	if(data.msg){
											        		$("#exportBtn").removeAttr("disabled");
											        		$("#fileName").val(data.msg);
											        	}
											        }
											    });
									        	
									        	$("#exportBtn").attr('disabled',"true");
									        	$("#exportBtn").click(downloadTable);
								    });
								    function downloadTable(){
									    $('#downloadTable').form('submit', {
									        url:'${pageContext.request.contextPath}/account/download',
								        }); 
									}
								    
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