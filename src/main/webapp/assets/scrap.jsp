<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/assets/common.jsp"%>
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
							     
								    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/date.js"></script>
								    <script type="text/javascript">
								        $(function(){
								        	var rootpath = $("#rootpath").val();
								            var dg = $('#dg').datagrid({
								            	url:rootpath+'/scrap/data',
								                pagination: true,
								                fitColumns: true,
								                fit:true,
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
