<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="/assets/common.jsp"%>
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
