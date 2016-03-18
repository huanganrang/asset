<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>系统管理</title>
    <link href="${pageContext.request.contextPath}/assets/css/reset.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/assets/css/about.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/assets/js/jquery-2.0.3.min.js"></script>
</head>

<body>
<header>
    <h1></h1>
    <ul>
        <li><img src="${pageContext.request.contextPath}/assets/images/System switch-1.png"/></li>
        <li><img src="${pageContext.request.contextPath}/assets/images/Alarm-2.png"/></li>
        <li>华鑫证券资产管理系统</li>
        <li><img src="${pageContext.request.contextPath}/assets/images/search-top1.png"/></li>
    </ul>
</header>
<main>
    <ul class="nav">
        <li class="tree_href" href="${pageContext.request.contextPath}/home"></li>
        <li></li>
        <li></li>
        <li href="${pageContext.request.contextPath}/asset/ledger/list" class="tree_href"><span style="width: 100%; display: inline-block; height: 50px; line-height: 50px; padding-left: 40px; color: #fff;">台账管理</span></li>
        <li></li>
        <li><span style="width: 100%; display: inline-block; height: 50px; line-height: 50px; padding-left: 40px; color: burlywood;">系统管理</span></li>
        <li></li>
        <li></li>
    </ul>
    <article>
        <ul class="list">
            <li><a href="${pageContext.request.contextPath}/userController/manager">用户管理</a></li>
            <li style="border-bottom:2px solid #f60;font: 16px/40px '微软雅黑';">角色管理</li>
        </ul>

        <ul class="tablist">
            <li><a href="#"></a></li>
            <li><a href="#">1/1</a></li>
            <li><a href="#"></a></li>
            <li id="addRole" style="padding-top: 15px;">添加</li>
            <li id="editRole" style="padding-top: 15px;">编辑</li>
            <li id="roleResource" style="padding-top: 15px;">角色授权</li>
            <li id="delrole" style="padding-top: 15px;">批量删除</li>
            <li id="logout" style="padding-top: 15px;">退出登陆</li>
        </ul>

        <ul class="tableheader">
            <li><img src="${pageContext.request.contextPath}/assets/images/Screen-icon--1-(2).png"/></li>
            <li style="margin-left: 40px;"><input id="checkAll" type="checkbox" /></li>
            <li style="margin-left: 120px;">角色名称</li>
            <li style="margin-left: 122px;">排序</li>
            <li style="margin-left: 120px;">上级角色</li>
            <li style="margin-left: 120px;">拥有资源</li>
            <li style="margin-left: 120px;">备注</li>
        </ul>
        <div class="tablebox">
            <table id="roleList">
                <c:forEach var="content" items="${userRoleList}">
                    <tr>
                        <td><input type="checkbox" value="${content.id}" /></td>
                        <td>${content.name}</td>
                        <td>${content.seq}</td>
                        <td>${content.pname}</td>
                        <td>${content.resourceNames}</td>
                        <td>${content.remark}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </article>
    <%--添加角色框--%>
    <article id="addRoleContent" style="display:none;line-height: 30px; position: absolute; z-index: 1000; width: 100%; height: 100%; text-align: center;">
        <div style="border: 2px #8FA4F5 solid; top: 25%; position: relative; left: 40%; height: 400px; width: 400px; font-size: 16px;background-color: wheat;">
            <div style="height: 50px;line-height: 50px;margin-top: 30px;"><span style="line-height: 30px;"> 角色名称：</span><input type="text" id="addRoleName" name="addRoleName" style="line-height:30px;" /></div>
            <div style="height: 50px;line-height: 50px;"><span style="line-height: 30px;">排序：</span><input type="text" id="addSeq" name="addSeq" style="line-height:30px;margin-left: 30px;" /></div>
            <div style="height: 50px;line-height: 50px;">
                <span style="line-height: 30px;">上级角色：</span>
                <select id="addPid" name="addPid" style="line-height:30px;width: 180px;">
                    <option value =""></option>
                    <c:forEach var="content" items="${userRoleList}">
                        <option value ="${content.id}">${content.name}</option>
                    </c:forEach>
                </select>
            </div>
            <div style="height: 150px;line-height: 150px;"><span style="line-height: 30px;">备注：</span><textarea id="addRemark" name="addRemark" style="line-height:50px;margin-left: 15px;vertical-align: text-top;"></textarea></div>
            <div style="height: 50px;line-height: 50px;margin-top: 10px;"><input type="button" value="添加" id="add" style="line-height:30px;margin-right: 50px; width: 80px;" /><input type="button" value="取消" id="addReset" style="line-height:30px;width: 80px;" /></div>
        </div>
    </article>
    <%--编辑角色框--%>
    <article id="editRoleContent" style="display:none;line-height: 30px; position: absolute; z-index: 1000; width: 100%; height: 100%; text-align: center;">
        <div style="border: 2px #8FA4F5 solid; top: 25%; position: relative; left: 40%; height: 400px; width: 400px; font-size: 16px;background-color: wheat;">
            <input type="hidden" id="roleId" name="roleId" />
            <div style="height: 50px;line-height: 50px;margin-top: 30px;"><span style="line-height: 30px;"> 角色名称：</span><input type="text" id="editRoleName" name="editRoleName" style="line-height:30px;" /></div>
            <div style="height: 50px;line-height: 50px;"><span style="line-height: 30px;">排序：</span><input type="text" id="editSeq" name="editSeq" style="line-height:30px;margin-left: 30px;" /></div>
            <div style="height: 50px;line-height: 50px;">
                <span style="line-height: 30px;">上级角色：</span>
                <select id="editPid" name="editPid" style="line-height:30px;width: 180px;">
                    <option value =""></option>
                    <c:forEach var="content" items="${userRoleList}">
                        <option value ="${content.id}">${content.name}</option>
                    </c:forEach>
                </select>
            </div>
            <div style="height: 150px;line-height: 150px;"><span style="line-height: 30px;">备注：</span><textarea id="editRemark" name="editRemark" style="line-height:50px;margin-left: 15px;vertical-align: text-top;"></textarea></div>
            <div style="height: 50px;line-height: 50px;margin-top: 10px;"><input type="button" value="修改" id="edit" style="line-height:30px;margin-right: 50px; width: 80px;" /><input type="button" value="取消" id="editReset" style="line-height:30px;width: 80px;" /></div>
        </div>
    </article>
    <%--角色授权框--%>
    <article id="resourceContent" style="display:none;line-height: 30px; position: absolute; z-index: 1000; width: 100%; height: 100%; text-align: center;">
        <div style="border: 2px #8FA4F5 solid; top: 18%; position: relative; left: 40%; height: 600px; width: 500px; font-size: 16px;background-color: wheat;overflow: auto;">
            <input type="hidden" id="id" name="id" />
            <ul>
                <li>全选<input id="allResource" type="checkbox" /><span style="margin-left:180px;font-size:20px;">资源名称</span></li>
            </ul>
            <table id="resourceList">
                <c:forEach var="content" items="${resourceList}">
                    <tr>
                        <td style="height:20px;"><input type="checkbox" value="${content.id}" /></td>
                        <td style="height:20px;">${content.name}</td>
                    </tr>
                </c:forEach>
            </table>
            <div style="height: 50px;line-height: 50px;margin-top: 10px;"><input type="button" value="授权" id="resource" style="line-height:30px;margin-right: 50px; width: 80px;" /><input type="button" value="取消" id="resourceReset" style="line-height:30px;width: 80px;" /></div>
        </div>
    </article>
