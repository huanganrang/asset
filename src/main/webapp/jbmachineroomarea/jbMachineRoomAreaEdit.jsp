<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jb.model.TjbMachineRoomArea" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="jb" uri="http://www.jb.cn/jbtag"%> 
<script type="text/javascript">
	$(function() {
		parent.$.messager.progress('close');
		$('#form').form({
			url : '${pageContext.request.contextPath}/jbMachineRoomAreaController/edit',
			onSubmit : function() {
				parent.$.messager.progress({
					title : '提示',
					text : '数据处理中，请稍后....'
				});
				var isValid = $(this).form('validate');
				if (!isValid) {
					parent.$.messager.progress('close');
				}
				return isValid;
			},
			success : function(result) {
				parent.$.messager.progress('close');
				result = $.parseJSON(result);
				if (result.success) {
					parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
					parent.$.modalDialog.handler.dialog('close');
				} else {
					parent.$.messager.alert('错误', result.msg, 'error');
				}
			}
		});
	});
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title="" style="overflow: hidden;">
		<form id="form" method="post">
				<input type="hidden" name="id" value = "${jbMachineRoomArea.id}"/>
			<table class="table table-hover table-condensed">
				<tr>	
					<th><%=TjbMachineRoomArea.ALIAS_ROOM_ID%></th>	
					<td>
											<input class="span2" name="roomId" type="text" value="${jbMachineRoomArea.roomId}"/>
					</td>							
					<th><%=TjbMachineRoomArea.ALIAS_NAME%></th>	
					<td>
											<input class="span2" name="name" type="text" value="${jbMachineRoomArea.name}"/>
					</td>							
			</tr>	
				<tr>	
					<th><%=TjbMachineRoomArea.ALIAS_SCOPE%></th>	
					<td>
											<input class="span2" name="scope" type="text" value="${jbMachineRoomArea.scope}"/>
					</td>							
					<th><%=TjbMachineRoomArea.ALIAS_REMARK%></th>	
					<td>
											<input class="span2" name="remark" type="text" value="${jbMachineRoomArea.remark}"/>
					</td>							
			</tr>	
				<tr>	
					<th><%=TjbMachineRoomArea.ALIAS_ADDTIME%></th>	
					<td>
					<input class="span2" name="addtime" type="text" onclick="WdatePicker({dateFmt:'<%=TjbMachineRoomArea.FORMAT_ADDTIME%>'})"   maxlength="0" value="${jbMachineRoomArea.addtime}"/>
					</td>							
			</tr>	
			</table>				
		</form>
	</div>
</div>