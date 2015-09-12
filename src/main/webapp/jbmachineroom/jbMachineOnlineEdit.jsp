<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jb.model.TjbAssets" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="jb" uri="http://www.jb.cn/jbtag"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/jslib/jtopo/jtopo-0.4.8-min.js"></script>
<script type="text/javascript">
	$(function() {
		//机柜对象
		var cabinet = {
			dbStatus : {add:0,edit:1,del:2},
			uplace:'${jbAssets.uplace}', //u位数
			top:10,
			bottom:270,
			id:'${jbAssets.id}',
			selected : null,
			height:function(){
				return (this.bottom - this.top-this.uplace)/this.uplace;
			},
			parse : function(equip){
				var scope = equip.scope.split('-');
				equip.uStart = parseInt(scope[0]);
				equip.uEnd = parseInt(scope[1]);
				return this;
			},
			buildFwq:function(equip){
				var obj = this.temFwq.clone();
				this.setBound(equip,obj);
				$('#jiguiarea').append(obj);
				equip.image = obj;
				this.equips.push(equip);
				obj.click(equip,function(event){
					//当前选中
					cabinet.select(event.data);
				});
				this.select(equip);
			},
			setBound:function(equip,image){
				var start = equip.uStart;
				var end = equip.uEnd;
				var size = end - start +1;
				var height = parseInt(this.height())+1;
				image.height(height*size);
				var top = this.top+(this.uplace - end)*(height)+1;
				image.css('top',top+"px");
				image.show();
			},
			select:function(equip){
				var oldSelect = cabinet.selected;
				cabinet.selected = equip;
				//css改变
				if(oldSelect)
				oldSelect.image.css('border','');
				if(cabinet.selected){
					cabinet.selected.image.css('border','2px solid red');
					$('#form').loadForm({'data':cabinet.selected});
				}
			},
			equips: new Array(), //服务器对象
			delEquips:new Array(),
			temFwq: $("#templete_fuwuqi"),
			remove:function(equip){
				for (var i = 0; i < this.equips.length; i++) {
					if (this.equips[i].id == equip.id) {
						this.equips.splice(i, 1);
						return;
					}
				}
			},
			adjust:function(equip){
				for (var i = 0; i < this.equips.length; i++) {
					if (this.equips[i].id == equip.id) {
						$.extend(this.equips[i],equip);
						this.setBound(this.equips[i],this.equips[i].image);
						return;
					}
				}
			},
			validate : function(equip){
				this.parse(equip);
				if(equip.scope.indexOf('-')<0){
					alert('u位格式不正确，例如：1-2');
					return false;
				}
				if(this.validateEquipNumber(equip)){
					alert("设备号已存在");
					return false;
				}else if(this.validateUplace(equip)){
					alert("u位已占用");
					return false;
				}
				return true;
			},
			validateUplace : function(equip){
				var flag = false;
				var place = this.uplace;
				if(equip.uStart>place||equip.uEnd>place){
					return true;
				}
				function isIn(equip,temp){
					var flag = false;
					var start = equip.uStart;
					var end = equip.uEnd;
					if(start>=temp.uStart&&start<=temp.uEnd){
						flag = true;
					}else if(end>=temp.uStart&&end<=temp.uEnd){
						flag = true;
					}
					return flag;
				}
				$(this.equips).each(function(){
					if(equip.id&&this.id == equip.id)return true;
					var temp = this;
					flag = isIn(equip,temp)||isIn(temp,equip);
					if(flag)return false;
				});

				return flag;
			},
			validateEquipNumber:function(equip){
				var flag = false;
				$(this.equips).each(function(){
					if(equip.id&&this.id == equip.id)return true;
					if(this.assetNumber == equip.assetNumber){
						flag = true;
						return false;
					}
				});
				return flag;
			},
			load:function(data){
				if(!data){
					var equip = {parentId:this.id,rows:1000};
					$.ajax({
						url: "${pageContext.request.contextPath}/jbAssetsController/dataGrid",
						data: equip,
						dataType: "json",
						type: "POST",
						success: function (response) {
							var rows = response.rows;
							for(var i = 0;i<rows.length;i++){
								var _equip = rows[i];
								cabinet.parse(_equip).buildFwq(_equip);
							}
						}
					});
				}
			}
		};
		parent.$.messager.progress('close');
		$('#form').form({
			url : '${pageContext.request.contextPath}/jbMachineRoomController/edit',
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

		//上架
		parent.$.modalDialog.online = function(){
			var equip = $.serializeObject($('#form'));
			equip.id = new Date().getTime();
			equip.dbStatus = cabinet.dbStatus.add;
			if(cabinet.validate(equip)) {
				cabinet.buildFwq(equip);
			}
		};

		//调整
		parent.$.modalDialog.change = function(){
			var equip = $.serializeObject($('#form'));
			if(cabinet.selected) {
				if (cabinet.selected.id != equip.id) {
					return;
				}
				if (cabinet.validate(equip)) {
					equip.dbStatus = cabinet.dbStatus.edit;
					cabinet.adjust(equip);
				}
			}
		}


		//下架
		parent.$.modalDialog.offline = function(){
			if(cabinet.selected) {
				var selected = cabinet.selected;
				cabinet.remove(cabinet.selected);
				cabinet.select(null);
				selected.image.remove();
				cabinet.delEquips.push(selected);
			}
		}
		//保存
		parent.$.modalDialog.save = function(){
			var addUrl = '${pageContext.request.contextPath}/jbAssetsController/add';
			var editUrl = '${pageContext.request.contextPath}/jbAssetsController/edit';
			function ajaxOperation(url,equip){
				equip.image = null;
				$.ajax({
					url: url,
					data: equip,
					dataType: "json",
					type: "POST",
					success: function (response) {
						if(response.success){
							var data = response.obj;

						}
					}
				});
			}
			for (var i = 0; i < cabinet.equips.length; i++) {
				var equip = cabinet.equips[i];
				var id = equip.id+"";

				if(id.length<36){
					ajaxOperation(addUrl,equip);
				}else if(equip.dbStatus&&(equip.dbStatus ==cabinet.dbStatus.edit)){
					ajaxOperation(editUrl,equip);
				}
			}
			for (var i = 0; i < cabinet.delEquips.length; i++) {
				var equip = cabinet.delEquips[i];
				var id = equip.id+"";
				if(id.length == 36){
					ajaxOperation('${pageContext.request.contextPath}/jbAssetsController/delete',equip);
				}
			}

		}
		cabinet.load();
	});

</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'west',border:false" style="width: 100px; " id="jiguiarea">
		<img class="img-preview" style="position:absolute;float:left;" src="${pageContext.request.contextPath}/${jbAssets.assertIcon}">
		<img id="templete_fuwuqi" style="display:none;width:80px;position:absolute;float:left;left:10px;top: 10px;z-index:10" class="imgmachine" src="${pageContext.request.contextPath}/uploadfiles/basedata/TN/fuwuqi.png">
	</div>
	<div data-options="region:'center',border:false" title="" style="overflow: hidden;">
		<form id="form" method="post" enctype="multipart/form-data">
			<input type="hidden" name="parentId" value = "${jbAssets.id}"/>
			<input type="hidden" name="firstCategory" value="AT01">
			<input type="hidden" name="id">
			<div id="jiguitabs" class="easyui-tabs" style="width:700px;">
				<div title="基本属性" style="padding:10px">
					<table class="table table-hover table-condensed">
						<tr>
							<th><%=TjbAssets.ALIAS_ASSET_NUMBER%></th>
							<td>
								<input class="span2" name="assetNumber" type="text"/>
							</td>
							<th><%=TjbAssets.ALIAS_SECOND_CATEGORY%></th>
							<td>
								<jb:select dataType="SC" name="secondCategory"></jb:select>
							</td>
						</tr>
						<tr>

							<th><%=TjbAssets.ALIAS_ASSET_TYPE%></th>
							<td>
								<jb:select dataType="TN" name="assetType"></jb:select>
							</td>
							<th><%=TjbAssets.ALIAS_SERIAL_NUMBER%></th>
							<td>
								<input class="span2" name="serialNumber" type="text"/>
							</td>

						</tr>
						<tr>
							<th>U位</th>
							<td>
								<input class="span2" name="scope" type="text"/>
							</td>
							<th><%=TjbAssets.ALIAS_UID%></th>
							<td>
								<input class="span2" name="uid" type="text"/>
							</td>
						</tr>
					</table>
				</div>
				<div title="其他属性" style="padding:10px">
					<table class="table table-hover table-condensed">

						<tr>
							<th><%=TjbAssets.ALIAS_DEPT_ID%></th>
							<td>
								<jb:select dataType="SL02" name="deptId"></jb:select>
							</td>
							<th><%=TjbAssets.ALIAS_PRINCIPAL%></th>
							<td>
								<input class="span2" name="principal" type="text"/>
							</td>
						</tr>
						<tr>
							<th><%=TjbAssets.ALIAS_BUY_DATE%></th>
							<td>
								<input class="span2" name="buyDate" type="text" onclick="WdatePicker({dateFmt:'<%=TjbAssets.FORMAT_BUY_DATE%>'})"  maxlength="0" class="" />
							</td>
							<th><%=TjbAssets.ALIAS_MAKE_DATE%></th>
							<td>
								<input class="span2" name="makeDate" type="text" onclick="WdatePicker({dateFmt:'<%=TjbAssets.FORMAT_MAKE_DATE%>'})"  maxlength="0" class="" />
							</td>
						</tr>
						<tr>
							<th><%=TjbAssets.ALIAS_SUPPLIER%></th>
							<td>
								<input class="span2" name="supplier" type="text"/>
							</td>
							<th><%=TjbAssets.ALIAS_SUPPLIER_PHONE%></th>
							<td>
								<input class="span2" name="supplierPhone" type="text"/>
							</td>
						</tr>
						<tr>
							<th><%=TjbAssets.ALIAS_FACTORY%></th>
							<td colspan="3">
								<jb:select dataType="FY" name="factory"></jb:select>
							</td>
						</tr>
						<tr>

							<th><%=TjbAssets.ALIAS_DESCRIPTION%></th>
							<td colspan="3">
								<textarea rows="3" style="width:90%" name="description"></textarea>
							</td>
						</tr>
					</table>
				</div>
				<div title="标准参数" style="padding:10px">
					<table class="table table-hover table-condensed">
						<tr>
							<th><%=TjbAssets.ALIAS_MEASURE%></th>
							<td>
								<input class="span2" name="measure" type="text"/>
							</td>
							<th><%=TjbAssets.ALIAS_WEIGHT%></th>
							<td>
								<input class="span2" name="weight" type="text"/>
							</td>
						</tr>
						<tr>
							<th><%=TjbAssets.ALIAS_STANDARD_POWER%></th>
							<td colspan="3">
								<input class="span2" name="standardPower" type="text"/>
							</td>
						</tr>
					</table>

				</div>
				<div title="位置信息" style="padding:10px">
				</div>
				<div title="运行状态" style="padding:10px">
				</div>
				<div title="运维信息" style="padding:10px">
				</div>
			</div>
		</form>
	</div>
</div>