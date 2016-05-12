<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/assets/common.jsp"%>
 <style type="text/css">
	.datagrid .datagrid-pager  {
			display: none;
	}
	.datagrid-pager {
			display: none;
	}
 .tablist{width:100%; height:30px;}
	 .tablist>li{padding:0 1%; height:30px; line-height:30px;vertical-align: middle;float:left; background:#FFF; border-radius:2px; position:relative;}
	 .tablist>li:nth-child(1) {background: #FFF;}
	 .tablist>li:nth-child(2){margin-left:1%; line-height:30px; background:#fff; padding:0 2%;}
	 .tablist>li:nth-child(3) {margin-left:1%; background: #FFF;}
	 .tablist a{font-size: 13px;color:#666;text-decoration: none;}
	 .tablist>li:nth-child(4){margin-left:1%; line-height:30px; background: #e5e9eb;}
	 .tablist>li:nth-child(5){margin-left:1%; line-height:30px;background: #e5e9eb; }
	 .tablist>li:nth-child(6){margin-left:10%;line-height:30px;background: #e5e9eb;padding: 0;}
	 .tablist>li:nth-child(7){background: #e5e9eb;padding: 0;}
	 .tablist>li:nth-child(8){background: #e5e9eb;padding: 0;}
	 .tablist>li:nth-child(9){background: #e5e9eb;padding: 0;}
	 #tag_a{
	     width:40px;
	     margin-left:10px;
	     background: url("../assets/images/tag.png") #ffffff center center no-repeat;
	     cursor: pointer;
	 }
 	ul, ol {
		list-style: none;
		margin:0;
	}
	a{
		text-decoration: none;
	}
	
	#tabs{
		height:40px;
		width: 100%;
		border-bottom:1px solid #ccc;
	}
	#tabs .tab{
	    float:left;
		height: 40px;
		width:100px;
		text-align: center;
		line-height: 40px;
		vertical-align: middle;
		cursor: pointer;
	}
	
	.separator {
    float: left;
    height: 30px;
    border-left: 1px solid #ccc;
    border-right: 1px solid #fff;
    margin: 5px 1px;
}

.current {
    border-bottom: 2px solid #ed6c44;
}
</style>
<script src="${pageContext.request.contextPath}/assets/js/jquery.uploadify-3.1.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/js/uploadify.css" />
 	<div class="page-content" style="height:100%;">
						<div class="row">
							<div class="col-xs-12">
							    <!-- PAGE CONTENT BEGINS -->
 								<div id="tabs">
								  <div class="tab" data="/ledger/detail">台账管理</div>
								  <div class="separator"></div>
								  <div class="tab" data="/stock/tostock">库存</div>
								  <div class="separator"></div>
								  <div class="tab" data="/account/toaccount">对账</div>
								  <div class="separator"></div>
								  <div class="tab current" data="/scrap/toscrap">报废表</div>
								  <div class="separator"></div>
								  <div class="tab" data="/allocation/toallocation">调拨</div>
								</div>
  								<div style="margin:20 0 10 0;">
										<ul class="tablist">
								        	<li><a id="btn_prev" href="#" ><</a> </li>
								            <li><a id="pageindex">0/0</a></li>
								            <li><a id="btn_next" href="#"> ></a></li>
								            <li>待报废设备超过: 
										        <select class="easyui-combobox" panelHeight="auto" id="yearSelect" style="width:100px">
										            <option value="1">1年</option>
										            <option value="2">2年</option>
										            <option value="3">3年</option>
										            <option value="4">4年</option>
										            <option value="5">5年</option>
										        </select>
										    </li>
										    <li>
										    	    截止时间: <input class="easyui-datetimebox" id="endDateInput" required style="width:140px">
							        			 <a href="#" class="easyui-linkbutton" id="searchBtn" iconCls="icon-search">查询</a>
										    </li>
								            <li><a href="#" class="easyui-linkbutton" id="saveBtn" iconCls="icon-save">保存</a></li>
							        		<li><a href="#" class="easyui-linkbutton" iconCls="icon-undo" id="exportBtn">导出</a></li>
							        		<li><a href="#" class="easyui-linkbutton" iconCls="icon-print" id="printBtn">打印</a></li>
							        		<li><a href="#" class="easyui-linkbutton" id="scrapBtn" iconCls="icon-pencil">报废</a></li>
								        </ul> 
								</div>
								<div style="height:420px">
								  <table id="dg" >
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
							    </div>
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
							        <a href="#" class="easyui-linkbutton" iconCls="icon-undo" id="exportBtn">导出</a>
							        <a href="#" class="easyui-linkbutton" iconCls="icon-print" id="printBtn">打印</a>
							        <a href="#" class="easyui-linkbutton" id="scrapBtn" iconCls="icon-pencil">报废</a>
							        
							    </div>
						      </div>
						  </div>
								    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/date.js"></script>
								    <script type="text/javascript">
								        $(function(){
								        	var rootpath = $("#rootpath").val();
								        	//全局变量
											var pagenumber = 1;
											var totalpage  = 1;
								            var dg = $('#dg').datagrid({
								            	url:rootpath+'/scrap/data',
								                pagination: true,
								                fitColumns: true,
								                fit:true,
								                rownumbers: true,
								                onLoadSuccess:function(data)
												{
								               	 //注意先后顺序
													var p =$('#dg').datagrid('getPager'); 
								               		var total = data.total;
													var pagesize = p.pagination('options').pageSize;
													totalpage = Math.ceil(total/pagesize);
													$('#pageindex').text(pagenumber+'/'+totalpage);
													
													  $('#btn_next').unbind().bind('click', function(){
														  if(pagenumber < totalpage){
														  		p.pagination('select', ++pagenumber);
														  }
													  });
													  $('#btn_prev').unbind().bind('click', function(){
													  if(pagenumber >1){
														  console.log(pagenumber)
													  	   p.pagination('select', --pagenumber);
													  }
													  });
												},
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
 											
 											$("#exportBtn").click(function(){
 												Export('asset', $('#dg'));
								            });
 											
 											$("#printBtn").click(function(){
 												 CreateFormPage("打印",$("#dg"));
								            });
 											
 											 $("#scrapBtn").click(function(){
 												saveStatus("报废");
 								            });
								          
								        });
								        
								        function saveStatus(status){
								            var ss = [];
								            var rows = $('#dg').datagrid('getSelections');
								            if(rows.length < 1){
								            	$.messager.alert("提示","请先选择一条数据");
								            }
								            for(var i=0; i<rows.length; i++){
								                var row = rows[i];
								                if(status == "报废" && row.assetDeviceStatus != "待报废"){
								                	$.messager.alert("提示","报废前，请先保存数据");
								                	return;
								                }
								                
								                if(status == "报废" && row.assetDeviceStatus == "报废"){
								                	$.messager.alert("提示","该数据已被报废");
								                	return;
								                }
								                
								                if(status == "待报废" && row.assetDeviceStatus == "待报废"){
								                	$.messager.alert("提示","该数据已在待报废状态");
								                	return;
								                }
								                
								                if(status == "待报废" && row.assetDeviceStatus == "报废"){
								                	$.messager.alert("提示","已报废的数据，不能再被保存");
								                	return;
								                }
								                
								                if((status == "待报废" && row.assetDeviceStatus == "")
								                		|| (status == "报废" && row.assetDeviceStatus == "待报废")){
								               	 ss.push(row.assetId);
								                }
								            }
								          if(ss.length < 1){
								        	  $.messager.alert("提示","请确认你的报废流程");
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
