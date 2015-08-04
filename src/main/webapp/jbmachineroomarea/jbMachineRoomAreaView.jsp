<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jb.model.TjbMachineRoomArea" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function() {
		parent.$.messager.progress('close');		
	});
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false">
		<table class="table table-hover table-condensed">
				<tr>	
					<th><%=TjbMachineRoomArea.ALIAS_ROOM_ID%></th>	
					<td>
						${jbMachineRoomArea.roomId}							
					</td>							
					<th><%=TjbMachineRoomArea.ALIAS_NAME%></th>	
					<td>
						${jbMachineRoomArea.name}							
					</td>							
				</tr>		
				<tr>	
					<th><%=TjbMachineRoomArea.ALIAS_SCOPE%></th>	
					<td>
						${jbMachineRoomArea.scope}							
					</td>							
					<th><%=TjbMachineRoomArea.ALIAS_REMARK%></th>	
					<td>
						${jbMachineRoomArea.remark}							
					</td>							
				</tr>		
				<tr>	
					<th><%=TjbMachineRoomArea.ALIAS_ADDTIME%></th>	
					<td>
						${jbMachineRoomArea.addtime}							
					</td>							
				</tr>		
		</table>
	</div>
</div>