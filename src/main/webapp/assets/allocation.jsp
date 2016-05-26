<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/assets/common.jsp"%>
<style>
	 .datagrid .datagrid-pager  {
			display: none;
	}
	.datagrid-pager {
			display: none;
	} 
 	 .tablist{width:100%; height:30px;}
	 .tablist>li{padding:0 1%; height:30px;line-height:30px;vertical-align: middle;float:left; background:#FFF; border-radius:2px; position:relative;}
	 .tablist>li:nth-child(1) {background: #FFF; }
	 .tablist>li:nth-child(2){margin-left:1%; line-height:30px; background:#fff; padding:0 2%;}
	 .tablist>li:nth-child(3) {margin-left:1%; }
	 .tablist a{font-size: 13px;color:#666;text-decoration: none;}
	 .tablist>li:nth-child(4){margin-left:1%; background: #e5e9eb;}
	 .tablist>li:nth-child(5){margin-left:40%; margin-right:1%; padding-left:1%;}
	 
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
								<!-- PAGE CONTENT BEGINS -->
								  <div id="tabs">
									  <div class="tab" data="/ledger/detail">台账明细</div>
									  <div class="separator"></div>
									  <div class="tab" data="/stock/tostock">库存</div>
									  <div class="separator"></div>
									  <div class="tab" data="/account/toaccount">对账</div>
									  <div class="separator"></div>
									  <div class="tab" data="/scrap/toscrap">报废表</div>
									  <div class="separator"></div>
									  <div class="tab current" data="/allocation/toallocation">调拨</div>
								  </div>
								  <input type="hidden" id="company" value='${company}'/>
								  <div style="margin:20 0 10 0;">
										<ul class="tablist">
								        	<li><a id="btn_prev" href="#" ><</a> </li>
								            <li><a id="pageindex">0/0</a></li>
								            <li><a id="btn_next" href="#"> ></a></li>
								            <li> <input class="easyui-searchbox" id="searchInput"
										data-options="prompt:'',searcher:doSearch"
										style="width:100%;height:30px;"></input></li>
								            <li><a href="#" id="exportBtn" iconCls="icon-undo">导出</a></li>
								            <li><a href="#" id="printBtn"  iconCls="icon-print">打印</a></li>
								            <li><a href="#" id="deviceBtn" iconCls="icon-undo">设备去向</a></li>
								            <li><a href="#" id="alloBtn" iconCls="icon-pencil">调拨</a></li>
								        </ul>
								  </div>
								<!-- 
								<div id="tb" style="padding:2px 5px;">
							        <input class="easyui-searchbox" id="searchInput"
										data-options="prompt:'',searcher:doSearch"
										style="width: 100px"></input>
							        <a href="#" class="easyui-linkbutton"  id="exportBtn" iconCls="icon-undo">导出</a>
							        <a href="#" class="easyui-linkbutton" id="printBtn" iconCls="icon-print">打印</a>
							        <a href="#" class="easyui-linkbutton" id="alloBtn" iconCls="icon-pencil">调拨</a>
							    </div> -->
   								 <div style="height:600px">
								 <table id="dg"   style="width:800px;height:600px">
								 	<!-- 
								 	<thead>
							            <tr>
							            	<th data-options="field:'ck',checkbox:true"></th>
							            	<th data-options="field:'asset_it_number',width:80">IT验收编号</th>
							                <th data-options="field:'asset_number',width:80">固定资产编号</th>
							                <th data-options="field:'asset_name',width:100">设备名称</th>
							                <th data-options="field:'asset_model',width:80,align:'right'">设备型号</th>
							                <th data-options="field:'asset_device_status',width:80,align:'right'">设备状态</th>
							                <th data-options="field:'allocation_company',editor: {type:'combobox',options:{data:Company, valueField: 'dicValue', textField: 'dicKey'}},width:80,align:'right'">设备去向</th>
							                <th data-options="field:'allocation_date',width:80,align:'right'">调拨时间</th>
							            </tr>
							        </thead> -->
							   	 </table>
							   	 </div>
							   	 <div id="dlg" class="easyui-dialog" title="新增设备去向" style="width:300px;height:150px;padding:10px"
						            data-options="
						                iconCls: 'icon-save',
						                buttons: [{
						                    text:'添加',
						                    iconCls:'icon-ok',
						                    handler:function(){
						                      addCompany();
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
						      		<td>设备去向</td>
						      		<td>
						      		<input id="companyInput"/>
						      		</td>
						      		</tr>
						      		</table>
						    	</div>
				    		 </div>
						  </div>
						  </div>
								    <script type="text/javascript">
								        $(function(){
								            var Company = eval($("#company").val());
								  		      
								        	var rootpath = $("#rootpath").val();
								        	//全局变量
											var pagenumber = 1;
											var totalpage  = 1;
											 
								            var dg = $('#dg').datagrid({
								            	url:rootpath+'/allocation/data',
								                pagination: true,
								                fitColumns: true,
								                fit:true,
								                rownumbers: true,
								                columns: [[
								                           	  { field: 'ck', checkbox:true}, 
								                              { field: 'asset_it_number', title: 'IT验收编号',width:80},
								                              { field: 'asset_number', title: '固定资产编号',width:80},
								                              { field: 'asset_name', title: '设备名称',width:80},
								                              { field: 'asset_model', title: '设备型号',width:80},
								                              { field: 'asset_device_status', title: '设备状态',width:80},
								                              { field: 'allocation_company', title: '设备去向',width:80,editor: { type: 'combobox',  options: { data: Company, valueField: "dicValue", textField: "dicKey"} }},
								                              { field: 'allocation_date', title: '调拨时间',width:80}, 
								                          ]],
								                /* checkOnSelect:false, */
								               // toolbar:'#tb',
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
								                onHeaderContextMenu: function(e, currfield){
								                    e.preventDefault();
								                  	if(currfield == "allocation_company"){
								                  		 $('#dlg').dialog('open');
								                  	}
								                },
								                onClickCell: onClickCell
								            });
								            
								            $("#exportBtn").click(function(){
 												Export('asset', $('#dg'));
								            });
 											
 											$("#printBtn").click(function(){
 												 CreateFormPage("打印",$("#dg"));
								            });

 											$("#deviceBtn").click(function(){
 												$('#dlg').dialog('open');
								            });
 											
								            $("#alloBtn").click(allocation);
								            
								            $('#dlg').dialog('close');
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
								            var rows = $('#dg').datagrid('getSelections');
								            if(rows.length == 0){
								            	$.messager.alert("提示","请先选择一条记录");
								            	return false;
								            }
								            for(var i=0; i<rows.length; i++){
								            	     if(rows[i].allocation_company != ""){
								            			ss += rows[i].asset_id + ':' + rows[i].allocation_company + ',';
								            	     }
								            }
								            if(ss == ""){
								            	$.messager.alert("提示","请输入设备去向");
								            	return false;
								            }
									            $.messager.progress({
										              title:'请等待',
										              msg:'加载中...'
										         });
									           $.ajax({
									    			url:"${pageContext.request.contextPath}/allocation/allocation",
									    			type:"post",
									    			data:"ss="+ss,
									    			dataType:"json",
									    			cache:false,
									    			success:function(response){
									    				$.messager.progress('close');
									    				$.messager.alert("提示","调拨成功");
									    				$('#dg').datagrid('reload');
									    			},
									    			error:function(e){
									    				$.messager.progress('close');
									    				$.messager.alert("提示","调拨失败，请稍后再试或联系管理员");
									    			}
									    		});
								            
								        } 
								        
								        function addCompany(){
								        	var company = $("#companyInput").val();
								        	  $.messager.progress({
									              title:'请等待',
									              msg:'加载中...'
									         });
								        	$.ajax({
								    			url:"${pageContext.request.contextPath}/allocation/addCompany",
								    			type:"post",
								    			data:"company="+company,
								    			dataType:"json",
								    			cache:false,
								    			success:function(response){
								    				$.messager.progress('close');
								    				$('#dlg').dialog('close');
								    				if(response.success){
								    					$("#mainFrame",parent.document.body).attr('src', $("#mainFrame",parent.document.body).attr('src'));
									    				$.messager.alert("提示","添加成功");
								    				}else{
									    				$.messager.alert("提示","添加失败，请稍后再试或联系管理员");
								    				}
								    			},
								    			error:function(e){
								    				$.messager.progress('close');
								    				$('#dlg').dialog('close');
								    				$.messager.alert("提示","添加失败，请稍后再试或联系管理员");
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