<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>系统管理</title>
    <link href="${pageContext.request.contextPath}/style/reset.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/style/about.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/jslib/jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/jslib/html5.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/jslib/user.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery-2.0.3.min.js"></script>

</head>

<body>
<main>   
  <article>
       
<!--      以下是用户管理--> 
        <div class="tablebox-user">
        <ul class="tablist">
            <li><a href="#"></a></li>
            <li><a href="#">1/7</a></li>
            <li><a href="#"></a></li>
            <li id="addUser"><a href="#">添加</a></li>
            <li id="editUser"><a href="#">编辑</a></li>
            <li id="userRole"><a href="#">用户授权</a></li>
            <li id="delUser" ><a href="#">批量删除</a></li>              
        </ul>
         <table>
        <tr>
         <td><input id="checkAll" type="checkbox"/></td>
         <td>登录名称</td>
         <td>密码</td>
         <td>创建时间</td>	
         <td>最后修改时间</td>
         <td>所属角色名称</td>
       </tr>
       </table>
       <div class="tablebox2">
	    <table id="userList">
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
   </div>
  </article>
</main>
<div class="popup">
	<div class="popup-add">
    	<p>添加用户<a class="clos"></a></p>
        <ul>
               <li>
               <a href="#">编号</a>
               <input id="addUserId" type="text"/>
            	</li>
            <li>
               <a href="#">登录名称</a>
               <input id="addUserName" name="addUserName"  type="text"/>
            </li>
            <li>
               <a href="#">密码</a>
               <input id="addPassword" name="addPassword" type="password" />
            </li>
            <li><input id="btn_user_add" type="button" value="添加" /></li>
        </ul>
    </div>
    
    <div class="popup-edit">
    	<p>编辑用户<a class="clos"></a></p>
        <ul>
        	<li>
            	<a href="#">编号</a>
               <input id="editUserId" type="text"/>
            </li>
            <li>
            	<a href="#">登录名称</a>
               <input id="editUserName" name="editUserName" type="text"/>
            </li>
            <li>
            	<a href="#">密码</a>
               <input id="editPassword" name="editPassword" type="password" />
            </li>
            <li><input id="btn_user_edit" type="button" value="添加" /></li>
        </ul>
    </div>
    
    <!--  
    <div class="popup-user">
    	<p>用户授权<a class="clos"></a></p>
    	<input type="hidden" id="ids" name="ids" />
        <ul>
        	<li>
            	<a href="#">编号</a>
                <input type="text"/>
            </li>
            <li>
            	<a href="#">用户角色</a>
                 <select id="userRoleList" style="font-size:16px;">
			        <c:forEach var="content" items="${userRoles}">
			             <option value="${content.id}">${content.text}</option>
			        </c:forEach>
	    		 </select>
            </li>
            
            <li><input id="btn_user_audit" type="button" value="添加" /></li>
        </ul>
    </div>
    -->
    <!--    以下是用户授权-->    
	 <div class="popup-user">
	    	<p>用户授权<a class="clos"></a></p>
	        <ul class="max">
	        	<li class="popup-user-number">
	            	<a style="width:25%; font:12px/30px '黑体'; color:#999; padding:0; letter-spacing:1em; 
	            			  border-right:1px solid #999;
							  height:25px; display:inline-block;" href="#">编号</a>
                	<input id="auditUserId" type="text"/>
	            </li>
	            <li>
	            	<ul class="min">
	            		<c:forEach var="content" items="${userRoles}">
	                	<li><input type="checkbox" value="${content.id}"/><a href="#">${content.text}</a></li>
			        	</c:forEach>
	               	</ul>
	            </li>
	            <li><input id="btn_user_audit" type="button" value="添加" /></li>
	        </ul>
	
	</div>
    
    
    
<div class="popup-ask">
    	<p>删除用户<a class="clos"></a></p>
    	<input type="hidden" id="delUserId" name="delUserId" />
        <ul>
        	<li>
            	<a href="#">您是否删除当前用户？</a>
               
            </li>
            <li><input id="btn_user_del" type="button" value="确定" /></li>
            <li><input id="btn_user_del_cancel" type="button" value="取消" /></li>
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

</div>
    
	
    
    
</article>
</main>
</body>
</html>
