// 页面工具栏
function showJTopoToobar(stage){
	var toobarDiv = $('<div class="jtopo_toolbar">').html(''
		+'<input type="radio" name="modeRadio" value="normal" checked id="r1"/>'
		+'<label for="r1"> 默认</label>'
//		+'&nbsp;<input type="radio" name="modeRadio" value="select" id="r2"/><label for="r2"> 框选</label>'
//		+'&nbsp;<input type="radio" name="modeRadio" value="drag" id="r3"/><label for="r3"> 平移</label>'
		+'&nbsp;<input type="radio" name="modeRadio" value="edit" id="r4"/><label for="r4"> 编辑</label>'
		/*+'&nbsp;&nbsp;<input type="button" id="centerButton" value="居中显示"/>'
		+'<input type="button" id="fullScreenButton" value="全屏显示"/>'*/
		/*+'<input type="button" id="zoomOutButton" value=" 放 大 " />'
		+'<input type="button" id="zoomInButton" value=" 缩 小 " />'*/
		+'<input type="button" id="zoomAlignRotateLeft" value="↘" title="顺时针旋转"/>'
		+'<input type="button" id="zoomAlignRotateRight" value="↙" title="逆时针旋转"/>'
		+'<input type="button" id="zoomAlignLeftButton" value="＝" title="水平对齐" />'
		+'<input type="button" id="zoomAlignTopButton" value=" ‖ " title="垂直对齐" />'
		+'<input type="button" id="zoomUpdateSave" value="保存" />'
		+'<input type="button" id="zoomDeleteButton" value="删除" />'
		+'<input type="button" id="zoomCopyButton" value="复制" />'
		+'<input type="button" id="zoomCopyAddButton" value="复制+" title="递增复制" />'
		+'水平<input type="text" id="zoomCopyLeft" value="10" size="1">'
		+'垂直<input type="text" id="zoomCopyTop" value="0" size="1">'
		+'递增量<input type="text" id="zoomCopyAddNum" value="0" size="1">'
		+'&nbsp;&nbsp;<input type="checkbox" id="zoomCheckbox"/><label for="zoomCheckbox">鼠标缩放</label>'
		+'&nbsp;&nbsp;<input type="text" id="findText" value="" onkeydown="findButton.click()">'
		+'<input type="button" id="findButton" value=" 查 询 ">'
		+'&nbsp;&nbsp;<input type="button" id="exportButton" value="导出PNG">'
	);
		
	$('#content').prepend(toobarDiv);

	// 工具栏按钮处理
	$("input[name='modeRadio']").click(function(){			
		stage.mode = $("input[name='modeRadio']:checked").val();
	});
	$('#centerButton').click(function(){
		stage.centerAndZoom(); //缩放并居中显示
	});
	$('#zoomOutButton').click(function(){
		stage.zoomOut();
	});
	$('#zoomInButton').click(function(){
		stage.zoomIn();
	});
	$('#exportButton').click(function(){
		stage.saveImageInfo();
	});
	$('#zoomCheckbox').click(function(){
		if($('#zoomCheckbox').attr('checked')){
			stage.wheelZoom = 0.85; // 设置鼠标缩放比例
		}else{
			stage.wheelZoom = null; // 取消鼠标缩放比例
		}
	});
	$('#fullScreenButton').click(function(){
		runPrefixMethod(stage.canvas, "RequestFullScreen")
	});
	$('#zoomAlignLeftButton').click(function(){
		var scene = stage.childs[0];
		alignNode(scene,false);
		
	});
	$('#zoomUpdateSave').click(function() {
		if (!dataGrid)return;
		var roomId = dataGrid.roomId;
		if (!roomId)return;
		var scene = stage.childs[0];
		var nodes = scene.getDisplayedNodes();
		var remarks = new Array();
		var scopes = new Array();
		var ids = new Array();
		for (var i = 0; i < nodes.length; i++) {
			var node = nodes[i];
			if (!node.isTool) {
				var option = node.getBound();
				option.rotate = node.rotate;
				if (node.elementType == 'TextNode') {
					option.text = node.text;
					remarks.push(JSON.stringify(option))
				} else {
					if (node.assetId) {
						scopes.push(JSON.stringify(option))
						ids.push(node.assetId);
					}
				}
			}
		}
		$.ajax({
			url: getSaveUrl(),
			data: { 'roomId': roomId,'remarks':remarks,'ids':ids,'scopes':scopes},
			dataType: "json",
			type: "POST",
			traditional: true,
			success: function (response) {
				alert('Ok');
			}

		});
	});
	$('#zoomAlignRotateLeft').click(function(){
		var scene = stage.childs[0];
		var nodes = scene.getDisplayedNodes();
		for(var i = 0;i<nodes.length;i++){
			var node = nodes[i];
			if(node.selected&&!node.isTool){
				node.rotate +=0.1;
			}
		}

	});
	$('#zoomAlignRotateRight').click(function(){
		var scene = stage.childs[0];
		var nodes = scene.getDisplayedNodes();
		for(var i = 0;i<nodes.length;i++){
			var node = nodes[i];
			if(node.selected&&!node.isTool){
				node.rotate -=0.1;
			}
		}

	});
	function alignNode(scene,isLeft){
		var nodes = scene.getDisplayedNodes();
		if(nodes.length<2)return;
		var firstNode = null;
		var bound = null;
		for(var i = 0;i<nodes.length;i++){
			var node = nodes[i];
			if(node.selected&&!node.isTool){
				if(firstNode == null){
					firstNode = node;
					bound = firstNode.getBound();
					continue;
				}
				var selfBound = node.getBound();
				if(isLeft){
					node.setLocation(bound.left, selfBound.top);
				}else{
					node.setLocation(selfBound.left, bound.top);
				}
				
			}
		}
	}
	$('#zoomAlignTopButton').click(function(){
		var scene = stage.childs[0];
		alignNode(scene,true);
	});
	// 查询
	$('#findButton').click(function(){
		var text = $('#findText').val().trim();
		var nodes = stage.find('node[text="'+text+'"]');
		if(nodes.length > 0){
			var node = nodes[0];
			node.selected = true;
			var location = node.getCenterLocation();
			// 查询到的节点居中显示
			stage.setCenter(location.x, location.y);
			
			function nodeFlash(node, n){
				if(n == 0) {
					node.selected = false;
					return;
				};
				node.selected = !node.selected;
				setTimeout(function(){
					nodeFlash(node, n-1);
				}, 300);
			}
			
			// 闪烁几下
			nodeFlash(node, 6);
		}
	});
}

var runPrefixMethod = function(element, method) {
	var usablePrefixMethod;
	["webkit", "moz", "ms", "o", ""].forEach(function(prefix) {
		if (usablePrefixMethod) return;
		if (prefix === "") {
			// 无前缀，方法首字母小写
			method = method.slice(0,1).toLowerCase() + method.slice(1);
		}
		var typePrefixMethod = typeof element[prefix + method];
		if (typePrefixMethod + "" !== "undefined") {
			if (typePrefixMethod === "function") {
				usablePrefixMethod = element[prefix + method]();
			} else {
				usablePrefixMethod = element[prefix + method];
			}
		}
	}
);

return usablePrefixMethod;
};
/*
runPrefixMethod(this, "RequestFullScreen");
if (typeof window.screenX === "number") {
var eleFull = canvas;
eleFull.addEventListener("click", function() {
	if (runPrefixMethod(document, "FullScreen") || runPrefixMethod(document, "IsFullScreen")) {
		runPrefixMethod(document, "CancelFullScreen");
		this.title = this.title.replace("退出", "");
	} else if (runPrefixMethod(this, "RequestFullScreen")) {
		this.title = this.title.replace("点击", "点击退出");
	}
});
} else {
alert("浏览器不支持");
}*/
