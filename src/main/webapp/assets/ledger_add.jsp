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
					<input type="hidden" id = "type"  value = "${type }"/>
					<form id="ledgerForm" enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath}/ledger/save" style="display:none">
						<input type="file" id = "upload" name="img"  />
						<input type="hidden" id = "cate" name="c"  value = "${cate }"/>
						<input type="hidden"  id ="b"  name="b" />
						<input type="hidden"  id ="e"  name="e" />
					</form>
					
								   <table id="pg" class="easyui-propertygrid" style="width:800px;height:480px" data-options="
						                url:'${pageContext.request.contextPath}/ledger/addPro?cate=${cate }&type=${type }',
						                method:'get',
						                showGroup:false,
						                showHeader:false,
						                toolbar:toolbar,
						                scrollbarSize:0
						            "></table>
								<!-- PAGE CONTENT ENDS -->
								    <script type="text/javascript">
								    
								    $.extend($.fn.datagrid.defaults.editors, {
								    	datebox: {//datetimebox就是你要自定义editor的名称
								            init: function(container,options){
								                var input = $('<input class="easyuidatebox">').appendTo(container);
								                return input.datebox();
								            },
								            getValue: function(target){
								                return $(target).parent().find('input.combo-value').val();
								           },
								            setValue: function(target, value){
								                $(target).datebox("setValue",value);
								            }
								        }
								   });
									    var toolbar = [{
								            text:'选择图片',
								            iconCls:'icon-search',
								            handler:function(){
								            	$("#upload").trigger("click");
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
								            		if(rows[i].key == "assetName" && $.trim(rows[i].value) == ""){
								            			$.messager.alert("警告","设备名称不能为空");
								            			return false;
								            		}
								                	b += rows[i].key + ':' + rows[i].value + ',';
								            	}
								            	if("ext" == rows[i].flag){
								            		e += rows[i].key + ':' + rows[i].name + ':' + rows[i].value + ',';
								            	}
								            }
								            $.messager.progress({
								                title:'请等待',
								                msg:'加载中...'
								           });
								             
								            $("#b").val(b);
								            $("#e").val(e);
								            $("#ledgerForm").submit();
								            
								        	/*  $.ajax({
								    			url:"${pageContext.request.contextPath}/ledger/save",
								    			type:"post",
								    			data:"b="+b+"&e="+e+"&c="+$("#cate").val(),
								    			dataType:"json",
								    			cache:false,
								    			success:function(response){
								    				$.messager.progress('close');
								    				$.messager.alert("提示","新增成功");
								    				$('#pg').propertygrid('reload');
								    			},
								    			error:function(e){
								    				$.messager.progress('close');
								    				$.messager.alert("提示","新增失败，请稍后再试或联系管理员");
								    			}
								    		}); */
								        }
									    
									    $(function(){
									    	$('#pg').propertygrid({
									    		onBeginEdit:function(index,row){
									    			var opts = $('#pg').datagrid('getEditors', index); 
									    			if(index == 0 || index == 3){
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
	