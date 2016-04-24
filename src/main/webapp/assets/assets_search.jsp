<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/assets/common.jsp"%>
    							<input type="hidden" id="columns" value="${columns}"/>
								<div id="nav-search" style="top: 80px; left: 6%; width: 100%;" >
										<input type="text" style="height: 50px;width: 75%; background: #fff url(${pageContext.request.contextPath}/images/Search-2.png) no-repeat; padding-left: 50px;" id="key" name="key" value="${key}" class="nav-search-input" />
										<input type="button" id="to-search" style=" width: 5%; height: 50px;border: none; border-radius: 2px;background: #b47e43;" value="搜索"/>
										<input type="button" id="to-high" style="width: 5%; height: 50px;border: none; border-radius: 2px;background: #b47e43;" value="高级"/>
										<p style="display: inline-block; width: 5%;"><img src="${pageContext.request.contextPath}/images/Graphic-lists-the-Convert-button.png"/></p>
								</div>
								<div id="tableDiv" style="height:420px;margin-top:30px">
								<table id="dg" style="width:700px;height:420px"></table>
								</div>
		<script type="text/javascript">
		 var toolbar = [{
	            text:'导出',
	            handler:function(){
	            	Export('asset', $('#dg'));
	            }
	        },'-',{
	            text:'打印',
	            handler:function(){
	            	 CreateFormPage("打印",$("#dg")); 
	            }
	        }];
        $(function(){
        	var key=$("#key").val();
        	var columns = $("#columns").val();
            $('#dg').datagrid({
            	url:rootpath+'/asset/search?key='+key,
            	columns:eval($("#columns").val()),
                method: 'get',
                fitColumns: false,
                fit:true,
                rownumbers:true,
                toolbar:toolbar,
                scrollbarSize:18,
                singleSelect: true,
                pagination:true,
                onDblClickRow: function(index,row){
                	location.href=rootpath+"/ledger/property/"+row.assetId;
                },
                onHeaderContextMenu: function(e, currfield){
                    e.preventDefault();
                    if (!cmenu){
                        createColumnMenu(currfield);
                    }else{
                    	/*将当前元素除外，所有置空*/
                    	$("#cmenu").find(".menu-item").each(function(){
                    		  var title = $(this).find(".menu-text").text();
                    		  var col = $('#dg').datagrid('getColumnOption', currfield);
                    		  if(title ==col.title){
	                          	  cmenu.menu('setIcon', {
	                          		 target: $(this)[0],
	                                 iconCls: 'icon-ok'
	                              });
                              }else{
                            	  cmenu.menu('setIcon', {
 	                          		 target: $(this)[0],
 	                                 iconCls: 'icon-empty'
 	                              });
                              }
                    		
                    	});
                    }
                    
                    cmenu.menu('show', {
                        left:e.pageX,
                        top:e.pageY
                    });
                }
            });
        	
        	 $("#to-search").click(function(){
 				if($("#to-search").val() != ""){
 					location.href="${pageContext.request.contextPath}/asset/tosearch?key="+$("#key").val();
 				}
 			});
        	 $("#to-high").click(function(){
  					location.href="${pageContext.request.contextPath}/asset/tohigh?key="+$("#key").val();
  			});
        });
        var cmenu;
        function createColumnMenu(currfield){
            cmenu = $('<div id="cmenu" style="position:absolute; height:350px;overflow:auto"/>').appendTo('body');
            cmenu.menu({
                onClick: function(item){
                	/*将所有选中的元素置空，隐藏*/
                	$("#cmenu").find(".menu-item").each(function(){
                		var itemEl = $(this)[0];  // the menu item element
                		var itemOther = $('#cmenu').menu('getItem', itemEl);
                		if (itemOther.iconCls == 'icon-ok' && item.name != itemOther.name){
                            $('#dg').datagrid('hideColumn', itemOther.name);
                            cmenu.menu('setIcon', {
                                target: itemEl,
                                iconCls: 'icon-empty'
                            });
                        }
                	});
                	
                	 if (item.iconCls == 'icon-ok'){
                         $('#dg').datagrid('hideColumn', item.name);
                         cmenu.menu('setIcon', {
                             target: item.target,
                             iconCls: 'icon-empty'
                         });
                     } else {
                         $('#dg').datagrid('showColumn', item.name);
                         cmenu.menu('setIcon', {
                             target: item.target,
                             iconCls: 'icon-ok'
                         });
                     }
                }
            });
            var fields = $('#dg').datagrid('getColumnFields');
            for(var i=0; i<fields.length; i++){
                var field = fields[i];
                var col = $('#dg').datagrid('getColumnOption', field);
                if(currfield == field){
                 	cmenu.menu('appendItem', {
                        text: col.title,
                        name: field,
                        iconCls: 'icon-ok'
                    });
                }else{
                 	cmenu.menu('appendItem', {
                        text: col.title,
                        name: field,
                        iconCls: 'icon-empty'
                    });
                }
              
            }
        }
    </script>