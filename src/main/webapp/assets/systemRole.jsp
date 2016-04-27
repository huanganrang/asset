<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="/assets/common.jsp"%>
 <div style="height:420px">
								  <table id="dg">
							        <thead>
							            <tr>
							            	<th data-options="field:'ck',checkbox:true"></th>
							            	<!-- <th data-options="field:'assetId',hidden:true"></th> -->
							                <th data-options="field:'name',width:60">角色名称</th>
							                <th data-options="field:'seq',width:20">排序</th>
							                <th data-options="field:'pname',width:20,align:'right'">上级角色</th>
							                <th data-options="field:'resourceIds',width:180,align:'right',formatter:formatResource" >拥有资源</th>
							                <th data-options="field:'remark',width:20,align:'right'">备注</th>
							            </tr>
							        </thead>
							    </table>
							    </div>
							     <div id="dlg" class="easyui-dialog" title="添加角色" style="width:400px;height:200px;padding:10px"
						            data-options="
						                iconCls: 'icon-save',
						                buttons: [{
						                    text:'添加',
						                    iconCls:'icon-ok',
						                    handler:function(){
						                      addRole();
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
						      		<td>角色名称</td>
						      		<td>
						      		<input id="nameInput"/>
						      		</td>
						      		</tr>
						      		<tr>
						      		<td>排序</td>
						      		<td>
						      		<input id="seqInput"/>
						      		</td>
						      		</tr>
						      		<tr>
						      		<td >上级角色</td>
						      		<td><select id="pid"
											style="width: 140px; height: 29px;"></select></td>
						      		</tr>
						      		
						      		<tr>
						      		<td >备注</td>
						      		<td><textarea id="remark" rows="" cols="" class="span5"></textarea></td>
						      		</tr>
						      		</table>
						    </div>
						    
						    
						    <div id="dlg1" class="easyui-dialog" title="编辑角色" style="width:600px;height:300px;padding:10px"
						            data-options="
						                iconCls: 'icon-save',
						                buttons: [{
						                    text:'提交',
						                    iconCls:'icon-ok',
						                    handler:function(){
						                      editRole();
						                    }
						                },{
						                    text:'取消',
						                    handler:function(){
						                       $('#dlg1').dialog('close')
						                    }
						                }]
						            ">
						      		<table>
						      		<tr>
						      		<td>角色名称</td>
						      		<td>
						      		<input id="nameInput1"/>
						      		<input id="idInput" type="hidden"/>
						      		</td>
						      		</tr>
						      		<tr>
						      		<td>排序</td>
						      		<td>
						      		<input id="seqInput1"/>
						      		</td>
						      		</tr>
						      		<tr>
						      		<td >上级角色</td>
						      		<td><select id="pid1"
											style="width: 140px; height: 29px;"></select></td>
						      		</tr>
						      		
						      		<tr>
						      		<td >备注</td>
						      		<td><textarea id="remark1" rows="" cols="" class="span5"></textarea></td>
						      		</tr>
						      		</table>
						    </div>
								    <script type="text/javascript">
								    var toolbar = [{
							            text:'添加',
							            iconCls:'icon-pencil',
							            handler:function(){
							            	$('#dlg').dialog('open');
							            }
							        },'-',{
							            text:'编辑',
							            iconCls:'icon-pencil',
							            handler:function(){
							            	var rows = $('#dg').datagrid('getSelections');
							            	if(rows.length < 0){
							            		$.messager.alert("提示","请先选择一个角色");
							            	}else{
							            		$("#idInput").val(rows[0].id);
							            		$("#nameInput1").val(rows[0].name);
							            		$("#seqInput1").val(rows[0].seq);
							            		$("#remark1").val(rows[0].remark);
							            		$('#dlg1').dialog('open');
							            	}
							            	
							            }
							        },{
							            text:'删除',
							            iconCls:'icon-pencil',
							            handler:function(){
							            	 var rows = $('#dg').datagrid('getSelections');
							            	 if(rows.length < 0){
								            		$.messager.alert("提示","请先选择一个角色");
								            }else{
								            	$.messager.confirm('询问', '您是否要删除当前角色?', function(r){
								                    if (r){
								                    	  var id = rows[0].id;
												          $.messager.progress({
												              title:'请等待',
												              msg:'加载中...'
												         });
												     	var url = rootpath+"/roleController/delete";
												          $.ajax({
												    			url:url,
												    			type:"post",
												    			data:"id="+id,
												    			dataType:"json",
												    			cache:false,
												    			success:function(response){
												    				if(response.success){
													    				$.messager.progress('close');
													    				$('#dg').datagrid('reload');
												    				}
												    			},
												    			error:function(e){
												    				$.messager.progress('close');
												    				$.messager.alert("提示","操作失败，请稍后再试或联系管理员");
												    			}
												    		});
								                    }
								                });
								            }
							            }
							        }];
								        $(function(){
								        	var rootpath = $("#rootpath").val();
								            var dg = $('#dg').datagrid({
								            	url:rootpath+'/roleController/treeGrid',
								                pagination: true,
								                toolbar:toolbar,
								                fitColumns: true,
								                fit:true,
								                rownumbers: true
								            });
								            
								            $('#pid').combotree({
								    			url : rootpath+'/roleController/allTree',
								    			parentField : 'pid',
								    			lines : true,
								    			panelHeight : 'auto',
								    			value : '${role.pid}',
								    			onLoadSuccess : function() {
								    			}
								    		});
								            
								            $('#pid1').combotree({
								    			url : rootpath+'/roleController/allTree',
								    			parentField : 'pid',
								    			lines : true,
								    			panelHeight : 'auto',
								    			value : '${role.pid}',
								    			onLoadSuccess : function() {
								    			}
								    		});
								            
								            $('#dlg').dialog('close');
								            $('#dlg1').dialog('close');
								        });
								        
								        function addRole(){
								          var nameInput = $("#nameInput").val();
								          var seqInput = $("#seqInput").val();
								          var pid = $("#pid").combotree('getValue');
								          var remark = $("#remark").val();
								          $.messager.progress({
								              title:'请等待',
								              msg:'加载中...'
								         });
								     	var url = rootpath+"/roleController/add";
								          $.ajax({
								    			url:url,
								    			type:"post",
								    			data:"name="+nameInput+"&seq="+seqInput+"&pid="+pid+"&remark="+remark,
								    			dataType:"json",
								    			cache:false,
								    			success:function(response){
								    				if(response.success){
									    				$.messager.progress('close');
									    				$('#dlg').dialog('close');
									    				$('#dg').datagrid('reload');
								    				}else{
								    					$.messager.progress('close');
									    				$.messager.alert("提示",response.msg);
								    				}
								    			},
								    			error:function(e){
								    				$.messager.progress('close');
								    				$.messager.alert("提示","操作失败，请稍后再试或联系管理员");
								    				$('#dlg').dialog('close');
								    			}
								    		});
								        }
								        
								        
								        function editRole(){
									          var nameInput = $("#nameInput1").val();
									          var seqInput = $("#seqInput1").val();
									          var pid = $("#pid1").combotree('getValue')
									          var remark = $("#remark1").val();
									          var id = $("#idInput").val();
									          $.messager.progress({
									              title:'请等待',
									              msg:'加载中...'
									         });
									      	var url = rootpath+"/roleController/edit";
									          $.ajax({
									    			url:url,
									    			type:"post",
									    			data:"name="+nameInput+"&seq="+seqInput+"&pid="+pid+"&remark="+remark+"&id="+id,
									    			dataType:"json",
									    			cache:false,
									    			success:function(response){
									    				$.messager.progress('close');
									    				$('#dlg1').dialog('close');
									    				$('#dg').datagrid('reload');
									    			},
									    			error:function(e){
									    				$.messager.progress('close');
									    				$.messager.alert("提示","操作失败，请稍后再试或联系管理员");
									    				$('#dlg1').dialog('close');
									    			}
									    		});
									        }
								        
								        
								        function formatResource(val,row){
								        	if (val) {
												return row.resourceNames;
											}
											return '';
								        }
								    </script>
								<!-- PAGE CONTENT ENDS -->
