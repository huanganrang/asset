<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>台账</title>
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
		<li></li>
		<li></li>
		<li></li>
	</ul>
	<article>
		<ul class="list">
			<li><a href="#">台账明细</a></li>
			<li><a href="#">库存</a></li>
			<li><a href="#">对账</a></li>
			<li><a href="#">报废表</a></li>
		</ul>

		<ul class="tablist">
			<li><a href="#"></a></li>
			<li><a href="#">1/7</a></li>
			<li><a href="#"></a></li>
			<li><a href="#">高级</a></li>
			<li><a href="#">新增</a></li>
			<li><a href="#">导入</a></li>
			<li><a href="#">导出</a></li>
			<li><a href="#">标签</a></li>
			<li><a href="#">打印</a></li>

		</ul>

		<ul class="tableheader">
			<li><img src="${pageContext.request.contextPath}/assets/images/Screen-icon--1-(2).png"/></li>
			<li>编号</li>
			<li>设备名称</li>
			<li>固定资产编号</li>
			<li>出厂编号</li>
			<li>型号</li>
			<li>设备小类</li>
			<li>在库状态</li>
			<li>设备状态</li>
			<li>设备存放地点</li>
			<li>IT验收编号</li>
		</ul>
		<div class="tablebox">
			<table>
				<tr>
					<td>测试编号</td>
					<td>0000001</td>
					<td>02041263</td>
					<td>02041263</td>
					<td>M6900/17LCD</td>
					<td>PC电脑</td>
					<td>M6900/17LCD </td>
					<td>PC电脑</td>
					<td>0000001</td>
					<td></td>
				</tr>
				<c:forEach var="content" items="${ledgerList}">
					<tr>
						<td>${content.assetId}</td>
						<td>${content.assetName}</td>
						<td>${content.assetNumber}</td>
						<td>${content.assetSerial}</td>
						<td>${content.assetModel}</td>
						<td>${content.assetType}</td>
						<td>${content.assetStockStatus}</td>
						<td>${content.assetDeviceStatus}</td>
						<td>${content.assetDeviceLocation}</td>
						<td>${content.assetItNumber}</td>
					</tr>
				</c:forEach>
			</table>
		</div>

	</article>


</main>

<script type="text/javascript">
	$(function(){
		$(".tree_href").click(function(){
			location.href=$(".tree_href").attr("href");
		});
	});
</script>

</body>
</html>
