<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jb.listener.Application"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="../style/reset.css" rel="stylesheet" type="text/css" />
<link href="../style/about.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../jslib/jquery.js"></script>
<script type="text/javascript" src="../jslib/html5.js"></script>
<script type="text/javascript" src="../jslib/about.js"></script>
</head>

<body>
<header>
 <h1></h1>
 <ul>
 	<li><img src="../images/System switch-1.png"/></li>
    <li><img src="../images/Alarm-2.png"/></li>
    <li>华鑫证券资产管理系统</li>
    <li><img src="../images/search-top1.png"/></li>
 </ul>
</header>
<main>   
  <ul class="nav">
  	<li><a href="javascript:window.location='search.html'">搜索</a></li>
    <li><a>上下架</a></li>
    <li><a href="javascript:window.location='Attributes.html'">设备管理</a></li>
    <li><a href="javascript:window.location='about.html'">台账管理</a></li>
    <li><a href="javascript:window.location='about-2.html'">台账报表</a></li>	
    <li><a href="javascript:window.location='user_management.html'">系统管理</a></li>
    <li><a>系统组态</a></li>
    <li></li>
  </ul> 
  <article>
  	<ul class="list">
    	<li><a href="#">用户管理</a></li>
        <li><a href="#">角色管理</a></li>
       
    </ul>
   
    	
       
<!--      以下是用户管理--> 
        <div class="tablebox-user">
        <ul class="tablist">
        	<li><a href="#"></a></li>
            <li><a href="#">1/7</a></li>
            <li><a href="#"></a></li>
            <li><a href="#">添加</a></li>
            <li><a href="#">编辑</a></li>
            <li><a href="#">批量授权</a></li>
            <li><a href="#">批量删除</a></li>            
        </ul>
         <table>
        <tr>
         <td><input type="checkbox"/></td>
         <td>登录名称</td>
         <td>密码</td>
         <td>创建时间</td>	
         <td>最后修改时间</td>
         <td>所属角色名称</td>
       </tr>
       </table>
       <div class="tablebox2">
       <table>
		<tr>
        <td><input type="checkbox"/></td>
    	<td>1</td>
        <td>******</td>
        <td>2016.02.28 10:00:00</td>
        <td>2016.03.28 10:00:00</td>
        <td>手机后台管理员</td>
        </tr>
      
        <tr>
        <td><input type="checkbox"/></td>
    	<td>1</td>
        <td>******</td>
        <td>2016.02.28 10:00:00</td>
        <td>2016.03.28 10:00:00</td>
        <td>手机后台管理员</td>
        </tr>
       <tr>
        <td><input type="checkbox"/></td>
    	<td>1</td>
        <td>******</td>
        <td>2016.02.28 10:00:00</td>
        <td>2016.03.28 10:00:00</td>
        <td>手机后台管理员</td>
        </tr>
    	
       <tr>
        <td><input type="checkbox"/></td>
    	<td>1</td>
        <td>******</td>
        <td>2016.02.28 10:00:00</td>
        <td>2016.03.28 10:00:00</td>
        <td>手机后台管理员</td>
        </tr>
        <tr>
         <td></td>
        <td></td>
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
        <td></td>
        <td></td>
        </tr>
         <tr>
          <td></td>
        <td></td>
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
        <td></td>
        <td></td>
        </tr>
         <tr>
         <td></td>
        <td></td>
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
        <td></td>
        <td></td>
        </tr>
</table>
</div>
</div>
    
  </article>
</main>
<div class="popup">
	<div class="popup-add">
    	<p>添加用户<a class="clos"></a></p>
        <ul>
        	<li>
            	<a href="#">编号</a>
               <input type="text"/>
            </li>
            <li>
            	<a href="#">登录名称</a>
               <input type="text"/>
            </li>
            <li>
            	<a href="#">密码</a>
               <input type="password" />
            </li>
            <li><input type="button" value="添加" /></li>
        </ul>
    </div>
    
    <div class="popup-edit">
    	<p>编辑用户<a class="clos"></a></p>
        <ul>
        	<li>
            	<a href="#">编号</a>
               <input type="text"/>
            </li>
            <li>
            	<a href="#">登录名称</a>
               <input type="text"/>
            </li>
            <li>
            	<a href="#">密码</a>
               <input type="password" />
            </li>
            <li><input type="button" value="添加" /></li>
        </ul>
    </div>
    
     <div class="popup-user">
    	<p>用户授权<a class="clos"></a></p>
        <ul>
        	<li>
            	<a href="#">编号</a>
               <input type="text"/>
            </li>
            <li>
            	<a href="#">用户角色</a>
               <input type="text"/>
            </li>
            
            <li><input type="button" value="添加" /></li>
        </ul>
    </div>
    
<div class="popup-ask">
    	<p>添加用户<a class="clos"></a></p>
        <ul>
        	<li>
            	<a href="#">您是否删除当前用户？</a>
               
            </li>
            <li><input type="button" value="确定" /></li>
            <li><input type="button" value="取消" /></li>
        </ul>
    </div>
<!--      以下是角色管理弹出框--> 

<div class="popup-add-role">
    	<p>添加角色<a class="clos"></a></p>
        <ul>
        	<li>
            	<a href="#">编号</a>
               <input type="text"/>
            </li>
            <li>
            	<a href="#">角色名称</a>
               <input type="text"/>
            </li>
            <li>
            	<a href="#">排序</a>
               <input type="text" />
            </li>
            <li>
            	<a href="#">上级角色</a>
               <input type="text" />
            </li>
            <li>
            	<a href="#">备注：</a>
               <input type="text" />
            </li>
            <li><input type="button" value="添加" /></li>
        </ul>
    </div>
