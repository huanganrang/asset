<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/assets/common.jsp"%>
				<div class="page-content">
						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div class="hr32"></div>
								  <input type="hidden" id="columns" value="${columns}"/>
								  <table id="dg"  style="width:700px;height:450px">
								  </table>
								  </div>
								  </div>
								  </div>
								    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/datagrid-filter.js"></script>
								    <script type="text/javascript">
									    var toolbar = [{
								            text:'高级',
								            iconCls:'icon-pencil',
								            handler:function(){
								            	location.href="${pageContext.request.contextPath}/ledger/toHigh";
								            }
								        },{
								            text:'新增',
								            iconCls:'icon-pencil',
								            handler:function(){
								            	location.href="${pageContext.request.contextPath}/ledger/toAdd";
								            }
								        },'-',{
								            text:'导出',
								            iconCls:'icon-pencil',
								            handler:function(){alert('save')}
								        }];
								        $(function(){
								        	var rootpath = $("#rootpath").val();
								            var dg = $('#dg').datagrid({
								            	url:rootpath+'/ledger/data',
								                pagination: true,
								                remoteFilter: true,
								                columns:eval($("#columns").val()),
								                fitColumns: true,
								                rownumbers: true,
								                toolbar:toolbar,
								                onDblClickRow: function(index,row){
								                	location.href=rootpath+"/ledger/property/"+row.assetId;
								                },
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
								        	dg.datagrid('enableFilter');
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
								<!-- PAGE CONTENT ENDS -->