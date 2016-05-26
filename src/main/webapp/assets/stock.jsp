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
	 .tablist>li{padding:0 1%; height:30px;line-height:30px;vertical-align: middle;float:left; background:#FFF; border-radius:2px; position:relative;}
	 .tablist>li:nth-child(1) {background: #FFF;}
	 .tablist>li:nth-child(2){margin-left:1%; line-height:30px; background:#fff; padding:0 2%;}
	 .tablist>li:nth-child(3) {margin-left:1%; background: #FFF;}
	 .tablist a{font-size: 13px;color:#666;text-decoration: none;}
	 .tablist>li:nth-child(4){margin-left:60%; margin-right:1%; }
	 .tablist>li:nth-child(5){margin-right:1%; }
	 .tablist>li:nth-child(6){margin-right:1%; }
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
								  <div class="tab" data="/ledger/detail">台账明细</div>
								  <div class="separator"></div>
								  <div class="tab current" data="/stock/tostock">库存</div>
								  <div class="separator"></div>
								  <div class="tab" data="/account/toaccount">对账</div>
								  <div class="separator"></div>
								  <div class="tab" data="/scrap/toscrap">报废表</div>
								  <div class="separator"></div>
								  <div class="tab" data="/allocation/toallocation">调拨</div>
								</div>
  								<div style="margin:20 0 10 0;">
										<ul class="tablist">
								        	<li><a id="btn_prev" href="#" ><</a> </li>
								            <li><a id="pageindex">0/0</a></li>
								            <li><a id="btn_next" href="#">></a></li>
								            <li><a href="javascript:void(0)" onclick="out()">出库</a></li>
								            <li><a href="#" onClick="CreateFormPage('打印',$('#dg'));">打印</a></li>
								            <li><a href="#" onClick="Export('asset', $('#dg'))">导出</a></li>
								            
								        </ul>
								</div>
								<div style="height:600px">
								  <table id="dg" style="width:800px;height:600px">
							        <thead>
							            <tr>
							            	<th data-options="field:'ck',checkbox:true"></th>
							            	<!-- <th data-options="field:'assetId',hidden:true"></th> -->
							                <th data-options="field:'assetItNumber',width:120">IT验收编号</th>
							                <th data-options="field:'assetNumber',width:120">固定资产编号</th>
							                <th data-options="field:'assetName',width:120,align:'right'">设备名称</th>
							                <th data-options="field:'assetModel',width:80,align:'right'">设备型号</th>
							                <th data-options="field:'assetAddMethod',width:250">设备增加方式</th>
							            </tr>
							        </thead>
							    </table>
							    </div>
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
						  </div>
						  </div>
								    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/datagrid-filter.js"></script>
								    <script type="text/javascript">
								    /*	
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
								            	 CreateFormPage("打印",$("#dg")); 
								            }
								        },'-',{
								            text:'导出',
								            iconCls:'icon-pencil',
								            handler:function(){
								            	Export('asset', $('#dg'));
								            }
								        }];*/
								        
								        function out(){
								        	  var rows = $('#dg').datagrid('getSelections');
									            if(rows.length == 0){
									            	$.messager.alert("提示","请先选择一条记录");
									            	return false;
										        }
								        	$('#dlg').dialog('open');
								        }
								        $(function(){
								        	var rootpath = $("#rootpath").val();
								        	//全局变量
											var pagenumber = 1;
											var totalpage  = 1;
								            var dg = $('#dg').datagrid({
								            	url:rootpath+'/stock/data',
								                pagination: true,
								                remoteFilter: true,
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
								            dg.datagrid('enableFilter');
								            $('#dlg').dialog('close');
								            $("#tag_a").click(function(){
								        		//为loadGrid()添加参数  
								        	    var queryParams = $('#dg').datagrid('options').queryParams;  
								        	    queryParams.checkNumber = "1";  
								        	     //查询后返回首页
								        	    $('#dg').datagrid('options').pageNumber = 1;  
								        	    var p = $('#dg').datagrid('getPager');
								        		p.pagination({pageNumber: 1}); 
								        	    //重新加载datagrid的数据  
								        	    $("#dg").datagrid('reload');  
								        	});
								        });
								        function outstock(){
								            var ss = [];
								            var rows = $('#dg').datagrid('getSelections');
								            if(rows.length == 0){
								            	$.messager.alert("提示","请先选择一条记录");
								            	return false;
									        }
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
