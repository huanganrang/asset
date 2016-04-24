<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/assets/common.jsp"%>
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
</style>
<input type="hidden" id="columns" value="${columns}"/>
								<!-- 
								<div id="nav-search" style="margin-left:300px;">
										<span class="input-icon">
											<input type="text" style="width: 400px" id="key" name="key" class="nav-search-input" value="${key}" placeholder="" />
											<i class="icon-search nav-search-icon"></i>
										</span>
										<input type="button" id="to-search" value="搜索"/>
								</div> -->
								<div id="nav-search" style="top: 80px; left: 6%; width: 100%;" >
										<input type="text" style="height: 50px;width: 75%; background: #fff url(${pageContext.request.contextPath}/images/Search-2.png) no-repeat; padding-left: 50px;" id="key" name="key" value="${key}" class="nav-search-input" />
										<input type="button" id="to-search" style=" width: 5%; height: 50px;border: none; border-radius: 2px;background: #b47e43;" value="搜索"/>
										<input type="button" id="to-high" style="width: 5%; height: 50px;border: none; border-radius: 2px;background: #b47e43;" value="高级"/>
										<p style="display: inline-block; width: 5%;"><img src="${pageContext.request.contextPath}/images/Graphic-lists-the-Convert-button.png"/></p>
								</div>

								<div class="hr hr32 hr-dotted"></div>
								 <div class="textbox2">
								 		<dl class="listmax" >
								        <dt style="background: #edf2f5;"><input type="checkbox" class="selectAll"/>默认属性</dt>
								         <c:forEach items="${baseAttrMap}" var="baseAttr" >
						            		<dd><input type="checkbox" name="default" value="${baseAttr.key}"/>${baseAttr.value }</dd>
						            	</c:forEach>
								       </dl>
								       
								 		<c:forEach items="${attrMap}" var="mymap" >
								 		<dl class="listmax" >
								 		<dt style="background: #edf2f5;"><input type="checkbox" class="selectAll"/>${mymap.key}</dt>
						            	 <c:forEach items="${mymap.value}" var="attr" >
						            	 	<dd><input type="checkbox" name="${mymap.key}" value="${attr.attrId}"/>${attr.attrName}</dd>
						            	</c:forEach>
						            	</dl>
								        </c:forEach>
								    </div>
								
		<!-- PAGE CONTENT ENDS -->
		<script type="text/javascript">
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
        		location.href="${pageContext.request.contextPath}/asset/tosearch?key="+$("#key").val()+"&baseids="+baseids+"&attrids="+attrids;
        	});
        });
    </script>