<!--    以下是角色编辑-->
  <div class="popup-add-editor">
    	<p>角色编辑<a class="clos"></a></p>
        <ul>
        	<li>
            	<a href="#">编号</a>
               <input type="text"/>
            </li>
            <li>
            	<a href="#">角色名称</a>
               <input type="text"/>
            </li>
            <li>
            	<a href="#">排序</a>
               <input type="text" />
            </li>
            <li>
            	<a href="#">上级角色</a>
               <input type="text" />
            </li>
            <li>
            	<a href="#">备注：</a>
               <input type="text" />
            </li>
            <li><input type="button" value="添加" /></li>
        </ul>
    </div>
<!--    以下是角色授权-->    
 <div class="popup-role-authorization">
    	<p>角色授权<a class="clos"></a></p>
        <ul class="max">
        	<li>
            	<input type="checkbox"/>
            	<a href="#">超管角色可以访问的资源</a>
            </li>
            <li>
            	<ul class="min">
                	<li><input type="checkbox"/><a href="#">系统管理</a>
                            <ul class="mins">
                                <li><input type="checkbox"/><a href="#">资源管理</a></li>
                                <li><input type="checkbox"/><a href="#">功能菜单</a></li>
                   			 </ul>
                    
                    </li>
               		<li><input type="checkbox"/><a href="#">角色名称</a>
                    		<ul class="mins">
                                <li><input type="checkbox"/><a href="#">资源管理</a></li>
                                <li><input type="checkbox"/><a href="#">功能菜单</a></li>
                   			 </ul>
                    </li>
                    <li><input type="checkbox"/><a href="#">角色名称</a>
                    		<ul class="mins">
                                <li><input type="checkbox"/><a href="#">资源管理</a></li>
                                <li><input type="checkbox"/><a href="#">功能菜单</a></li>
                   			 </ul>
                    </li>
                    <li><input type="checkbox"/><a href="#">角色名称</a>
                    		<ul class="mins">
                                <li><input type="checkbox"/><a href="#">资源管理</a></li>
                                <li><input type="checkbox"/><a href="#">功能菜单</a></li>
                   			 </ul>
                    </li>
               	</ul>
                
            </li>
            
            
            <li><input type="button" value="添加" /></li>
        </ul>
    </div>

</div>
<!--      以下是角色管理--> 
        <div class="tablebox-role">
        <ul class="tablist2">
        	<li><a href="#"></a></li>
            <li><a href="#">1/7</a></li>
            <li><a href="#"></a></li>
            <li><a href="#">添加</a></li>
            <li><a href="#">编辑</a></li>
            <li><a href="#">批量授权</a></li>
            <li><a href="#">批量删除</a></li>            
        </ul>
         <table>
        <tr>
         <td><input type="checkbox"/></td>
         <td>角色名称</td>
         <td>排序</td>
         <td>上级角色</td>	
         <td>拥有资源</td>
         <td>备注</td>
       </tr>
       </table>
       <div class="tablebox2">
       <table>
		<tr>
        <td><input type="checkbox"/></td>
    	<td>超管<img src="images/triangle-green.png"/>
        	<table class="table-inline">
            	<tr>
                    <td><input type="checkbox"/></td>
                    <td>资源管理员</td>
                    <td>1</td>
                    <td>超管</td>
                    <td>地图定位页面地图定位页地图定位页</td>
                    <td></td>
                </tr>
                <tr>
                    <td><input type="checkbox"/></td>
                    <td>资源管理员</td>
                    <td>1</td>
                    <td>超管</td>
                    <td>地图定位页面地图定位页地图定位页</td>
                    <td></td>
                </tr>
               <tr>
                    <td><input type="checkbox"/></td>
                    <td>资源管理员</td>
                    <td>1</td>
                    <td>超管</td>
                    <td>地图定位页面地图定位页地图定位页</td>
                    <td></td>
                </tr>
            
            
            </table>
        
        
        </td>
        <td>0</td>
        <td></td>
        <td>地图定位页面地图定位页地图定位页</td>
        <td>超级管理员角色</td>
        </tr>
      
        <tr>
        <td><input type="checkbox"/></td>
    	<td>超管<img src="images/triangle-green.png"/></td>
        <td>0</td>
        <td></td>
        <td>地图定位页面地图定位页地图定位页</td>
        <td>超级管理员角色</td>
        </tr>
       <tr>
        <td><input type="checkbox"/></td>
    	<td>超管<img src="images/triangle-green.png"/></td>
        <td>0</td>
        <td></td>
        <td>地图定位页面地图定位页地图定位页</td>
        <td>超级管理员角色</td>
        </tr>
    	
      <tr>
        <td><input type="checkbox"/></td>
    	<td>超管<img src="images/triangle-green.png"/></td>
        <td>0</td>
        <td></td>
        <td>地图定位页面地图定位页地图定位页</td>
        <td>超级管理员角色</td>
        </tr>
        <tr>
         <td></td>
        <td></td>
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
        <td></td>
        <td></td>
        </tr>
         <tr>
          <td></td>
        <td></td>
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
        <td></td>
        <td></td>
        </tr>
         <tr>
         <td></td>
        <td></td>
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
        <td></td>
        <td></td>
        </tr>
</table>
</div>
</div>
    
	
    
    
</article>
</main>
</body>
</html>
