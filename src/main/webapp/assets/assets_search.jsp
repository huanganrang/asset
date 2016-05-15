<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/assets/common.jsp"%>
    <script src="${pageContext.request.contextPath}/jslib/search.js"></script>
<style type="text/css">
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
<div id="nav-search" style="top: 80px; left: 6%; width: 100%;" >
	<input type="text" style="height: 50px;width: 75%; background: #fff url(${pageContext.request.contextPath}/images/Search-2.png) no-repeat; padding-left: 50px;" id="key" name="key" value="${key}" class="nav-search-input" />
	<input type="button" id="to-search" style=" width: 5%; height: 50px;border: none; border-radius: 2px;background: #b47e43;" value="搜索"/>
	<input type="button" id="to-high" style="width: 5%; height: 50px;border: none; border-radius: 2px;background: #b47e43;" value="高级"/>
	<p style="display: inline-block; width: 5%;"><img src="${pageContext.request.contextPath}/images/Graphic-lists-the-Convert-button.png"/></p>
</div>
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
