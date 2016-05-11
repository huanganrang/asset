<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/assets/common.jsp"%>
<article style = "width:100%; height:100%; background:url(assets/images/main1.png) no-repeat; background-size:cover;"></article>
		
		<script type="text/javascript">
		$(function(){
			$("#to-search").click(function(){
				if($("#key").val() != ""){
					location.href="${pageContext.request.contextPath}/asset/tosearch?key="+$("#key").val();
				}
			});
		});
		</script>
</body>
</html>