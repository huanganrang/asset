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
								<div id="nav-search" style="margin-left:300px;">
										<span class="input-icon">
											<input type="text" style="width: 400px" id="key" name="key" class="nav-search-input" value="${key}" />
											<i class="icon-search nav-search-icon"></i>
										</span>
										<input type="button" id="to-search" value="搜索"/>
										<input type="button" id="to-high" value="高级"/>
								</div>

								<div class="hr hr32 hr-dotted"></div>
								
								<table id="dg" style="width:700px;height:450px"></table>
								<!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div><!-- /.main-content -->

				<!-- <div class="ace-settings-container" id="ace-settings-container">
					<div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
						<i class="icon-cog bigger-150"></i>
					</div>

					 <div class="ace-settings-box" id="ace-settings-box">
						<div>
							<div class="pull-left">
							</div>
							<span>服务器树状结构</span>
						</div>
					</div> 
				</div>--><!-- /#ace-settings-container -->
			</div><!-- /.main-container-inner -->
		</div><!-- /.main-container -->

		<!-- basic scripts -->
		<script src="${pageContext.request.contextPath}/jslib/jquery-easyui-1.3.6/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/jslib/jquery-easyui-1.3.6/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/jslib/jquery-easyui-1.3.6/locale/easyui-lang-zh_CN.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/ace.min.js"></script>
		
		<script type="text/javascript">
        $(function(){
        	var rootpath = $("#rootpath").val();
        	var key=$("#key").val();
        	var columns = $("#columns").val();
            $('#dg').datagrid({
                method: 'get',
                fitColumns: false,
                rownumbers:true,
                scrollbarSize:18,
                singleSelect: true,
                pagination:true,
                onHeaderContextMenu: function(e, field){
                    e.preventDefault();
                    if (!cmenu){
                        createColumnMenu();
                    }
                    cmenu.menu('show', {
                        left:e.pageX,
                        top:e.pageY
                    });
                }
            });
        	
        	options={};  
        	options.url = rootpath+'/asset/search?key='+key;
       	    options.columns = eval($("#columns").val());  
        	
        	 $('#dg').datagrid(options); 
        	 
        	 $("#to-search").click(function(){
 				if($("#to-search").val() != ""){
 					location.href="${pageContext.request.contextPath}/asset/tosearch?key="+$("#key").val();
 				}
 			});
        	 $("#to-high").click(function(){
  					location.href="${pageContext.request.contextPath}/asset/tohigh?key="+$("#key").val();
  			});
        });
        var cmenu;
        function createColumnMenu(){
            cmenu = $('<div style="position:absolute; height:400px; overflow:auto"/>').appendTo('body');
            cmenu.menu({
                onClick: function(item){
                    if (item.iconCls == 'icon-ok'){
                        $('#dg').datagrid('hideColumn', item.name);
                        cmenu.menu('setIcon', {
                            target: item.target,
                            iconCls: 'icon-empty'
                        });
                    } else {
                        $('#dg').datagrid('showColumn', item.name);
                        cmenu.menu('setIcon', {
                            target: item.target,
                            iconCls: 'icon-ok'
                        });
                    }
                }
            });
            var fields = $('#dg').datagrid('getColumnFields');
            for(var i=0; i<fields.length; i++){
                var field = fields[i];
                var col = $('#dg').datagrid('getColumnOption', field);
                cmenu.menu('appendItem', {
                    text: col.title,
                    name: field,
                    iconCls: 'icon-ok'
                });
            }
        }
    </script>
		
</body>
</html>