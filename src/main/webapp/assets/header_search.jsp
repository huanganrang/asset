<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/assets/common.jsp"%>
    <script src="${pageContext.request.contextPath}/jslib/search.js"></script>
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
 .tablist>li:nth-child(4){margin-left:60%; margin-right:1%; }
 ul, ol {
		list-style: none;
		margin:0;
	}
	a{
		text-decoration: none;
	}
</style>

<div class="page-content" style="height:100%;">
<div class="row">
	<div class="col-xs-12">
<input type="hidden" id="columns" value="${columns}"/>
<input type="hidden" id="hcolumns" value="${hcolumns}"/>
<input type="hidden" id="key" name="key" value="${key}"/>
<div style="margin:10 0 10 0;">
	<ul class="tablist">
       	<li><a id="btn_prev" href="#"> < </a> </li>
        <li><a id="pageindex">0/0</a></li>
        <li><a id="btn_next" href="#">></a></li>
        <li><a href="#" onClick="Export('asset', $('#dg'))">导出</a></li>
        <li><a href="#" onClick="CreateFormPage('打印',$('#dg'));">打印</a></li>
    </ul>
 </div>
<div id="tableDiv" style="height:600px;margin-top:10px">
<table id="dg" style="width:800px;height:600px"></table>
</div>
</div>
</div>
<script type="text/javascript">
//JavaScript Document
$(document).ready(function(){
	$(function(){
	//全局变量
	var pagenumber = 1;
	var totalpage  = 1;
	var key=$("#key").val();
	var columns = $("#columns").val();
	$('#dg').datagrid({
		url:rootpath+'/asset/search?key='+key,
		columns:eval($("#columns").val()),
	    method: 'get',
	    fitColumns: false,
	    fit:true,
	    rownumbers:true,
	    //toolbar:toolbar,
	    scrollbarSize:18,
	    singleSelect: true,
	    pagination:true,
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
	



//	 $("#to-high").click(function(){
//				location.href="${pageContext.request.contextPath}/asset/tohigh?key="+$("#key").val();
//		});
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
});
</script>
