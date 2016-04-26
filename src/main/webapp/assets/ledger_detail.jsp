<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/assets/common.jsp"%>
<style type="text/css">
	.datagrid .datagrid-pager  {
			display: none;
	}
	.datagrid-toolbar {
			display: none;
	}
	.datagrid-pager {
			display: none;
	}
	.panel-header
	{
	 display: none;
	}
	.datagrid-header
	{
		height:80px;
	}
 	 .tablist{width:100%; height:50px; }
	 .tablist>li{padding:0 1%; height:80%; float:left; background:#FFF; border-radius:2px; margin-top:0.4%; position:relative;}

	 .tablist>li:nth-child(1), .tablist li:nth-child(3){width:2%;}
	 .tablist a{font:16px/40px "黑体"; color:#666;text-decoration: none;}
	 .tablist>li:nth-child(1){margin-left:1%;}
	 .tablist>li:nth-child(2), .tablist li:nth-child(3){margin-left:0.5%;}
	 .tablist>li:nth-child(4){margin-left:50%; margin-right:1%; padding-left:30px;}
 	ul, ol {
		list-style: none;
	}
	a{
		text-decoration: none;
	}
	 
		
</style>
				<div class="page-content">
						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div class="hr32"></div>
								  <input type="hidden" id="columns" value="${columns}"/>
								  <div style="margin:20px 0;">
										<ul class="tablist">
								        	<li><a id="btn_prev" href="#" ><</a> </li>
								            <li><a id="pageindex">1/7</a></li>
								            <li><a id="btn_next" href="#">> </a></li>
								            <li><a href="${pageContext.request.contextPath}/ledger/toHigh">高级</a></li>
								            <li><a href="${pageContext.request.contextPath}/ledger/toAdd">新增</a></li>
								            <li><a href="#">导入</a></li>
								            <li><a href="#" onClick="Export('asset', $('#dg'))">导出</a></li>
								            <li><a href="#">标签</a>
								            	<!--<ul class="tablistmin">
								                	<li>全部</li>
								                    <li>当前</li>
								                    <li>变更</li>
								                </ul>-->
								            </li>
								            <li><a href="#" onClick="CreateFormPage('打印',$('#dg'));">打印</a></li>
								            
								        </ul>
								  </div>
								  <div style="height:420px">
								  <table id="dg" style="width:700px;height:420px">
								  </table>
								  </div>
								  </div>
								  </div>
								  </div>
								    <%-- <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/datagrid-filter.js"></script> --%>
								    <script type="text/javascript">
									    var toolbar = [{
								            text:'高级',
								            handler:function(){
								            	location.href="${pageContext.request.contextPath}/ledger/toHigh";
								            }
								        },'-',{
								            text:'新增',
								            handler:function(){
								            	location.href="${pageContext.request.contextPath}/ledger/toAdd";
								            }
								        },'-',{
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
								        	var rootpath = $("#rootpath").val();
								            var dg = $('#dg').datagrid({
								            	url:rootpath+'/ledger/data',
								                pagination: true,
								                remoteFilter: true,
								                columns:eval($("#columns").val()),
								                fitColumns: false,
								                fit:true,
								                rownumbers: true,
								                toolbar:toolbar,
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
								        /* 	dg.datagrid('enableFilter'); */
								        });
								        var cmenu;
								        function createColumnMenu(currfield){
								            cmenu = $('<div id="cmenu" style="position:absolute; height:400px; overflow:auto"/>').appendTo('body');
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
								<!-- PAGE CONTENT ENDS -->