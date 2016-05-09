<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="/assets/common.jsp"%>
 <div style="height:420px">
								  <table id="dg">
							        <thead>
							            <tr>
							            	<th data-options="field:'ck',checkbox:true"></th>
							            	<!-- <th data-options="field:'assetId',hidden:true"></th> -->
							                <th data-options="field:'name',width:80">登录名称</th>
							                <th data-options="field:'createdatetime',width:100">创建时间</th>
							                <th data-options="field:'modifydatetime',width:80,align:'right'">最后修改时间</th>
							                <th data-options="field:'roleNames',width:80,align:'right'">所属角色名称</th>
							            </tr>
							        </thead>
							    </table>
							    </div>
							     <div id="dlg" class="easyui-dialog" title="添加用户" style="width:400px;height:200px;padding:10px"
						            data-options="
						                iconCls: 'icon-save',
						                buttons: [{
						                    text:'添加',
						                    iconCls:'icon-ok',
						                    handler:function(){
						                      addUser();
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
						      		<td>登录名称</td>
						      		<td>
						      		
						      		<input id="nameInput" style="width:150px;height:28px"/>
						      		</td>
						      		</tr>
						      		
						      		<tr>
						      		<td>密码</td>
						      		<td><input id="pwdInput" style="width:150px;height:28px" type="password"/></td>
						      		</tr>
						      		</table>
						    </div>
						    
						    
						    <div id="dlg1" class="easyui-dialog" title="编辑用户" style="width:400px;height:200px;padding:10px"
						            data-options="
						                iconCls: 'icon-save',
						                buttons: [{
						                    text:'提交',
						                    iconCls:'icon-ok',
						                    handler:function(){
						                      editUser();
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
						      		<td>登录名称<input id="idInput" type="hidden"/></td>
						      		<td>
						      		<input id="nameInput1" style="width:150px;height:28px"/>
						      		</td>
						      		</tr>
						      		
						      		<tr>
						      		<td>密码</td>
						      		<td><input id="pwdInput1" style="width:150px;height:28px" type="password"/></td>
						      		</tr>
						      		</table>
						    </div>
						    
						     <div id="dlg2" class="easyui-dialog" title="用户授权" style="width:400px;height:200px;padding:10px"
						            data-options="
						                iconCls: 'icon-save',
						                buttons: [{
						                    text:'添加',
						                    iconCls:'icon-ok',
						                    handler:function(){
						                      grant();
						                    }
						                },{
						                    text:'取消',
						                    handler:function(){
						                       $('#dlg2').dialog('close')
						                    }
						                }]
						            ">
						      		<table>
						      		<tr>
						      		<td>所属角色</td>
						      		<td><select id="roleIds" name="roleIds"
											style="width: 140px; height: 29px;"></select></td>
						      		</tr>
						      		</table>
						    </div>
								    <script type="text/javascript">
								    $.stringToList = function(value) {
								    	if (value != undefined && value != '') {
								    		var values = [];
								    		var t = value.split(',');
								    		for ( var i = 0; i < t.length; i++) {
								    			values.push('' + t[i]);/* 避免他将ID当成数字 */
								    		}
								    		return values;
								    	} else {
								    		return [];
								    	}
								    };
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
							            		$.messager.alert("提示","请先选择一个用户");
							            	}else{
							            		$("#idInput").val(rows[0].id);
							            		$("#nameInput1").val(rows[0].name);
							            		$('#dlg1').dialog('open');
							            	}
							            	
							            }
							        },'-',{
							            text:'批量授权',
							            iconCls:'icon-pencil',
							            handler:function(){
							            	var rows = $('#dg').datagrid('getSelections');
							            	 if(rows.length < 0){
								            		$.messager.alert("提示","请先选择一个用户");
								            }else{
							            			$('#dlg2').dialog('open');
								            }
							            }
							        },'-',{
							            text:'批量删除',
							            iconCls:'icon-pencil',
							            handler:function(){
							            	 var rows = $('#dg').datagrid('getSelections');
							            	 if(rows.length < 0){
								            		$.messager.alert("提示","请先选择一个用户");
								            }else{
								            	$.messager.confirm('询问', '您是否要删除当前用户?', function(r){
								                    if (r){
								                    	    var ss = [];
												            for(var i=0; i<rows.length; i++){
												                var row = rows[i];
												                ss.push(row.id);
												            }
												          var ids = ss.join(',');
												          $.messager.progress({
												              title:'请等待',
												              msg:'加载中...'
												         });
												     	var url = rootpath+"/userController/batchDelete";
												          $.ajax({
												    			url:url,
												    			type:"post",
												    			data:"ids="+ids,
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
								            	url:rootpath+'/userController/dataGrid',
								                pagination: true,
								                toolbar:toolbar,
								                fitColumns: true,
								                fit:true,
								                rownumbers: true
								            });
								            
								            $('#roleIds').combotree({
								    			url : rootpath+'/roleController/tree',
								    			parentField : 'pid',
								    			lines : true,
								    			panelHeight : 'auto',
								    			multiple : true,
								    			onLoadSuccess : function() {
								    			},
								    			cascadeCheck : false,
								    			value : $.stringToList('${user.roleIds}')
								    		});
								            
								            $('#dlg').dialog('close');
								            $('#dlg1').dialog('close');
								            $('#dlg2').dialog('close');
								        });
								        
								        function addUser(){
								          var nameInput = $("#nameInput").val();
								          var pwdInput = $("#pwdInput").val();
								          $.messager.progress({
								              title:'请等待',
								              msg:'加载中...'
								         });
								     	var url = rootpath+"/userController/add";
								          $.ajax({
								    			url:url,
								    			type:"post",
								    			data:"name="+nameInput+"&pwd="+pwdInput+"&id="+nameInput,
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
								        
								        
								        function editUser(){
									          var nameInput = $("#nameInput1").val();
									          var pwdInput = $("#pwdInput1").val();
									          var idInput = $("#idInput").val();
									          $.messager.progress({
									              title:'请等待',
									              msg:'加载中...'
									         });
									          url = rootpath+"/userController/editPwd";
									          $.ajax({
									    			url:url,
									    			type:"post",
									    			data:"name="+nameInput+"&pwd="+pwdInput+"&id="+idInput,
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
								        
								        
								        function grant(){
								        	 var rows = $('#dg').datagrid('getSelections');
								        	  var ss = [];
									            for(var i=0; i<rows.length; i++){
									                var row = rows[i];
									                ss.push(row.id);
									            }
									          var ids = ss.join(',');
									          $.messager.progress({
									              title:'请等待',
									              msg:'加载中...'
									         });
									          url = rootpath + '/userController/grant',
									          $.ajax({
									    			url:url,
									    			type:"post",
									    			data:"ids="+ids+"&roleIds="+$("#roleIds").combotree('getValue'),
									    			dataType:"json",
									    			cache:false,
									    			success:function(response){
									    				$.messager.progress('close');
									    				$('#dlg2').dialog('close');
									    				$('#dg').datagrid('reload');
									    			},
									    			error:function(e){
									    				$.messager.progress('close');
									    				$.messager.alert("提示","操作失败，请稍后再试或联系管理员");
									    				$('#dlg2').dialog('close');
									    			}
									    		});
									        }
								    </script>
								<!-- PAGE CONTENT ENDS -->
