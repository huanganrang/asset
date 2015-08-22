<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jb.model.TjbMachineRoom" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="jb" uri="http://www.jb.cn/jbtag"%> 
<!DOCTYPE html>
<html>
<head>
<title>机房模拟部署</title>
<jsp:include page="../inc.jsp"></jsp:include>
<script type="text/javascript" src="${pageContext.request.contextPath}/jslib/jtopo/jtopo-0.4.8-min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jslib/jtopo/toolbar.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/jslib/jtopo/css/base.css" type="text/css">


<style type="text/css"> 
	
	.img { 
		/* z-index:-1; 
		filter: alpha(opacity = 85);/*设置透明度，针对 IE8 以及更早的版本。IE9, Firefox, Chrome, Opera 和 Safari 使用属性 opacity 来设定透明度。opacity 属性能够设置的值从 0.0 到 1.0。值越小，越透明。*/ 
		width:100%;  */
	} 
	.jtopo_toolbar label {
		display: inline;
	}
	.jtopo_toolbar {
		background-color: initial;
		padding-left:initial;
		padding-top:initial;
	}
	.jtopo_toolbar #zoomCopyLeft,#zoomCopyAddNum,#zoomCopyTop{
		width:20px
	}
	
</style>		
</head>
<body>
<script type="text/javascript">
var room;
$(function() {
	parent.$.messager.progress('close');	
	
	var dataGrid = $('#dataGrid').datagrid({
		url : '${pageContext.request.contextPath}/jbAssetsController/dataGrid',
		fit : true,
		//fitColumns : true,
		border : false,
		pagination : true,
		idField : 'id',
		pageSize : 100,
		pageList : [ 100,200],
		sortName : 'id',
		sortOrder : 'desc',
		checkOnSelect : false,
		selectOnCheck : false,
		nowrap : false,
		striped : true,
/* 		rownumbers : true,
 */		singleSelect : true,
		columns : [ [ {
			field : 'id',
			title : '编号',
			width : 10,
			hidden : true
			}, {
			field : 'assetNumber',
			title : '资产编号',
			width : 100,
			formatter : function(value, row, index) {
				var unbiding_show ="block;";
				var binding_show ="block;";
				if(row.scope&&row.scope.length>0){
					unbiding_show = "none;"
					room.initNode($.parseJSON(row.scope),row.id);
				}else{
					binding_show = "none;"
				}
				var unbinding = $.formatString('<img onclick="unbinding(\'{0}\',this);" src="{1}" title="取消" style="display:'+binding_show+'"/>', row.id, '${pageContext.request.contextPath}/style/images/extjs_icons/cancel.png');
				var binding  = $.formatString('<img onclick="bindAroud(\'{0}\',this);" src="{1}" title="绑定" style="display:'+unbiding_show+'"/>', row.id, '${pageContext.request.contextPath}/style/images/extjs_icons/arrow/add.png');	
				var str = value+""+unbinding+binding;					
				return str;
			}
		} ] ],
		onLoadSuccess : function() {
			parent.$.messager.progress('close');
		}
	});
	
	$('#updateForm').form({
		url : '${pageContext.request.contextPath}/jbAssetsController/edit',
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
		}
	});
	
	//机房选择事件绑定
	$("#machineRoom").combobox({
		onSelect: function(obj){
			var value = obj.value;
			var path = value.split(",");
			$(".img-preview").attr("src","../"+path[1]).load(function() {
				
				var maxWidth = 1100;
				var maxHeight = 460;
				var realWidth = this.width;
				var realHeight = this.height;
				//如果真实的宽度大于浏览器的宽度就按照100%显示
				
				var _pw = maxWidth/realWidth;
				var _ph = maxHeight/realHeight;
				if(_pw>=_ph){
					$(".img-preview").css("height","100%").css("width","auto");
				}else{
					$(".img-preview").css("width","100%").css("height","auto");

				} 
		

				/* if(realWidth>=_w){
					$(img).css("width","100%").css("height","auto");
				}else{//如果小于浏览器的宽度按照原尺寸显示
					$(img).css("width",realWidth+'px').css("height",realHeight+'px');
				} */
			});
			room.clear();
			$('#dataGrid').datagrid('load',{
				parentId: path[0]
			});
		}	
	});	
	
});


function bindAroud(id,obj){
	if (id == undefined) {
		var rows = dataGrid.datagrid('getSelections');
		id = rows[0].id;
	}
	$("#assertId").val(id);
	room.bindSelect(function(node,params){
		$("#scope").val(JSON.stringify(node.getBound()));
		$('#updateForm').submit();
		
	},id);
	$(obj).hide().siblings().show();
}
function unbinding(id,obj){
	if (id == undefined) {
		var rows = dataGrid.datagrid('getSelections');
		id = rows[0].id;
	}
	$("#assertId").val(id);
	room.unbindSelect(function(node,params){
		$("#scope").val("");
		$('#updateForm').submit();		
	},id);
	$(obj).hide().siblings().show();
}

