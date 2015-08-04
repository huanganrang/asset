<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jb.model.TjbMachineRoom" %>
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
					<th><%=TjbMachineRoom.ALIAS_NAME%></th>	
					<td>
						${jbMachineRoom.name}							
					</td>							
					<th><%=TjbMachineRoom.ALIAS_IMAGE_PATH%></th>	
					<td>
						${jbMachineRoom.imagePath}							
					</td>							
				</tr>		
				<tr>	
					<th><%=TjbMachineRoom.ALIAS_AREA_CODE%></th>	
					<td>
						${jbMachineRoom.areaCode}							
					</td>							
					<th><%=TjbMachineRoom.ALIAS_ADDRESS%></th>	
					<td>
						${jbMachineRoom.address}							
					</td>							
				</tr>		
				<tr>	
					<th><%=TjbMachineRoom.ALIAS_REMARK%></th>	
					<td>
						${jbMachineRoom.remark}							
					</td>							
					<th><%=TjbMachineRoom.ALIAS_ADDTIME%></th>	
					<td>
						${jbMachineRoom.addtime}							
					</td>							
				</tr>		
		</table>
	</div>
</div>