</main>

<script type="text/javascript">
    $(function(){
        //alert("fsdfsdf");
        $(".tree_href").click(function(){
            location.href=$(this).attr("href");
        });

        //角色全选
        $("#checkAll").click(function(){
            if($("#checkAll").prop("checked")){
                $("#roleList").find("tbody :checkbox").prop("checked", true);
            }else{
                $("#roleList").find("tbody :checkbox").prop("checked", false);
            }
        });

        //资源全选
        $("#allResource").click(function(){
            if($("#allResource").prop("checked")){
                $("#resourceList").find("tbody :checkbox").prop("checked", true);
            }else{
                $("#resourceList").find("tbody :checkbox").prop("checked", false);
            }
        });

        //弹出添加角色框
        $("#addRole").click(function(){
            $("#addRoleContent").show();
        });

        //添加角色框的添加按键
        $("#add").click(function(){
            var addRoleName = $("#addRoleName").val();
            var addSeq = $("#addSeq").val();
            var addPid = $("#addPid").val();
            var addRemark = $("#addRemark").val();
            if(addRoleName != ""){
                var data = "name="+addRoleName+"&seq="+addSeq+"&pid="+addPid+"&remark="+addRemark;
                $.ajax({
                    url:"${pageContext.request.contextPath}/roleController/add",
                    type:"post",
                    data:data,
                    dataType:"json",
                    cache:false,
                    success:function(response){
                        if(response.success){
                            location.href="${pageContext.request.contextPath}/roleController/treeGrid";
                        }
                    }
                });
            }else {
                alert("请填写角色名称！");
            }
        });

        //添加角色框的取消按键
        $("#addReset").click(function(){
            $("#addRoleName").val("");
            $("#addSeq").val("");
            $("#addPid").val("");
            $("#addRemark").val("");
            $("#addRoleContent").hide();
        });

        //弹出编辑角色框
        $("#editRole").click(function(){
            var checkRole = $("#roleList").find("tbody :checked");
            if(checkRole.size() == 1){
                $("#roleId").val(checkRole.val());
                checkRole.parent().parent().each(function(){
                    $("#editRoleName").val($(this).children().eq(1).text());
                    $("#editSeq").val($(this).children().eq(2).text());
                    $("#editRemark").val($(this).children().eq(5).text());
                });
                $("#editRoleContent").show();
            }else if(checkRole.size() < 1){
                alert("请选择一个用户！");
                return false;
            }else {
                alert("只能选择一个用户！");
                return false;
            }
        });

        //编辑角色框的编辑按键
        $("#edit").click(function(){
            var roleId = $("#roleId").val();
            var editRoleName = $("#editRoleName").val();
            var editSeq = $("#editSeq").val();
            var editPid = $("#editPid").val();
            var editRemark = $("#editRemark").val();
            if(editRoleName != ""){
                var data = "id="+roleId+"&name="+editRoleName+"&seq="+editSeq+"&pid="+editPid+"&remark="+editRemark;
                $.ajax({
                    url:"${pageContext.request.contextPath}/roleController/edit",
                    type:"post",
                    data:data,
                    dataType:"json",
                    cache:false,
                    success:function(response){
                        if(response.success){
                            location.href="${pageContext.request.contextPath}/roleController/treeGrid";
                        }
                    }
                });
            }else {
                alert("请填写角色名称！");
            }
        });

        //编辑角色框的取消按键
        $("#editReset").click(function(){
            $("#editRoleContent").hide();
        });

        //删除角色
        $("#delrole").click(function(){
            var checkUser = $("#roleList").find("tbody :checked");
            if(checkUser.size() == 1){
                if(confirm("您确定要删除所选角色吗？")){
                    var id = checkUser.val();
                    var data = "id="+id;
                    $.ajax({
                        url:"${pageContext.request.contextPath}/roleController/delete",
                        type:"post",
                        data:data,
                        dataType:"json",
                        cache:false,
                        success:function(response){
                            if(response.success){
                                location.href="${pageContext.request.contextPath}/roleController/treeGrid";
                            }
                        }
                    });
                }
            }else {
                alert("请选择一个角色！");
                return false;
            }
        });

        //退出登陆
        $("#logout").click(function(){
            $.ajax({
                url:"${pageContext.request.contextPath}/userController/logout",
                type:"get",
                dataType:"json",
                cache:false,
                success:function(response){
                    if(response.success){
                        location.href="/login.jsp";
                    }
                }
            });
        });

        //弹出角色资源修改框
        $("#roleResource").click(function(){
            var checkRoles = $("#roleList").find("tbody :checked");
            if(checkRoles.size() == 1){
                var id = checkRoles.val();
                $("#id").val(id);
                $("#resourceContent").show();
            }else {
                alert("只能选择一个用户！");
                return false;
            }
        });

        //角色资源修改的修改按键
        $("#resource").click(function(){
            var checkResources = $("#resourceList").find("tbody :checked");
            if(checkResources.size() >= 1){
                var resourceIds = checkResources.map(function() {
                    return $(this).val();
                }).get().join(',');
                var id = $("#id").val();
                if(resourceIds != "" && id != ""){
                    var data = "id="+id+"&resourceIds="+resourceIds;
                    $.ajax({
                        url:"${pageContext.request.contextPath}/roleController/grant",
                        type:"post",
                        data:data,
                        dataType:"json",
                        cache:false,
                        success:function(response){
                            if(response.success){
                                location.href="${pageContext.request.contextPath}/roleController/treeGrid";
                            }
                        }
                    });
                }
            }else {
                alert("请选择资源！");
                return false;
            }
        });

        //角色资源修改的取消按键
        $("#resourceReset").click(function(){
            $("#resourceList").find("tbody :checkbox").prop("checked", false);
            $("#resourceContent").hide();
        });

    });
</script>

</body>
</html>
