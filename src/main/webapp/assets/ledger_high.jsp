<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style type="text/css">
.textbox2{width:95%; background:#dad7d7; overflow-y: scroll; height:80%; box-shadow:0 1px 2px #666; position:fixed; top:90px;
left:5%;}
.textbox2 dl{width:98%; background:#ededed; margin:10px auto; font-size:0;  background:#fff;
position:relative;}
.textbox2 dl dt,dd{width:20%; display:inline-block; font:15px/20px "黑体"; color:#999;}
.textbox2 dl dt{background:#edf2f5;}
.textbox2 dl dt input{}
.textbox2 dl input{margin:0 6%;border:1px solid #999; -webkit-border-radius:50%; width:10px; height:10px;}
.textbox2 dl dt input{ height:10px; width:10px;}
.textbox2 dl dd:last-child{width:20px; height:20px; background:url(${pageContext.request.contextPath}/images/1-3.png) no-repeat; 
position:absolute; top:5px; right:5px;}
</style>
    <%@include file="/assets/common.jsp"%>
		<input type="hidden" id="key" value="${key}"/>
		<input type="hidden" id="columns" value="${columns}"/>

								<div id="nav-search" style="margin-left:300px;">
										<input type="button" id="to-search" value="确定"/>
								</div>

								<div class="hr hr32 hr-dotted"></div>
								 <div class="textbox2">
								 		<dl  id="base" class="base" >
								        <dt style="background: #edf2f5;"><input type="checkbox" class="selectAll"/>默认属性</dt>
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
								 		<dl  class="ext" >
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
								    </div>
								<!-- PAGE CONTENT ENDS -->
		<script type="text/javascript">
		function showNav(o){
			if($("dl:eq(" + o + ") dd:last-child").css('background-image').indexOf('1-3.png')>-1)
			{
				$("dl:eq(" + o + ") dd:gt(3)").css("display", "inline-block");
				$("dl:eq(" + o + ") dd:last-child").css("background","url(${pageContext.request.contextPath}/images/1-4.png) no-repeat");
			}else
			{
				$("dl:eq(" + o + ") dd:gt(3)").css("display", "none");
				$("dl:eq(" + o + ") dd:last-child").css("display", "inline-block");
				$("dl:eq(" + o + ") dd:last-child").css("background","url(${pageContext.request.contextPath}/images/1-3.png) no-repeat");
				//$("dl dd:last-child").css("background","background:url(images/1-3.png) no-repeat");
			}
		 //var obj=document.getElementById("div"+o);
		}
        $(function(){
        	
        	var columns = $("#columns").val();
        	var columnsArray = columns.split(",");
        	$(".easyui-accordion").find("input").not(".selectAll").each(function(){
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
        			$(this).siblings("input").each(function(){
	        			$(this).prop("checked",true);
	        		});
        		}else{
	        		$(this).siblings("input").each(function(){
	        			$(this).prop("checked",false);
	        		});
        		}
        		
        	});
        	
        	$("#to-search").click(function(){
        		var baseids = "";
        		$(".base").find("input:checked").not(".selectAll").each(function(){
        			baseids = baseids+$(this).val()+","
        		});
        		if(baseids.length > 1){
        			baseids = baseids.substring(0,baseids.length-1);
        		}
        		
        		var attrids = "";
        		$(".ext").find("input:checked").not(".selectAll").each(function(){
        			attrids = attrids+$(this).val()+","
        		});
        		if(attrids.length > 1){
        			attrids = attrids.substring(0,attrids.length-1);
        		}
        		location.href=rootpath+"/ledger/detail?baseids="+baseids+"&attrids="+attrids;
        	});
        	
        });
    </script>
