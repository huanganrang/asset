<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- basic styles -->
<link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace-skins.min.css" />
<link href="${pageContext.request.contextPath}/jslib/jquery-easyui-1.3.6/themes/default/easyui.css" rel="stylesheet" />

<script src="${pageContext.request.contextPath}/assets/js/ace-extra.min.js"></script>

<!-- basic scripts -->
<script src="${pageContext.request.contextPath}/assets/js/jquery-2.0.3.min.js"></script>
<script src="${pageContext.request.contextPath}/jslib/jquery-easyui-1.3.6/jquery.easyui.min.js"></script>	
<script src="${pageContext.request.contextPath}/jslib/jquery-easyui-1.3.6/locale/easyui-lang-zh_CN.js"></script>	
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

<!-- ace scripts -->

<script src="${pageContext.request.contextPath}/assets/js/ace.min.js"></script>

<!-- inline scripts related to this page -->
<script type="text/javascript">
var rootpath = $("#rootpath").val();
</script>

<input type="hidden" id="rootpath" value="${pageContext.request.contextPath}"/>

