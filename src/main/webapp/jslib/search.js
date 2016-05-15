// JavaScript Document
$(document).ready(function(){
	
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
	
//	$("#btn_hconfirm").click(function(){
//		$(".textbox2").hide();
//    });
	
	
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
//			 $("input:checkbox").not($(this)).attr("checked","checked");
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
//	 $("#to-high").click(function(){
//				location.href="${pageContext.request.contextPath}/asset/tohigh?key="+$("#key").val();
//		});
	});
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
		location.href = rootpath + "/asset/tosearch?key="+$("#key").val() + "&baseids="+baseids+"&attrids="+attrids;
		//location.href=rootpath+"/ledger/detail?baseids="+baseids+"&attrids="+attrids;
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


