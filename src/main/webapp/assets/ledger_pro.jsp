<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/assets/common.jsp"%>

								   <table id="pg" class="easyui-propertygrid" style="width:700px" data-options="
						                url:'${pageContext.request.contextPath}/ledger/pro?assetId=${assetId }',
						                method:'get',
						                showGroup:false,
						                showHeader:false,
						                toolbar:toolbar,
						                scrollbarSize:0
						            "></table>
								<!-- PAGE CONTENT ENDS -->
								    <script type="text/javascript">
									    var toolbar = [{
								            text:'查看服务器',
								            iconCls:'icon-search',
								            handler:function(){
								            	//open model window
								            }
								        },'-',{
								            text:'Save',
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
