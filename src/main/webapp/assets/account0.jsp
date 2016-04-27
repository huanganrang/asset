<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/assets/common.jsp"%>
								 <input type="hidden" id="company" value='${company}'/>
								 <input id="file_upload" name="file_upload" type="file" />
								 <input id="exportBtn"  value="导出" type="button"  />
								 <form id="downloadTable" target="downloadIframe" method="post" style="display: none;">
								  <input id="fileName" name="fileName"  value="" type="hidden"  />
								</form>
								<iframe id="downloadIframe" name="downloadIframe" style="display: none;"></iframe>
									<script src="${pageContext.request.contextPath}/assets/js/jquery.uploadify-3.1.min.js"></script>
								    <script type="text/javascript">
								    $(function(){
									        	var rootpath = $("#rootpath").val();
									        	$("#file_upload").uploadify({
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
					