var buildRoom = function(option){
	var room = {
		option :{dragable:false,edit:false},
		scene : null,
		stage : null,
		backendNode : null,
		container : new Object(),
		initBackendNode : function(url){
			var s0 = new JTopo.Node();
			s0.setImage(url, true);				
			s0.setLocation(0, 0);
			s0.zIndex =80;
			s0.dragable = false;
			s0.setBound(0,0,1000,500);
			backendNode = s0;
			s0.isbackend = true;
			this.scene.add(backendNode);
		},
		init:function(_option){
			if(!_option)return;
			$.extend(this.option, _option);
			var url = this.option.backendUrl;
			var canvas = document.getElementById(this.option.canvasId);
			var stage = new JTopo.Stage(canvas);			
			console.log(this);
			this.stage = stage;
			this.scene = new JTopo.Scene();	
			if(this.option.edit){
				showJTopoToobar(stage);
				$("#zoomCopyButton").click(this,this.copyNode);
				$("#zoomCopyAddButton").click(this,this.copyAddNode);	
				$("#zoomDeleteButton").click(this,this.deleteNode);	
				
			}
			this.initBackendNode(url);
			this.stage.add(this.scene);
		},
		initNode:function(option,assetId){
			var node = new JTopo.Node();
			if(option.img)
			node.setImage(img, true);				
			node.setLocation(option.left, option.top);
			if(option.width&&option.height)
			node.setSize(option.width,option.height);
			node.zIndex = 100;
			node.alpha = 0.4;
			node.dragable = this.option.edit||this.option.dragable;
			this.scene.add(node);
			if(assetId){
				node.assetId = assetId;
			}
			return node;
		},
		initDefaultNode : function(){
			var node = this.initNode({left:10,top:10});
			node.isTool = true;
			node.dragable = false;
		},
		initDataNode : function(options){			 
			for(var i = 0;i<options.length;i++){
				var option = options[i];
				var node = initNode(option);
				this.container[option.key] = {data:option,node:node};
			}
		},
		copyNode:function(event){
			var _this = event.data;
			_this.copyRederNode(_this,1);
		},
		deleteNode:function(event){
			var _this = event.data;
			var nodes = _this.scene.getDisplayedNodes();
			for(var i =0;i<nodes.length;i++){
				var node = nodes[i];
				if(node.selected&&!node.isTool){
					_this.scene.remove(node);
				}
			}
		},
		copyAddNode:function(event){
			var _this = event.data;
			var nodes = _this.scene.getDisplayedNodes();
			var addNum = $("#zoomCopyAddNum").val();
			if(isNaN(addNum))addNum = 0;
			addNum++;
			_this.copyRederNode(_this,addNum);
		   $("#zoomCopyAddNum").val(addNum);
		},
		copyRederNode : function(_this,addNum){
			var nodes = _this.scene.getDisplayedNodes();
			var left = $("#zoomCopyLeft").val();
			var top = $("#zoomCopyTop").val();
			if(isNaN(left)){left=0;$("#zoomCopyLeft").val(left);}
			if(isNaN(top)){top=0;$("#zoomCopyTop").val(top);}
			left = parseInt(left);
			top = parseInt(top);
			for(var i =0;i<nodes.length;i++){
				var oldNode = nodes[i];
				if(oldNode.selected){
					var pros = oldNode.getBound();
					//console.log(pros);
					//console.log(left);
					if(left!=0)
						pros.left = pros.left + (pros.width+left)*addNum;
					if(top!=0)
						pros.top = pros.top + (pros.height+top)*addNum;
					_this.initNode(pros);
				}
			}
		},
		bindSelect:function(callBack,params){
			var nodes = this.scene.getDisplayedNodes();
			var oneNode;
			var jj = 0;
			for(var i =0;i<nodes.length;i++){
				var node = nodes[i];
				if(node.selected&&!node.isTool&&!node.assetId){
					oneNode = node;	
					jj++;
				}
			}
			if(jj==1){
				callBack(oneNode,params);
				oneNode.assetId = params;
				return true;
			}else{
				return false;
			}
			
		},
		unbindSelect:function(callBack,params){
			var nodes = this.scene.getDisplayedNodes();
			var oneNode;
			for(var i =0;i<nodes.length;i++){
				var node = nodes[i];
				if(node.assetId&&node.assetId==params){
					oneNode = node;	
					break;
				}
			}
			callBack(oneNode,params);
			oneNode.assetId = null;
		},
		clear : function(){
			var nodes = this.scene.getDisplayedNodes();
			for(var i =0;i<nodes.length;i++){
				var node = nodes[i];
				if(!node.isTool&&!node.isbackend){
					this.scene.remove(node);
				}
			}
			
		}
	}
	if(option){
		room.init(option);
	}
	return room;
}
$(document).ready(function(){			
	room = new buildRoom({canvasId:"canvas",backendUrl:"machineroom_Uubo1439217197812.png",edit:true});
	room.initDefaultNode();
	
	/* var canvas = document.getElementById('canvas');
	var stage = new JTopo.Stage(canvas);
	//显示工具栏
	showJTopoToobar(stage);

	var scene = new JTopo.Scene();	
	//scene.background = 'machineroom_Uubo1439217197812.png';
	
	function node(x, y, img){
		var node = new JTopo.Node();
		//node.setImage('./img/statistics/' + img, true);				
		node.setLocation(x, y);
		node.zIndex = 100;
		node.alpha = 0.7;
		scene.add(node);
		return node;
	}				
	
	function linkNode(nodeA, nodeZ, f){
		var link;
		if(f){
			link = new JTopo.FoldLink(nodeA, nodeZ);
		}else{
			link = new JTopo.Link(nodeA, nodeZ);
		}
		link.direction = 'vertical';
		scene.add(link);
		return link;
	}
	
	var s0 = new JTopo.Node();
	s0.setImage('machineroom_Uubo1439217197812.png', true);				
	s0.setLocation(0, 0);
	s0.zIndex =80;
	s0.dragable = false;
	s0.setBound(0,0,850,500);
	scene.add(s0);
	var s1 = node(305, 43, 'server.png');
	s1.alarm = '1'; */
	/* var s2 = node(365, 43, 'server.png');
	var s3 = node(425, 43, 'server.png');
	
	var g1 = node(366, 125, 'gather.png');
	linkNode(s1, g1, true);
	linkNode(s2, g1, true);
	linkNode(s3, g1, true);
	
	var w1 = node(324, 167, 'wanjet.png');
	linkNode(g1, w1);
				
	var c1 = node(364, 214, 'center.png');
	linkNode(w1, c1);
	
	var cloud = node(344, 259, 'cloud.png');
	linkNode(c1, cloud);
	
	var c2 = node(364, 328, 'center.png');
	linkNode(cloud, c2);
	
	var w2 = node(324, 377, 'wanjet.png');
	linkNode(c2, w2);
	
	var g2 = node(366, 411, 'gather.png');
	linkNode(w2, g2);
	
	function hostLink(nodeA, nodeZ){				
		var link = new JTopo.FlexionalLink(nodeA, nodeZ);				
		link.shadow = false;
		link.offsetGap = 44;
		scene.add(link);
		return link;
	}
	
	var h1 = node(218, 520, 'host.png');
	h1.alarm = '';
	hostLink(g2, h1);
	var h2 = node(292, 520, 'host.png');
	hostLink(g2, h2);
	var h3 = node(366, 520, 'host.png');
	h3.alarm = '二级告警';
	hostLink(g2, h3);
	var h4 = node(447, 520, 'host.png');
	hostLink(g2, h4);
	var h5 = node(515, 520, 'host.png');
	h5.alarm = '1M';
	hostLink(g2, h5);
	
	setInterval(function(){
		if(h3.alarm == '二级告警'){
			h3.alarm = null;
		}else{
			h3.alarm = '二级告警'
		}
	}, 600);
	 */
	/* stage.add(scene);
	 setTimeout(function(){
		 s1.fillColor = "210,30,30";
		 //scene.remove(s1);
	 },5000); */
});

</script>

	<div class="easyui-layout" data-options="fit : true,border : false">
		<div data-options="region:'north',border:false" style="height: 40px; overflow: hidden;">
			<form id="searchForm">
				<table class="table table-hover table-condensed">
					<tr>	
						<td>机房：<jb:selectSql dataType="SL02" name="machineRoom"></jb:selectSql></td>	
						<td><div id="content" style="width: 850px;"></div></td>										
					</tr>							
				</table>
				
			</form>
			
		</div>
		<div data-options="region:'center',border:true">
			<div class="easyui-layout" data-options="fit : true,border : false">
				<div data-options="region:'west',border:false" style="width: 100px; ">
					<table id="dataGrid"></table>
					<form id ="updateForm" style="display:none;">
						<input type="text" id="assertId" name="id">
						<input type="text" id="scope" name="scope">
					</form>
				</div>
				<div data-options="region:'center',border:false">
						
						 <canvas id='canvas' width='1000' height='500'>Canvas not supported</canvas>
					
				</div>
			</div>
			
		</div>
	</div>
</body>
</html>