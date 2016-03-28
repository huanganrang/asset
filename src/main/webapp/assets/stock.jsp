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
								  <table id="dg"   style="width:700px;height:450px">
							        <thead>
							            <tr>
							            	<th data-options="field:'ck',checkbox:true"></th>
							            	<!-- <th data-options="field:'assetId',hidden:true"></th> -->
							                <th data-options="field:'assetItNumber',width:80">IT验收编号</th>
							                <th data-options="field:'assetNumber',width:100">固定资产编号</th>
							                <th data-options="field:'assetName',width:80,align:'right'">设备名称</th>
							                <th data-options="field:'assetModel',width:80,align:'right'">设备型号</th>
							                <th data-options="field:'assetAddMethod',width:250">设备增加方式</th>
							            </tr>
							        </thead>
							    </table>
							     <div id="dlg" class="easyui-dialog" title="出库填写" style="width:400px;height:300px;padding:10px"
						            data-options="
						                iconCls: 'icon-save',
						                buttons: [{
						                    text:'确认',
						                    iconCls:'icon-ok',
						                    handler:function(){
						                       outstock();
						                    }
						                },{
						                    text:'取消',
						                    handler:function(){
						                       $('#dlg').dialog('close')
						                    }
						                }]
						            ">
						      		<table>
						      		<tr>
						      		<td>领用人</td>
						      		<td><input id="assetUser"/></td>
						      		</tr>
						      		
						      		<tr>
						      		<td>领用部门</td>
						      		<td><input id="assetUseDepartment"/></td>
						      		</tr>
						      		
						      		<tr>
						      		<td>领用时间</td>
						      		<td><input id="assetUseDate" class="easyui-datebox"/></td>
						      		</tr>
						      		
						      		<tr>
						      		<td>存放地点</td>
						      		<td><input id="assetDeviceLocation"/></td>
						      		</tr>
						      		
						      		<tr>
						      		<td>操作员</td>
						      		<td><input id="assetAddUser"/></td>
						      		</tr>
						      		</table>
						    </div>
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
									    var toolbar = [{
								            text:'出库',
								            iconCls:'icon-pencil',
								            handler:function(){
								            	$('#dlg').dialog('open')
								            }
								        },{
								            text:'打印',
								            iconCls:'icon-pencil',
								            handler:function(){
								            }
								        },'-',{
								            text:'导出',
								            iconCls:'icon-pencil',
								            handler:function(){alert('save')}
								        }];
								        $(function(){
								        	var rootpath = $("#rootpath").val();
								            var dg = $('#dg').datagrid({
								            	url:rootpath+'/stock/data',
								                pagination: true,
								                remoteFilter: true,
								                fitColumns: true,
								                rownumbers: true,
								                toolbar:toolbar
								            });
								            dg.datagrid('enableFilter');
								            $('#dlg').dialog('close')
								        });
								        function outstock(){
								            var ss = [];
								            var rows = $('#dg').datagrid('getSelections');
								            for(var i=0; i<rows.length; i++){
								                var row = rows[i];
								                ss.push(row.assetId);
								            }
								          var assetIds = ss.join(',');
								          
								          var assetUser = $("#assetUser").val();
								          var assetUseDepartment = $("#assetUseDepartment").val();
								          var assetUseDate = $("#assetUseDate").val();
								          var assetDeviceLocation = $("#assetDeviceLocation").val();
								          var assetAddUser = $("#assetAddUser").val();
								          
								          
								          $.ajax({
								    			url:"${pageContext.request.contextPath}/stock/outstock",
								    			type:"post",
								    			data:"assetIds="+assetIds+"&assetUser="+assetUser+"&assetUseDepartment="+assetUseDepartment
								    				+"&assetUseDate="+assetUseDate+"&assetDeviceLocation="+assetDeviceLocation+"&assetAddUser="+assetAddUser,
								    			dataType:"json",
								    			cache:false,
								    			success:function(response){
								    				$.messager.alert("提示","出库成功");
								    				$('#dlg').dialog('close');
								    				$('#dg').datagrid('reload');
								    			},
								    			error:function(e){
								    				$.messager.alert("提示","出库失败，请稍后再试或联系管理员");
								    				$('#dlg').dialog('close');
								    			}
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