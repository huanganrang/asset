<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/assets/common.jsp"%>
	<input type="hidden" id="columns" value="${columns}"/>
								  <table id="dg"  style="width:700px;height:450px">
								  <tr>
								  <td><a href="javascript:void(0)" id="asset2">电脑</a></td>
								  <td><a href="javascript:void(0)" id="asset3">服务器</a></td>
								  <td><a href="javascript:void(0)" id="asset4">网络设备</a></td>
								  <td><a href="javascript:void(0)" id="asset5">安全类设备</a></td>
								  </tr>
								  
								  <tr>
								  <td><a href="javascript:void(0)" id="asset6">机房基础</a></td>
								  <td><a href="javascript:void(0)" id="asset7">办公类设备</a></td>
								  <td><a href="javascript:void(0)" id="asset8">其它类</a></td>
								  <td><a href="javascript:void(0)" id="asset9">软件类</a></td>
								  </tr>
								  
								   <tr>
								  <td><a href="javascript:void(0)" id="asset10">配件类</a></td>
								  <td><a href="javascript:void(0)" id="asset11">低置易耗器</a></td>
								  <td><a href="javascript:void(0)" id="asset12">储存类</a></td>
								  <td><a href="javascript:void(0)" id="asset13">办公室办公</a></td>
								  </tr>
								  </table>
								    <script type="text/javascript">
									   $(function(){
										   $("#dg td a").click(function(){
											   var id = $(this).attr("id");
											   location.href="${pageContext.request.contextPath}/ledger/add?type="+id.replace("asset","");
										   });
									   });
								    </script>
								<!-- PAGE CONTENT ENDS -->
