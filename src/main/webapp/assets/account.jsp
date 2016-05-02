<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/assets/common.jsp"%>
<style type="text/css">

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
.page2{width:50%; height:60%; background:#FFF; position:absolute; left:25%; top:30%; border:1px solid rgba(0,0,0,0.2);}
.page2 aside{width:100%; height:50px; background:#e6e6e6;}
.page2 aside>a{width:12%; font:14px/50px "黑体"; color:#666; text-align:center; display:inline-block;}
.page2 aside>a:nth-child(1){background:#FFF;}
.page2 .billpage{width:70%; height:52%; border:1px solid #ccc; position:absolute; top:30%; left:15%; border-radius:5px;}
.page2 .billpage>ul{position:absolute; top:30%; left:5%;}
.page2 .billpage>ul li{display:inline-block; font:14px/20px "黑体"; color:#666;}
.page2 .billpage>ul li:nth-child(2) input{height:30px; border-radius:5px; background:#e9e9e9;}
.page2 .billpage>ul li:nth-child(3) input{height:30px; background:#50c14e; width:60px; border-radius:5px; color:#fff;}
.page2 .billpage>ul li:nth-child(4) input{height:30px; background:#b47e43; width:60px; border-radius:5px; position:absolute;
left:50%; bottom:-100%; color:#fff;}
.uploadify-queue{ display: none;}
.uploadify-button-text{  height: 30px;  background: #50c14e; width: 60px;
    border-radius: 5px; color: #fff;  padding-left: 15px;
    padding-top: 8px;padding-right: 15px;padding-bottom: 8px;}
#file_import {height: 30px; width: 60px;} 
</style>
<div class="page-content">
<div class="row">
	<div class="col-xs-12">
	    <!-- PAGE CONTENT BEGINS -->
		<div id="tabs">
		  <div class="tab current" data="/ledger/detail">台账管理</div>
		  <div class="separator"></div>
		  <div class="tab" data="/stock/tostock">库存</div>
		  <div class="separator"></div>
		  <div class="tab" data="/account/toaccount">对账</div>
		  <div class="separator"></div>
		  <div class="tab" data="/scrap/toscrap">报废表</div>
		</div>
 <input type="hidden" id="company" value='${company}'/>
 <div style="height:420px">
 <div class="page2">
 	<aside><a>账单</a><a>账物</a></aside>
    <div class="billpage">
    	<ul>
        	<li>财务台账</li>
            <li>
            	  <form id="downloadTable" target="downloadIframe" method="post">
				    <input id="fileName" name="fileName"  value=""  />
				  </form>
			</li>
            <li><input id="file_import" name="file_import" type="file"  value="导入"/></li>
            <li><input type="button" id="exportBtn"  value="导出"  value="对账"/></li>
        </ul>
    </div>
    </div> 
 </div>  
 </div>
</div>
  <form id="downloadTable" target="downloadIframe" method="post" style="display: none;">
    <input id="fileName" name="fileName"  value="" type="hidden"  />
  </form> 
  <iframe id="downloadIframe" name="downloadIframe" style="display: none;"></iframe>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.uploadify-3.1.min.js"></script>
    <script type="text/javascript">
    $(function(){
	        	var rootpath = $("#rootpath").val();
	        	$("#file_import").uploadify({
			        // 指定swf文件
			        'swf': rootpath+'/assets/js/uploadify/uploadify.swf',
			        'fileObjName':'file',
			        // 后台处理的页面
			         'uploader':rootpath+'/account/upload',
			        // 按钮显示的文字
			        'buttonText': '导入',
			        'formData':{type:-1},
			        // 允许上传的文件后缀
			        'fileTypeExts': '*.xls;*.xlsx',
			        'auto': true,
			        // 设置为true将允许多文件上传
			        'multi': false,
			        'onProgress':false,
			        'width':'60px',
			        onUploadSuccess :function(event, response, status){
			        	var data = jQuery.parseJSON(response);
			        	if(data.msg){
			        		$("#exportBtn").removeAttr("disabled");
			        		$("#fileName").val(data.msg);
			        	}
			        }
			    });
	        	
	        	$("#exportBtn").attr('disabled',"true");
	        	$("#exportBtn").click(downloadTable);
    });
    function downloadTable(){
	    $('#downloadTable').form('submit', {
	        url:'${pageContext.request.contextPath}/account/download',
        }); 
	}
    </script>

