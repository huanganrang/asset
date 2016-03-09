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
        <li></li>
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
            <li style="border-bottom:2px solid #f60">角色管理</li>
        </ul>

        <ul class="tablist">
            <li><a href="#"></a></li>
            <li><a href="#"></a></li>
            <li><a href="#">添加</a></li>
            <li><a href="#">编辑</a></li>
            <li><a href="#">批量授权</a></li>
            <li><a href="#">批量删除</a></li>
        </ul>

        <ul class="tableheader">
            <li><img src="${pageContext.request.contextPath}/assets/images/Screen-icon--1-(2).png"/></li>
            <li><input type="checkbox" /></li>
            <li>角色名称</li>
            <li>排序</li>
            <li>上级角色</li>
            <li>拥有资源</li>
            <li>备注</li>
        </ul>
        <div class="tablebox">
            <table>
                <tr>
                    <td><input type="checkbox" value="" /></td>
                    <td>测试角色名</td>
                    <td>0</td>
                    <td>上级角色</td>
                    <td>拥有各种资源</td>
                    <td>备注在这里，看这里</td>
                </tr>
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


</main>

<script type="text/javascript">
    $(function(){
        $(".tree_href").click(function(){
            location.href=$(this).attr("href");
        });
    });
</script>

</body>
</html>
