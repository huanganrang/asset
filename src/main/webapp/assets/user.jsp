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
            <li style="border-bottom:2px solid #f60">用户管理</li>
            <li><a href="${pageContext.request.contextPath}/roleController/treeGrid">角色管理</a></li>
        </ul>

        <ul class="tablist">
            <li><a href="#"></a></li>
            <li><a href="#">1/7</a></li>
            <li><a href="#"></a></li>
            <li id="addUser" style="padding-top: 15px;">添加</li>
            <li id="editUser" style="padding-top: 15px;">编辑</li>
            <li id="aaa" style="padding-top: 15px;">批量授权</li>
            <li id="delUser" style="padding-top: 15px;">批量删除</li>
            <li id="logout" style="padding-top: 15px;">退出登陆</li>
        </ul>

        <ul class="tableheader">
            <li><img src="${pageContext.request.contextPath}/assets/images/Screen-icon--1-(2).png"/></li>
            <li><input type="checkbox" /></li>
            <li>用户名</li>
            <li>密码</li>
            <li>创建时间</li>
            <li>最后修改时间</li>
            <li>所属角色名称</li>
        </ul>
        <div class="tablebox">
            <table>
                <c:forEach var="content" items="${userList}">
                    <tr>
                        <td><input type="checkbox" value="${content.id}" /></td>
                        <td>${content.name}</td>
                        <td>${content.pwd}</td>
                        <td>${content.createdatetime}</td>
                        <td>${content.modifydatetime}</td>
                        <td>${content.roleNames}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>

    </article>
    <%--添加用户框--%>
    <article id="addUserContent" style="display:none;line-height: 30px; position: absolute; z-index: 1000; width: 100%; height: 100%; text-align: center;">
        <div style="border: 2px #8FA4F5 solid; top: 25%; position: relative; left: 40%; height: 200px; width: 300px; font-size: 16px;background: wheat;">
            <div style="height: 50px;line-height: 50px;margin-top: 30px;"><span style="line-height: 30px;"> 用户名：</span><input type="text" id="addUserName" name="addUserName" style="line-height:30px;" /></div>
            <div style="height: 50px;line-height: 50px;"><span style="line-height: 30px;">密码：</span><input type="text" id="addPassword" name="addPassword" style="line-height:30px;margin-left: 15px;" /></div>
            <div style="height: 50px;line-height: 50px;margin-top: 10px;"><input type="button" value="添加" id="add" style="line-height:30px;margin-right: 50px; width: 80px;" /><input type="button" value="取消" id="addReset" style="line-height:30px;width: 80px;" /></div>
        </div>
    </article>
    <%--编辑用户框--%>
    <article id="editUserContent" style="display:none;line-height: 30px; position: absolute; z-index: 1000; width: 100%; height: 100%; text-align: center;">
        <div style="border: 2px #8FA4F5 solid; top: 25%; position: relative; left: 40%; height: 200px; width: 300px; font-size: 16px;background: wheat none repeat scroll 0% 0%;">
            <input type="hidden" id="userId" name="userId" />
            <div style="height: 50px;line-height: 50px;margin-top: 30px;"><span style="line-height: 30px;"> 用户名：</span><input readonly="true" type="text" id="editUserName" name="editUserName" style="line-height:30px;background-color: silver;" /></div>
            <div style="height: 50px;line-height: 50px;"><span style="line-height: 30px;">密码：</span><input type="text" id="editPassword" name="editPassword" style="line-height:30px;margin-left: 15px;" /></div>
            <div style="height: 50px;line-height: 50px;margin-top: 10px;"><input type="button" value="编辑" id="edit" style="line-height:30px;margin-right: 50px; width: 80px;" /><input type="button" value="取消" id="editReset" style="line-height:30px;width: 80px;" /></div>
        </div>
    </article>
</main>

<script type="text/javascript">
    $(function(){

        $(".tree_href").click(function(){
            location.href=$(this).attr("href");
        });

        //弹出添加用户框
        $("#addUser").click(function(){
            $("#addUserContent").show();
        });

        //添加用户框的添加按键
        $("#add").click(function(){
            var addUserName = $("#addUserName").val();
            var addPassword = $("#addPassword").val();
            if(addUserName != "" && addPassword != ""){
                var data = "name="+addUserName+"&pwd="+addPassword;
                $.ajax({
                    url:"${pageContext.request.contextPath}/userController/reg",
                    type:"get",
                    data:data,
                    dataType:"json",
                    cache:false,
                    success:function(response){
                        if(response.success){
                            location.href="${pageContext.request.contextPath}/userController/manager";
                        }
                    }
                });
            }else {
                alert("请填写用户名或密码！");
            }
        });

        //添加用户框的取消按键
        $("#addReset").click(function(){
            $("#addUserName").val("");
            $("#addPassword").val("");
            $("#addUserContent").hide();
        });

        //弹出编辑用户框
        $("#editUser").click(function(){
            var checkUser = $("table").find("tbody :checked");
            if(checkUser.size() == 1){
                $("#userId").val(checkUser.val());
                checkUser.parent().parent().each(function(){
                    $("#editUserName").val($(this).children().eq(1).text());
                    $("#editPassword").val($(this).children().eq(2).text());
                });
                $("#editUserContent").show();
            }else if(checkUser.size() < 1){
                alert("请选择一个用户！");
                return false;
            }else {
                alert("只能选择一个用户！");
                return false;
            }
        });

        //编辑用户框的编辑按键
        $("#edit").click(function(){
            var userId = $("#userId").val();
            var editPassword = $("#editPassword").val();
            if(userId != "" && editPassword != ""){
                var data = "id="+userId+"&pwd="+editPassword;
                $.ajax({
                    url:"${pageContext.request.contextPath}/userController/editPwd",
                    type:"get",
                    data:data,
                    dataType:"json",
                    cache:false,
                    success:function(response){
                        if(response.success){
                            location.href="${pageContext.request.contextPath}/userController/manager";
                        }
                    }
                });
            }else {
                alert("请填写用户名或密码！");
            }
        });

        //编辑用户框的取消按键
        $("#editReset").click(function(){
            $("#editUserContent").hide();
        });

        //批量删除用户
        $("#delUser").click(function(){
            var checkUsers = $("table").find("tbody :checked");
            if(checkUsers.size() >= 1){
                if(confirm("您确定要删除所选用户吗？")){
                    var ids=checkUsers.map(function() {
                        return $(this).val();
                    }).get().join(',');
                    var data = "ids="+ids;
                    $.ajax({
                        url:"${pageContext.request.contextPath}/userController/batchDelete",
                        type:"post",
                        data:data,
                        dataType:"json",
                        cache:false,
                        success:function(response){
                            if(response.success){
                                location.href="${pageContext.request.contextPath}/userController/manager";
                            }
                        }
                    });
                }
            }else {
                alert("请选择至少一个用户！");
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

    });
</script>

</body>
</html>