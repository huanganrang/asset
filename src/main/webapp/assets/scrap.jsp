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
							                <th data-options="field:'assetName',width:100,align:'right'">设备名称</th>
							                <th data-options="field:'assetModel',width:100,align:'right'">设备型号</th>
							                <th data-options="field:'useTime',width:100">使用时间</th>
							                <th data-options="field:'scrapReason',width:150">报废原因</th>
							                <th data-options="field:'assetDeviceStatus',width:150">处理意见</th>
							            </tr>
							        </thead>
							    </table>
							    <div id="tb" style="padding:2px 5px;">
							        待报废设备超过: 
							        <select class="easyui-combobox" panelHeight="auto" id="yearSelect" style="width:100px">
							            <option value="1">1年</option>
							            <option value="2">2年</option>
							            <option value="3">3年</option>
							            <option value="4">4年</option>
							            <option value="5">5年</option>
							        </select>
							         截止时间: <input class="easyui-datetimebox" id="endDateInput" required style="width:140px">
							        <a href="#" class="easyui-linkbutton" id="searchBtn" iconCls="icon-search">查询</a>
							        
							        <a href="#" class="easyui-linkbutton" id="saveBtn" iconCls="icon-save">保存</a>
							        <a href="#" class="easyui-linkbutton" iconCls="icon-undo">导出</a>
							        <a href="#" class="easyui-linkbutton" iconCls="icon-print">打印</a>
							        <a href="#" class="easyui-linkbutton" id="scrapBtn" iconCls="icon-pencil">报废</a>
							        
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
								    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/date.js"></script>
								    <script type="text/javascript">
								        $(function(){
								        	var rootpath = $("#rootpath").val();
								            var dg = $('#dg').datagrid({
								            	url:rootpath+'/scrap/data',
								                pagination: true,
								                fitColumns: true,
								                rownumbers: true,
								                toolbar:'#tb'
								            });
								            
								            var time = new Date().Format("yyyy-MM-dd hh:mm:ss");
								            $('#endDateInput').datetimebox('setValue', time);
								            
								            $("#searchBtn").click(function(){
								            	var years = $("#yearSelect").combobox('getValue');
								            	//为loadGrid()添加参数  
								                var queryParams = $('#dg').datagrid('options').queryParams;  
								                queryParams.years = years;  
								                queryParams.endDate = $('#endDateInput').datetimebox('getValue');	
								                 //查询后返回首页
								                $('#dg').datagrid('options').pageNumber = 1;  
								                var p = $('#dg').datagrid('getPager');
								            	p.pagination({pageNumber: 1}); 
								             
								                //重新加载datagrid的数据  
								                $("#dg").datagrid('reload');  
								            	
								            });
								            
 											$("#saveBtn").click(function(){
 												saveStatus("待报废");
								            });
 											
 											
 											 $("#scrapBtn").click(function(){
 												saveStatus("报废");
 								            });
								          
								        });
								        
								        function saveStatus(status){
								            var ss = [];
								            var rows = $('#dg').datagrid('getSelections');
								            for(var i=0; i<rows.length; i++){
								                var row = rows[i];
								                if((status == "待报废" && row.assetDeviceStatus == "")
								                		|| (status == "报废" && row.assetDeviceStatus == "待报废")){
								               	 ss.push(row.assetId);
								                }
								            }
								          var assetIds = ss.join(',');
								          
								          $.ajax({
								    			url:"${pageContext.request.contextPath}/scrap/saveStatus",
								    			type:"post",
								    			data:"assetIds="+assetIds+"&status="+status,
								    			dataType:"json",
								    			cache:false,
								    			success:function(response){
								    				$.messager.alert("提示","操作成功");
								    				$('#dg').datagrid('reload');
								    			},
								    			error:function(e){
								    				$.messager.alert("提示","操作失败，请稍后再试或联系管理员");
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