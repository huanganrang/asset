<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/assets/common.jsp"%>
								<div class="hr hr32 hr-dotted"></div>

								<div id="nav-search" style="width: 80%;position: absolute; top: 120px;left: 14%;height:50px;z-index: 1111;">
										<input type="text" style="height: 50px;width: 80%;background: #fff url(${pageContext.request.contextPath}/images/Search-2.png) no-repeat;padding-left: 50px;" id="key" name="key" class="nav-search-input" />
										<input type="button" id="to-search" style=" width: 8%; height: 50px;border: none; border-radius: 2px;background: #b47e43;" value="搜索"/>
								</div>

								<div class="hr hr32 hr-dotted"></div>
		
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