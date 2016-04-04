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
								 <table id="dg"   style="width:700px;height:450px">
							   	 </table>
							     <div id="tb" style="padding:2px 5px;">
							        <input class="easyui-searchbox" id="searchInput"
										data-options="prompt:'',searcher:doSearch"
										style="width: 100px"></input>
							        <a href="#" class="easyui-linkbutton" iconCls="icon-undo">导出</a>
							        <a href="#" class="easyui-linkbutton" iconCls="icon-print">打印</a>
							        <a href="#" class="easyui-linkbutton" id="alloBtn" iconCls="icon-pencil">调度</a>
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
								    <script type="text/javascript">
									    var Company = eval($("#company").val());
								        $(function(){
								        	var rootpath = $("#rootpath").val();
								            var dg = $('#dg').datagrid({
								            	url:rootpath+'/allocation/data',
								                pagination: true,
								                fitColumns: true,
								                rownumbers: true,
								                columns: [[
								                           	  /* { field: 'ck', checkbox:true}, */
								                              { field: 'asset_it_number', title: 'IT验收编号'},
								                              { field: 'asset_number', title: '固定资产编号'},
								                              { field: 'asset_name', title: '设备名称'},
								                              { field: 'asset_model', title: '设备型号'},
								                              { field: 'asset_device_status', title: '设备状态'},
								                              { field: 'allocation_company', title: '设备去向',editor: { type: 'combobox',  options: { data: Company, valueField: "dicValue", textField: "dicKey"} }},
								                              { field: 'allocation_date', title: '调拨时间'}, 
								                          ]],
								                /* checkOnSelect:false, */
								                toolbar:'#tb',
								                onClickCell: onClickCell
								            });
								            
								            $("#alloBtn").click(allocation);
								        });
								        
								        
								        $.extend($.fn.datagrid.methods, {
											editCell: function(jq,param){
												return jq.each(function(){
													var opts = $(this).datagrid('options');
													var fields = $(this).datagrid('getColumnFields',true).concat($(this).datagrid('getColumnFields'));
													for(var i=0; i<fields.length; i++){
														var col = $(this).datagrid('getColumnOption', fields[i]);
														col.editor1 = col.editor;
														if (fields[i] != param.field){
															col.editor = null;
														}
													}
													$(this).datagrid('beginEdit', param.index);
													for(var i=0; i<fields.length; i++){
														var col = $(this).datagrid('getColumnOption', fields[i]);
														col.editor = col.editor1;
													}
												});
											}
										});
										
										var editIndex = undefined;
										function endEditing(field){
											if (editIndex == undefined){return true}
											if ($('#dg').datagrid('validateRow', editIndex)){
												$('#dg').datagrid('endEdit', editIndex);
												editIndex = undefined;
												return true;
											} else {
												return false;
											}
										}
										function onClickCell(index, field){
											if (endEditing(field)){
												$('#dg').datagrid('selectRow', index)
														.datagrid('editCell', {index:index,field:field});
												editIndex = index;
											}
										}
								        function allocation(){
								            var ss ="";
								            $('#dg').datagrid('endEdit', editIndex);
								            var rows = $('#dg').datagrid('getChanges');
								            for(var i=0; i<rows.length; i++){
								            		ss += rows[i].asset_id + ':' + rows[i].allocation_company + ',';
								            }
								           $.ajax({
								    			url:"${pageContext.request.contextPath}/allocation/allocation",
								    			type:"post",
								    			data:"ss="+ss,
								    			dataType:"json",
								    			cache:false,
								    			success:function(response){
								    				$.messager.alert("提示","调拨成功");
								    				$('#dg').datagrid('reload');
								    			},
								    			error:function(e){
								    				$.messager.alert("提示","调拨失败，请稍后再试或联系管理员");
								    			}
								    		});
								        } 
								        
								        function doSearch(value){
							            	//为loadGrid()添加参数  
							                var queryParams = $('#dg').datagrid('options').queryParams;  
							                queryParams.key = value;  
							                 //查询后返回首页
							                $('#dg').datagrid('options').pageNumber = 1;  
							                var p = $('#dg').datagrid('getPager');
							            	p.pagination({pageNumber: 1}); 
							             
							                //重新加载datagrid的数据  
							                $("#dg").datagrid('reload'); 
								        };
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