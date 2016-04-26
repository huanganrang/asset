<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/assets/common.jsp"%>
    <style type="text/css">
#dg a {
font-size:13px;
margin-top: 5px;
}


#dg div{
 width:87px;
 heigth:158px;
 margin-left: 32px;
}

#dg img{
margin-bottom:5px;
width:87px;
height:100px;
cursor:pointer;
}
#dg tr td{
text-align: center;
}
</style>
	<input type="hidden" id="columns" value="${columns}"/>
								  <table id="dg"  style="width:700px;height:450px;margin-left:40px">
								  <tr>
								  <td>  <div>
								        <img id="img2" src="${pageContext.request.contextPath}/assets/images/computer.png"/>
								  		<a href="javascript:void(0)" id="asset2">电脑</a>
								  		</div>
								  </td>
								  <td>
								  	 	<div>
								        <img src="${pageContext.request.contextPath}/assets/images/server.png" />
								  		<a href="javascript:void(0)" id="asset3">服务器</a>
								  		</div>
								  </td>
								  		
								  <td>
								        <div>
								        <img src="${pageContext.request.contextPath}/assets/images/network.png" />
								  		<a href="javascript:void(0)" id="asset4">网络设备</a>
								  		</div>
								  </td>
								  <td>
								  		<div>
								        <img src="${pageContext.request.contextPath}/assets/images/safetype.png" />
								  		<a href="javascript:void(0)" id="asset5">安全类设备</a>
								  		</div>
								  		</td>
								  </tr>
								  
								  <tr>
								 
								  <td>
								  		<div>
								        <img src="${pageContext.request.contextPath}/assets/images/othertype.png" />
								  		<a href="javascript:void(0)" id="asset8">其它类</a></div></td>
								  <td>
								  		<div>
								        <img src="${pageContext.request.contextPath}/assets/images/software.png" />
								  		<a href="javascript:void(0)" id="asset9">软件类</a></div></td>
								  		
								  <td>
								  		<div>
								        <img src="${pageContext.request.contextPath}/assets/images/parts.png" />
								  		<a href="javascript:void(0)" id="asset10">配件类</a></div></td>
								  <td>
								  		<div>
								        <img src="${pageContext.request.contextPath}/assets/images/consume.png" />
								  		<a href="javascript:void(0)" id="asset11">低置易耗器</a></div></td>
								  </tr>
								  
								   <tr>
								 
								  <td>
								  		<div>
								        <img src="${pageContext.request.contextPath}/assets/images/storage.png" />
								  		<a href="javascript:void(0)" id="asset12">储存类</a></div></td>
								  <td>
								  		<div>
								         <img src="${pageContext.request.contextPath}/assets/images/office.png" />
								  		<a href="javascript:void(0)" id="asset13">办公室办公</a></div></td>
								  <td>
								  		<div>
								         <img src="${pageContext.request.contextPath}/assets/images/idc.png" />
								  		<a href="javascript:void(0)" id="asset6">机房基础</a></div></td>
								  <td>
								  		<div>
								         <img src="${pageContext.request.contextPath}/assets/images/officetype.png" />
								  		<a href="javascript:void(0)" id="asset7">办公类设备</a></div></td>
								  </tr>
								  </table>
								    <script type="text/javascript">
									   $(function(){
										   $("#dg td a").click(function(){
											   var id = $(this).attr("id");
											   location.href="${pageContext.request.contextPath}/ledger/add?type="+id.replace("asset","");
										   });
										   
										   $("#dg img").click(function(){
											   var id = $(this).siblings("a").attr("id");
											   location.href="${pageContext.request.contextPath}/ledger/add?type="+id.replace("asset","");
										   });
									   });
								    </script>
								<!-- PAGE CONTENT ENDS -->
