<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/assets/common.jsp"%>

								<div class="hr hr32 hr-dotted"></div>

								<div id="nav-search" style="margin-left:300px;">
										<span class="input-icon">
											<input type="text" style="width: 400px" id="key" name="key" class="nav-search-input" />
											<i class="icon-search nav-search-icon"></i>
										</span>
										<input type="button" id="to-search" value="搜索"/>
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