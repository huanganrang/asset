<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/assets/common.jsp"%>
		<input type="hidden" id="company" value='${company}'/>
    <div style="height:420px">
								 <table id="dg"   style="width:700px;height:450px">
							   	 </table>
							   	 </div>
							     <div id="tb" style="padding:2px 5px;">
							        <input class="easyui-searchbox" id="searchInput"
										data-options="prompt:'',searcher:doSearch"
										style="width: 100px"></input>
							        <a href="#" class="easyui-linkbutton"  id="exportBtn" iconCls="icon-undo">导出</a>
							        <a href="#" class="easyui-linkbutton" id="printBtn" iconCls="icon-print">打印</a>
							        <a href="#" class="easyui-linkbutton" id="alloBtn" iconCls="icon-pencil">调度</a>
							    </div>
								    <script type="text/javascript">
									    var Company = eval($("#company").val());
								        $(function(){
								        	var rootpath = $("#rootpath").val();
								            var dg = $('#dg').datagrid({
								            	url:rootpath+'/allocation/data',
								                pagination: true,
								                fitColumns: true,
								                fit:true,
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
								            
								            $("#exportBtn").click(function(){
 												Export('asset', $('#dg'));
								            });
 											
 											$("#printBtn").click(function(){
 												 CreateFormPage("打印",$("#dg"));
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
								            if(ss == ""){
								            	$.messager.alert("提示","请输入设备去向");
								            	return false;
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