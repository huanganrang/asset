<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jb.model.TjbMachineRoom" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="jb" uri="http://www.jb.cn/jbtag"%> 
<!DOCTYPE html>
<html>
<head>
<title>机房模拟部署</title>
<jsp:include page="../inc.jsp"></jsp:include>
<style type="text/css"> 
	
	.img { 
		/* z-index:-1; 
		filter: alpha(opacity = 85);/*设置透明度，针对 IE8 以及更早的版本。IE9, Firefox, Chrome, Opera 和 Safari 使用属性 opacity 来设定透明度。opacity 属性能够设置的值从 0.0 到 1.0。值越小，越透明。*/ 
		width:100%;  */
	} 
</style>		
</head>
<body>
<script type="text/javascript">
$(function() {
	parent.$.messager.progress('close');	
	//机房选择事件绑定
	$("#machineRoom").combobox({
		onSelect: function(obj){
			var value = obj.value;
			var path = value.split(",");
			$(".img-preview").attr("src","../"+path[1]).load(function() {
				
				var maxWidth = 1100;
				var maxHeight = 460;
				var realWidth = this.width;
				var realHeight = this.height;
				//如果真实的宽度大于浏览器的宽度就按照100%显示
				
				var _pw = maxWidth/realWidth;
				var _ph = maxHeight/realHeight;
				if(_pw>=_ph){
					$(".img-preview").css("height","100%").css("width","auto");
				}else{
					$(".img-preview").css("width","100%").css("height","auto");

				} 
		

				/* if(realWidth>=_w){
					$(img).css("width","100%").css("height","auto");
				}else{//如果小于浏览器的宽度按照原尺寸显示
					$(img).css("width",realWidth+'px').css("height",realHeight+'px');
				} */
			});
		}	
	});	
});


</script>

	<div class="easyui-layout" data-options="fit : true,border : false">
		<div data-options="region:'north',border:false" style="height: 40px; overflow: hidden;">
			<form id="searchForm">
				<table class="table table-hover table-condensed">
					<tr>	
						<td>机房：<jb:selectSql dataType="SL02" name="machineRoom"></jb:selectSql></td>											
					</tr>							
				</table>
				
			</form>
		</div>
		<div data-options="region:'center',border:true">
			<div style="width:1100px;height:460px;overflow:auto;">
				<img class="img-preview img" src=""> 	
			</div>		
		</div>
	</div>
</body>
</html>