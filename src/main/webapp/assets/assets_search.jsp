<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/assets/common.jsp"%>
    							<input type="hidden" id="columns" value="${columns}"/>
								<div id="nav-search" style="margin-left:300px" >
										<span class="input-icon">
											<input type="text" style="width: 400px" id="key" name="key" class="nav-search-input" value="${key}" />
											<i class="icon-search nav-search-icon"></i>
										</span>
										<input type="button" id="to-search" value="搜索"/>
										<input type="button" id="to-high" value="高级"/>
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
                onHeaderContextMenu: function(e, field){
                    e.preventDefault();
                    if (!cmenu){
                        createColumnMenu();
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
        function createColumnMenu(){
            cmenu = $('<div style="position:absolute; height:400px; overflow:auto"/>').appendTo('body');
            cmenu.menu({
                onClick: function(item){
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
                cmenu.menu('appendItem', {
                    text: col.title,
                    name: field,
                    iconCls: 'icon-ok'
                });
            }
        }
    </script>