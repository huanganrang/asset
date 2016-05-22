<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/assets/common.jsp"%>
    <style type="text/css">
     .datagrid-editable table{
		width: 155px ! important ; 
	}
	
	.datagrid-editable table .datebox{
		width: 155px ! important ; 
	}
	
	.datagrid-editable table .datebox input{
		width: 131px ! important ; 
	}
	
	.datagrid-editable-input{
		width: 155px ! important ; 
	}
    </style>
								  <input type="hidden" id = "assetId"  value = "${assetId }"/>
								   <table id="pg" class="easyui-propertygrid" style="width:700px;height:450px" data-options="
						                url:'${pageContext.request.contextPath}/ledger/pro?assetId=${assetId }',
						                method:'get',
						                showGroup:false,
						                showHeader:false,
						                toolbar:toolbar,
						                scrollbarSize:0
						            "></table>
						            
						             <div id="w" class="easyui-window" title="查看服务器"  style="width:800px;height:800px;">
								        <img src="${pageContext.request.contextPath}/pic/${assetId }.jpg" />
								    </div>
								<!-- PAGE CONTENT ENDS -->
								    <script type="text/javascript">
								    $(function(){
								    	$("img").error(function(){
								    		  $("img").replaceWith("图片找不到");
								    		});
								    });
								    
									    var toolbar = [{
								            text:'查看服务器',
								            iconCls:'icon-search',
								            handler:function(){
								            	$('#w').window('open');
								            }
								        },'-',{
								            text:'保存',
								            iconCls:'icon-save',
								            handler:getChanges
								        }];
									    function getChanges(){
								            var b = '';
								            var e = '';
								            var rows = $('#pg').propertygrid('getChanges');
								            for(var i=0; i<rows.length; i++){
								            	if("base" == rows[i].flag){
								                	b += rows[i].key + ':' + rows[i].value + ',';
								            	}
								            	if("ext" == rows[i].flag){
								            		e += rows[i].key + ':' + rows[i].value + ',';
								            	}
								            }
								        	 $.ajax({
								    			url:"${pageContext.request.contextPath}/ledger/update",
								    			type:"post",
								    			data:"b="+b+"&e="+e+"&assetId="+$("#assetId").val(),
								    			dataType:"json",
								    			cache:false,
								    			success:function(response){
								    				$.messager.alert("提示","修改成功");
								    			},
								    			error:function(e){
								    				$.messager.alert("提示","修改失败，请稍后再试或联系管理员");
								    			}
								    		});
								        }
								    </script>
