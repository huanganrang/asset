/*
机房画图
 */
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
        initTextNode:function(option){
            var textNode = new JTopo.TextNode(option.text);
            textNode.font = 'bold 16px 微软雅黑';
            textNode.setLocation(option.left, option.top);
            textNode.zIndex = 100;
            textNode.dragable = this.option.edit||this.option.dragable;
            this.scene.add(textNode);
            if(this.option.edit) {
                var textfield = $("#jtopo_textfield");
                textNode.dbclick(function (event) {
                    console.log(event);
                    if (event.target == null) return;
                    var e = event.target;
                    textfield.css({
                        top: event.pageY-50,
                        left: event.pageX - e.width / 2 - 100
                    }).show().attr('value', e.text).focus().select();
                    e.text = "";
                    textfield[0].JTopoNode = e;
                });
                $("#jtopo_textfield").blur(function () {
                    textfield[0].JTopoNode.text = textfield.hide().val();
                });
            }
            return textNode;
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
            node.fontColor = "255,255,0";
            if(option.rotate){
                node.rotate = option.rotate;
            }
            //node.rotate = 30;
            this.scene.add(node);
            if(assetId){
                node.assetId = assetId;
            }
            if(this.option.edit) {
                if(getRowData) {
                    node.mouseover(function () {
                        var rowData = getRowData(this.assetId);
                        //console.log(rowData);
                        if(rowData){
                            this.text = rowData.assetNumber;
                        }
                    });
                    node.mouseout(function () {
                        this.text = null;
                    });
                }
            }
            return node;
        },
        initDefaultNode : function(){
            var node = this.initNode({left:10,top:10});
            node.isTool = true;
            node.dragable = false;
            var textNode = this.initTextNode({left:10,top:50,text:'Word'});
            textNode.isTool = true;
            textNode.dragable = false;
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
                    pros.rotate = oldNode.rotate;
                    if(left!=0)
                        pros.left = pros.left + (pros.width+left)*addNum;
                    if(top!=0)
                        pros.top = pros.top + (pros.height+top)*addNum;
                    if(oldNode.elementType == 'TextNode'){
                        pros.text = "word";
                        _this.initTextNode(pros);
                    }else{
                        _this.initNode(pros);
                    }

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
        showSelected:function(id){
            var nodes = this.scene.getDisplayedNodes();
            for(var i =0;i<nodes.length;i++){
                var node = nodes[i];
                if(!node.isTool&&id==node.assetId){
                    node.selected = true;
                }
            }
        },
        getSelectedNode:function(){
            var nodes = this.scene.getDisplayedNodes();
            var selecedList = new Array();
            for(var i =0;i<nodes.length;i++){
                var node = nodes[i];
                if(!node.isTool&&node.selected){
                    node.selected = true;
                    selecedList.push(node);
                }
            }
            return selecedList;
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