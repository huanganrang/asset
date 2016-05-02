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
.textbox2 dl dd:last-child{width:20px; height:20px; background:url(${pageContext.request.contextPath}/images/1-3.png) no-repeat; 
position:absolute; top:5px; right:5px;}
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
 		<dl class="listmax" >
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
      	/*$(".textbox2 dl dd:last-child").click(function(o){
      		alert($(this).parent().children("dl dd:eq(5)").css.display);
      		if($(this).parent().children("dl dd:eq(5)").css.display="none")
      		{
      			//$("dl:eq(" + o + ") dd:gt(3)").css( "display", "inline-block" );
      			$(this).parent("dd:gt(3)").css( "display", "inline-block" );
      			//$("dl dd:last-child").css("background","url(images/1-3-1.png) no-repeat");
      		}else
      		{
      			$("dl dd:gt(3)").css( "display", "none" );
      			//$("dl dd:last-child").css("background","background:url(images/1-3.png) no-repeat");
      		}
      	});*/
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