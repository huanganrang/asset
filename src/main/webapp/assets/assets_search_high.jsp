<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/assets/common.jsp"%>
<input type="hidden" id="columns" value="${columns}"/>
								<div id="nav-search" style="margin-left:300px;">
										<span class="input-icon">
											<input type="text" style="width: 400px" id="key" name="key" class="nav-search-input" value="${key}" placeholder="" />
											<i class="icon-search nav-search-icon"></i>
										</span>
										<input type="button" id="to-search" value="搜索"/>
								</div>

								<div class="hr hr32 hr-dotted"></div>
								
								 <div class="easyui-accordion" style="width:700px;height:auto;">
								 		<div title="默认属性" style="padding:10px;border:none" id="base" class="base">
								        		 <input type="checkbox" class="selectAll"/>全选<br/>
								            	 <c:forEach items="${baseAttrMap}" var="baseAttr" >
								            		<input type="checkbox" name="default" value="${baseAttr.key}" />${baseAttr.value }
								            	</c:forEach>
								        </div>
								 		 <c:forEach items="${attrMap}" var="mymap" >
								 		<div title="${mymap.key}" style="padding:10px;border:none" class="ext">
								        		 <input type="checkbox" class="selectAll"/>全选<br/>
								            	 <c:forEach items="${mymap.value}" var="attr" >
								            		<input type="checkbox" name="${mymap.key}" value="${attr.attrId}" />${attr.attrName }
								            	</c:forEach>
								        </div>
								        </c:forEach>
								    </div>
								
		<!-- PAGE CONTENT ENDS -->
		<script type="text/javascript">
        $(function(){
        	
        	var columns = $("#columns").val();
        	var columnsArray = columns.split(",");
        	$("#base").find("input").not(".selectAll").each(function(){
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