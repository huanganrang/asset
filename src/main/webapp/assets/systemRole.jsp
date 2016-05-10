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
	 .tablist>li:nth-child(1) {background: #FFF url(../images/4-1.png)50% 50% no-repeat;}
	 .tablist>li:nth-child(2){margin-left:1%; line-height:30px; background:#fff; padding:0 2%;}
	 .tablist>li:nth-child(3) {margin-left:1%; background: #FFF url(../images/4-2.png)50% 50% no-repeat;}
	 .tablist a{font-size: 13px;color:#666;text-decoration: none;}
	 .tablist>li:nth-child(4){margin-left:60%; margin-right:1%; padding-left:30px;}
	 
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

	
	.separator {
    float: left;
    height: 30px;
    border-left: 1px solid #ccc;
    border-right: 1px solid #fff;
    margin: 5px 1px;
	}


</style>
 	<div class="page-content" style="height:100%;">
						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div style="margin:20 0 10 0;">
										<ul class="tablist">
								        	<li><a id="btn_prev" href="#" > </a> </li>
								            <li><a id="pageindex">0/0</a></li>
								            <li><a id="btn_next" href="#"> </a></li>
								            <li><a href="#" onclick="$('#dlg').dialog('open');">添加</a></li>
								            <li><a href="#" onclick="clickEditRole()">编辑</a></li>
								            
								            <li><a href="#" onClick="deleteRole()">批量删除</a></li>
								        </ul>
								</div>
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
						   </div>
						 </div>
								    <script type="text/javascript">
								        $(function(){
								        	//全局变量
											var pagenumber = 1;
											var totalpage  = 1;
								        	var rootpath = $("#rootpath").val();
								            var dg = $('#dg').datagrid({
								            	url:rootpath+'/roleController/treeGrid',
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
								        
								        function clickEditRole(){
								        	var rows = $('#dg').datagrid('getSelections');
							            	if(rows.length < 1){
							            		$.messager.alert("提示","请先选择一个角色");
							            	}else{
							            		$("#idInput").val(rows[0].id);
							            		$("#nameInput1").val(rows[0].name);
							            		$("#seqInput1").val(rows[0].seq);
							            		$("#remark1").val(rows[0].remark);
							            		$('#dlg1').dialog('open');
							            	}
								        }
								        
								        function deleteRole()
								        {
								        	 var rows = $('#dg').datagrid('getSelections');
							            	 if(rows.length < 1){
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
