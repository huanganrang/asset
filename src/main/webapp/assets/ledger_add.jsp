<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/assets/common.jsp"%>
					<input type="hidden" id = "cate"  value = "${cate }"/>
					<input type="hidden" id = "type"  value = "${type }"/>
								   <table id="pg" class="easyui-propertygrid" style="width:700px;height:480px" data-options="
						                url:'${pageContext.request.contextPath}/ledger/addPro?cate='+$('#cate').val()+'&type='+$('#type').val(),
						                method:'get',
						                showGroup:false,
						                showHeader:false,
						                toolbar:toolbar,
						                scrollbarSize:0
						            "></table>
								<!-- PAGE CONTENT ENDS -->
								    <script type="text/javascript">
									    var toolbar = [{
								            text:'选择图片',
								            iconCls:'icon-search',
								            handler:function(){
								            	//open model window
								            }
								        },'-',{
								            text:'提交',
								            iconCls:'icon-save',
								            handler:getChanges
								        }];
									    function getChanges(){
								            var b = '';
								            var e = '';
								            var rows = $('#pg').propertygrid('getRows');
								            for(var i=0; i<rows.length; i++){
								            	if("base" == rows[i].flag){
								                	b += rows[i].key + ':' + rows[i].value + ',';
								            	}
								            	if("ext" == rows[i].flag){
								            		e += rows[i].key + ':' + rows[i].name + ':' + rows[i].value + ',';
								            	}
								            }
								        	 $.ajax({
								    			url:"${pageContext.request.contextPath}/ledger/save",
								    			type:"post",
								    			data:"b="+b+"&e="+e+"&c="+$("#cate").val(),
								    			dataType:"json",
								    			cache:false,
								    			success:function(response){
								    				$.messager.alert("提示","新增成功");
								    			},
								    			error:function(e){
								    				$.messager.alert("提示","新增失败，请稍后再试或联系管理员");
								    			}
								    		});
								        }
									    
									    $(function(){
									    	$('#pg').propertygrid({
									    		onBeginEdit:function(index,row){
									    			if(index == 0 || index == 3){
										    			var opts = $('#pg').datagrid('getEditors', index); 
										    			opts[0].target.combobox({
											    			onSelect: function(newValue){
													    			if(newValue.dicType == 101){
													    				getItNumber(newValue.dicKey);
													    			}else{
													    				changeProperties(newValue.dicKey,newValue.dicValue);
													    			}
													    		}
									    				});
									    			}
									    		}
									    	});
									    });
									    
									    function getItNumber(type){
									    	 $.ajax({
									    			url:"${pageContext.request.contextPath}/ledger/getItNumber",
									    			type:"get",
									    			data:"ownership="+type,
									    			dataType:"json",
									    			cache:false,
									    			success:function(response){
									    				$('#pg').propertygrid('updateRow',{
									    					index: 1,
									    					row: {
									    						name: 'IT验收编号',
									    						value: response,
									    						key: 'assetItNumber',
									    						flag: 'base'
									    					}
									    				});
									    			},
									    			error:function(e){
									    			}
									    		});
									    	
									    }
									    
									    function changeProperties(cate,cateValue){
									    	var rootpath = $("#rootpath").val();
									    	var cates = cateValue.split(",");
									    	if(cates.length == 2){
									    		$("#cate").val(cates[1]);
									    	}else{
									    		$("#cate").val(cateValue);
									    	}
									    	$('#pg').propertygrid({
									    	    url:rootpath+'/ledger/addPro?cate='+cateValue+'&type='+$('#type').val()
									    	}); 
									    }
								    </script>
	