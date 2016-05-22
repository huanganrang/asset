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
	 .tablist>li:nth-child(4) {margin-left: 50%;margin-right: 1%;background: #FFF url(../images/plus.png)5px 65% no-repeat;padding-left: 30px;}
	 .tablist>li:nth-child(5) {background: #FFF url(../images/pencil.png)5px 65% no-repeat;margin-right: 1%;padding-left: 30px;}
	 .tablist>li:nth-child(6) {background: #FFF url(../images/key.png)5px 65% no-repeat; margin-right: 1%;padding-left: 30px;}
	 .tablist>li:nth-child(7) { background: #fff url(../images/Trash.png)5px 65% no-repeat; padding-left: 30px;}
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
 	<div class="page-content" style="height:100%;">
						<div class="row">
							<div class="col-xs-12">
								<div id="tabs">
								  <div class="tab current" data="/system/system">用户管理</div>
								  <div class="separator"></div>
								  <div class="tab" data="/system/roleManager">角色管理</div>
								</div>
								<!-- PAGE CONTENT BEGINS -->
								<div style="margin:20 0 10 0;">
										<ul class="tablist">
								        	<li><a id="btn_prev" href="#" > <</a> </li>
								            <li><a id="pageindex">0/0</a></li>
								            <li><a id="btn_next" href="#">> </a></li>
								            <li><a href="#" onclick="cAddUser()">添加</a></li>
								            <li><a href="#" onclick="cEditUser()">编辑</a></li>
								            <li><a href="#" onclick="multiGrant()">授权</a></li>
								            <li><a href="#" onClick="multiDelete()">批量删除</a></li>
								        </ul> 
								</div>
 								<div style="height:600px">
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
							     <div id="dlg" class="easyui-dialog" title="添加用户" style="width:400px;height:200px;padding:10px;top:200px;"
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
						    </div>
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
								    
								        $(function(){
								        	//全局变量
											var pagenumber = 1;
											var totalpage  = 1;
								        	var rootpath = $("#rootpath").val();
								            var dg = $('#dg').datagrid({
								            	url:rootpath+'/userController/dataGrid',
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
								        
								        function cAddUser()
								        {
								        	$('#dlg').dialog('open');
								        }
								        
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
								        
								        
								        function cEditUser(){
								        	  var rows = $('#dg').datagrid('getSelections');
								              if(rows.length < 1){
								            	   $.messager.alert("提示","请先选择一个用户");
								              }else{
								            		$("#idInput").val(rows[0].id);
								            		$("#nameInput1").val(rows[0].name);
								            		$('#dlg1').dialog('open');
								              }
									    }
								
								          
								          function multiGrant(){
								        	  var rows = $('#dg').datagrid('getSelections');
								            	 if(rows.length < 1){
									            		$.messager.alert("提示","请先选择一个用户");
									            }else{
								            			$('#dlg2').dialog('open');
									            }
									     }
									          
								          function  multiDelete(){
								        	 var rows = $('#dg').datagrid('getSelections');
							            	 if(rows.length < 1){
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
