<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jb.listener.Application"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=Application.getString("SV001")%></title>
<link href="style/reset.css" rel="stylesheet" type="text/css" />
<link href="style/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="jslib/jquery.js"></script>
<script type="text/javascript" src="jslib/html5.js"></script>
<script type="text/javascript" src="jslib/index.js"></script>
</head>

<body>
<header>
 <h1></h1>
 <ul class="list">
 	<li>
    	<div class="listmin">
        	<a>环境监控系统</a>
            <a>运维管理系统</a>
            <a>能源管理系统</a>
        </div>
    </li>
    <li><a href="#"></a></li>
    <li>华鑫证券资产管理系统</li>
    <li><input/></li>
    <li></li>
    
 </ul>
</header>
<main>
<nav>
<ul class="nav">
<li>
	<img src="images/Search-1.png" />
    <a href="javascript:window.location='demo/search.html'">搜索</a>
    </li>
<li><img src="images/Up and down shelf icon-1.png"/><a href="#">上下架</a></li>
<li>
	<ul class="subNav">
    	<li><a href="javascript:window.location='demo/search.html'">搜索</a></li>
        <li><a href="#">上下架工单</a></li>
    </ul>

	<img src="images/Device management -1.png"/><a <a href="javascript:window.location='demo/Attributes.html'">设备管理</a>
	
</li>
<li><img src="images/Ledger management icon-1.png"/><a href="javascript:window.location='demo/about.html'">台账管理</a></li>
<li><img src="images/Ledger report icon -1.png"/><a href="javascript:window.location='demo/about-2.html'">台账报表</a></li>
<li><img src="images/System management icon-1.png"/><a href="javascript:window.location='demo/user_management.jsp'">系统管理</a></li>
<li><img src="images/System configuration icon .png" /><a href="#">系统组态</a></li>
<li><img src="images/head-portrait.png" /><a href="#">金榜智能</a></li>
</ul>
<p></p>
</nav>
<article></article>
<aside class="rightlist"></aside>
	<div class="rightlist1">
    <aside class="rightlistreturn"></aside>
    <ul class="list1">
    	<li>一级标题</li>
    	<li>二级
        	<ul class="list2">
        	<li>三级</li>
        	<li>三级</li>
            </ul>
        </li>
        <li>二级
        	<ul class="list2">
        	<li>三级</li>
        	<li>三级</li>
            </ul>
        </li>
        <li>二级
        	<ul class="list2">
        	<li>三级</li>
        	<li>三级</li>
            </ul>
        </li>
        <li>二级
        	<ul class="list2">
        	<li>三级</li>
        	<li>三级</li>
            </ul>
        </li>
        
        
    </ul>
	
</div>
<aside class="bottomlist"></aside>
<div class="bottomlist1">
<aside class="bottomlistrutern"></aside>
	<table>
   		<tr>
        	<th>来源</th>
            <th>描述</th>
            <th>级别</th>
            <th>时间</th>
        </tr>
       <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
       </tr>
    	<tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
       </tr>
       <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
       </tr>
    </table>
</div>

</main>
</body>
</html>