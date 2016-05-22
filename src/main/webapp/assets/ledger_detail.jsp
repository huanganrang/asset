<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/assets/common.jsp"%>

<style type="text/css">
	.datagrid .datagrid-pager  {
			display: none;
	}
	.datagrid-pager {
			display: none;
	}
 	 .tablist{width:100%; height:30px;}
	 .tablist>li{padding:0 1%; height:30px;line-height:30px;vertical-align: middle;float:left; background:#FFF; border-radius:2px; position:relative;}
	 .tablist>li:nth-child(1) {background: #FFF;}
	 .tablist>li:nth-child(2){margin-left:1%; line-height:30px; background:#fff; padding:0 2%;}
	 .tablist>li:nth-child(3) {margin-left:1%; background: #FFF;}
	 .tablist a{font-size: 13px;color:#666;text-decoration: none;}
	 .tablist>li:nth-child(5){margin-left:40%; margin-right:1%; padding-left:1%;}
	 
	 #tag_a{
	     width:40px;
	     margin-left:10px;
	     background: url("../assets/images/tag.png") #ffffff center center no-repeat;
	     cursor: pointer;
	 }
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
.textbox2{display:none;width:98%; background:#dad7d7; overflow-y: scroll; height:90%; box-shadow:0 1px 2px #666; position:fixed; top:90px;
left:1%;}
.textbox2 dl{width:98%; background:#ededed; margin:10px auto; font-size:0;  background:#fff;
position:relative;}
.textbox2 dl dt,dd{width:20%; display:inline-block; font:15px/20px "黑体"; color:#999;}
.textbox2 dl dt{background:#edf2f5;}
.textbox2 dl dt input{}
.textbox2 dl input{margin:0 6%;border:1px solid #999; -webkit-border-radius:50%; width:10px; height:10px;}
.textbox2 dl dt input{ height:10px; width:10px;}
.textbox2 dl dd:last-child{width:20px; height:20px; background:url(${pageContext.request.contextPath}/images/1-3.png) no-repeat; 
position:absolute; top:5px; right:5px;}
.textbox2 p{width:100%; height:10%; background:#79c8ff url(${pageContext.request.contextPath}/images/key.png)3% 50% no-repeat; padding-left:8%;
font:16px/50px "黑体"; color:#fff; vertical-align:top;}
.textbox2 p .clos{width:20px; height:20px; background:url(${pageContext.request.contextPath}/images/close1.png) no-repeat; display:inline-block;margin-left: 93%;}
.high-submit {width: 100%;  margin: 0 0 1% 0; position: relative; }
.high-submit input {width: 10%; height: 10%;text-align: center;letter-spacing: 0.5em;background: #f5f5f5;
font: 16px/30px "黑体"; color: #333; border-radius: 5px; margin-left: 27%;}
</style>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.uploadify-3.1.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/js/uploadify.css" />
	
				<div class="page-content" style="height:100%;">
						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								  <div id="tabs">
								  <div class="tab current" data="/ledger/detail">台账明细</div>
								  <div class="separator"></div>
								  <div class="tab" data="/stock/tostock">库存</div>
								  <div class="separator"></div>
								  <div class="tab" data="/account/toaccount">对账</div>
								  <div class="separator"></div>
								  <div class="tab" data="/scrap/toscrap">报废表</div>
								  <div class="separator"></div>
								  <div class="tab" data="/allocation/toallocation">调拨</div>
								  </div>
								  <input type="hidden" id="columns" value="${columns}"/>
								  <input type="hidden" id="hcolumns" value="${hcolumns}"/>
								  <div style="margin:20 0 10 0;">
										<ul class="tablist">
								        	<li><a id="btn_prev" href="#"> < </a> </li>
								            <li><a id="pageindex">0/0</a></li>
								            <li><a id="btn_next" href="#">></a></li>
								            <li id="tag_a"></li>
								            <li><a id="to-high">高级</a></li>
								            <li><a href="${pageContext.request.contextPath}/ledger/toAdd">新增</a></li>
								            <li><a href="javascript:void(0)" onclick="$('#dlg').dialog('open');">导入</a></li>
								            <li><a href="#" onClick="Export('asset', $('#dg'))">导出</a></li>
								            <li><a href="javascript:void(0)" onclick="print()">打印二维码</a>
								            	<!--<ul class="tablistmin">
								                	<li>全部</li>
								                    <li>当前</li>
								                    <li>变更</li>
								                </ul>-->
								            </li>
								            <li><a href="#" onClick="CreateFormPage('打印',$('#dg'));">打印</a></li>
								            
								        </ul>
								  </div>
								  <div style="height:600px">
								  <table id="dg" style="width:800px;height:600px">
								  </table>
								  </div>
								  <div class="textbox2">
							 		<p>高级<a class="clos"></a></p>
							 		<dl id="base" class="base">
							        <dt style="background: #edf2f5;"><input type="checkbox" class="selectAll" />默认属性</dt>
							        	<c:forEach items="${baseAttrMap}" var="baseAttr" varStatus="status">
							         	<c:if test="${status.index>0&&status.index%4==0}">
											<dd style="display:none"></dd>
																</c:if>
							          		<dd <c:if test="${status.index>3}">style="display: none" </c:if> >
							          		<input type="checkbox" name="default" value="${baseAttr.key}"/>${baseAttr.value }</dd>
							         	</c:forEach>
							         	<dd onClick="showNav(0)"></dd>
							        </dl>
							      
									<c:forEach items="${attrMap}" var="mymap" varStatus="status0">
									<dl class="ext" >
										<dt style="background: #edf2f5;"><input type="checkbox" class="selectAll"/>${mymap.key}</dt>
								          	<c:forEach items="${mymap.value}" var="attr" varStatus="status">
								          	    <c:if test="${status.index>0&&status.index%4==0}">
																<dd style="display:none"></dd>
																	</c:if>
								          	 	<dd <c:if test="${status.index>3}">style="display: none" </c:if> >
								          	 		<input type="checkbox" name="${mymap.key}"  value="${attr.attrId}"/>${attr.attrName}</dd>
								          	</c:forEach>
								         	    <dd onClick="showNav(${status0.index+1})"></dd>
							         	</dl>
							       </c:forEach>
							       <div class="high-submit">
										<input id="btn_hconfirm" type="button" value="确定" /> <input id="btn_hcancel" type="button" value="取消" />
							        </div>
							   </div>
								  <div id="dlg" class="easyui-dialog" title="导入台账" style="width:400px;height:200px;padding:10px"
						            data-options="
						                iconCls: 'icon-save',
						                buttons: [{
						                    text:'取消',
						                    handler:function(){
						                       $('#dlg').dialog('close')
						                    }
						                }]
						            ">
						            <input id="file_import" name="file_import" type="file" value="导入"/>
								  </div>
								  </div>
								  </div>
								    <%-- <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/datagrid-filter.js"></script> --%>
								    <script type="text/javascript">
								        $(function(){
								        	//全局变量
											var pagenumber = 1;
											var totalpage  = 1;
											
								        	$('#dlg').dialog('close');
								        	var rootpath = $("#rootpath").val();
								        	
								        	
								        	$("#tag_a").click(function(){
								        		//为loadGrid()添加参数  
								        	    var queryParams = $('#dg').datagrid('options').queryParams;  
								        	    queryParams.checkNumber = "1";  
								        	     //查询后返回首页
								        	    $('#dg').datagrid('options').pageNumber = 1;  
								        	    var p = $('#dg').datagrid('getPager');
								        		p.pagination({pageNumber: 1}); 
								        	    //重新加载datagrid的数据  
								        	    $("#dg").datagrid('reload');  
								        	});
								        	//next page button
								            $('#btn_next').bind('click', function(){

												if(pagenumber < totalpage)
												{
													pager.pagination('select', ++pagenumber);
													
												}
												   
											});
									   		//previous page button
											$('#btn_prev').bind('click', function(){
													
												if(pagenumber >1)
												{
													 pager.pagination('select', --pagenumber);
													 
												}
												   
											});
									   		
											$("#to-high").click(function(){
												//$(this).css({"background":"#b47e43","width":"5%"});
												$(".textbox2").show();
												
												
											});
											//弹出框关闭
											$(".textbox2 .clos").click(function(){
												$(".textbox2").hide();
										    });
											
											$("#btn_hcancel").click(function(){
												$(".textbox2").hide();
										    });
											
											$(".textbox2").find("input").not(".selectAll").each(function(){
												var hcolumns = $("#hcolumns").val();
										    	var columnsArray = hcolumns.split(",");
												var i = columnsArray.length;
											    while (i--) {
											       if (columnsArray[i] === $(this).val()) {
											    	   $(this).prop("checked",true);
											    	   break;
											       }
											    }
											});
											
											$(".selectAll").click(function(){
												if($(this).is(":checked")){
//													 $("input:checkbox").not($(this)).attr("checked","checked");
													$(this).parent().parent().find("dd input").each(function(){
										    			$(this).prop("checked",true);
										    		});
												}else{
										    		$(this).parent().parent().find("dd input").each(function(){
										    			$(this).prop("checked",false);
										    		});
												}
												
											});

											 $("#to-search").click(function(){
													if($("#to-search").val() != ""){
														location.href="${pageContext.request.contextPath}/asset/tosearch?key="+$("#key").val();
													}
												});
//											 $("#to-high").click(function(){
//														location.href="${pageContext.request.contextPath}/asset/tohigh?key="+$("#key").val();
//												});
											$("#btn_hconfirm").click(function(){
												$(".textbox2").hide();
												var baseids = "";
												$(".base").find("input:checked").not(".selectAll").each(function(){
													baseids = baseids+$(this).val()+",";
												});
												if(baseids.length > 1){
													baseids = baseids.substring(0,baseids.length-1);
												}
												
												var attrids = "";
												$(".ext").find("input:checked").not(".selectAll").each(function(){
													attrids = attrids+$(this).val()+",";
												});
												if(attrids.length > 1){
													attrids = attrids.substring(0,attrids.length-1);
												}
												location.href = rootpath + "/ledger/detail?key="+$("#key").val() + "&baseids="+baseids+"&attrids="+attrids;
												//location.href=rootpath+"/ledger/detail?baseids="+baseids+"&attrids="+attrids;
											});

								            var dg = $('#dg').datagrid({
								            	url:rootpath+'/ledger/data?sort=assetAddTime&order=desc',
								                pagination: true,
								                columns:eval($("#columns").val()),
								                fitColumns: false,
								                fit:true,
								                singleSelect:true,
								                rownumbers: true,
												onLoadSuccess:function(data)
												{
													var total = pager.pagination('options')['total'];
													var pagesize = pager.pagination('options')['pageSize'];
													totalpage = Math.ceil(total/pagesize);
													$('#pageindex').text(pagenumber+'/'+totalpage);
												},
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
											//注意先后顺序
										var pager = $('#dg').datagrid().datagrid('getPager');	// get the pager of datagrid
								        /* 	dg.datagrid('enableFilter'); */
								        
								            $("#file_import").uploadify({
										        // 指定swf文件
										        'swf': rootpath+'/assets/js/uploadify/uploadify.swf',
										        'fileObjName':'file',
										        // 后台处理的页面
										         'uploader':rootpath+'/ledger/import',
										        // 按钮显示的文字
										        'buttonText': '导入',
										        'formData':{type:-1},
										        // 允许上传的文件后缀
										        'fileTypeExts': '*.xls;*.xlsx',
										        'auto': true,
										        // 设置为true将允许多文件上传
										        'multi': false,
										        onUploadSuccess :function(event, response, status){
										        	var data = jQuery.parseJSON(response);
										        	if(data.success){
										        		$.messager.alert("提示","导入成功");
										        		$('#dlg').dialog('close');
										        		$('#dg').datagrid('reload');
										        	}else{
										        		$('#dlg').dialog('close');
										        		$.messager.alert("错误",data.msg);
										        	}
										        }
										    });
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
								        };
								        
								        function showNav(o){
								        	if($("dl:eq(" + o + ") dd:last-child").css('background-image').indexOf('1-3.png')>-1)
								        	{
								        		$("dl:eq(" + o + ") dd:gt(3)").css("display", "inline-block");
								        		$("dl:eq(" + o + ") dd:last-child").css("background","url(../images/1-4.png) no-repeat");
								        	}else
								        	{
								        		$("dl:eq(" + o + ") dd:gt(3)").css("display", "none");
								        		$("dl:eq(" + o + ") dd:last-child").css("display", "inline-block");
								        		$("dl:eq(" + o + ") dd:last-child").css("background","url(../images/1-3.png) no-repeat");
								        		//$("dl dd:last-child").css("background","background:url(images/1-3.png) no-repeat");
								        	}
								        }
								        
								        function print(){
								        	var row = $('#dg').datagrid('getSelected');
								        	if (row){ 
								        		PrintBarCode(row);
								        	}
								        }
								        
								    </script>
								<!-- PAGE CONTENT ENDS -->