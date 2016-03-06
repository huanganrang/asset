<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>华鑫资产管理系统</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- basic styles -->
<link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css" />

<!--[if IE 7]>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/font-awesome-ie7.min.css" />
<![endif]-->

<!-- page specific plugin styles -->
<!-- fonts 
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets\css\cyrillic.css" />
-->
<!-- ace styles -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/jslib/jquery-easyui-1.3.6/themes/default/easyui.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace-rtl.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace-skins.min.css" />

<!--[if lte IE 8]>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace-ie.min.css" />
<![endif]-->

<!-- inline styles related to this page -->
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

<!--[if lt IE 9]>
<script src="${pageContext.request.contextPath}/assets/js/html5shiv.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/respond.min.js"></script>
<![endif]-->
</head>
<body>
		<%@include file="/assets/assets_header.jsp"%>
		<input type="hidden" id="rootpath" value="${pageContext.request.contextPath}"/>
		<input type="hidden" id="key" value="${key}"/>
		<input type="hidden" id="columns" value="${columns}"/>
		<div class="main-container" id="main-container">
			<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script>

			<div class="main-container-inner">
				<%@include file="/assets/assets_menu.jsp"%>
				<div class="main-content">
					<div class="breadcrumbs" id="breadcrumbs">
						<script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script>
					</div>

					<div class="page-content">
						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div class="hr32"></div>
								<div id="nav-search" style="margin-left:300px;">
										<span class="input-icon">
											<input type="text" style="width: 400px" id="key" name="key" class="nav-search-input" value="${key}" placeholder="" />
											<i class="icon-search nav-search-icon"></i>
										</span>
										<input type="button" id="to-search" value="搜索"/>
								</div>

								<div class="hr hr32 hr-dotted"></div>
								
								 <div class="easyui-accordion" style="width:1024px;height:auto;">
								         <div title="默认属性" style="padding:10px;border:none" id="base" class="base">
								        		 <input type="checkbox" class="selectAll"/>全选<br/>
								            	 <c:forEach items="${baseAttrMap}" var="baseAttr" >
								            		<input type="checkbox" name="default" value="${baseAttr.key}" />${baseAttr.value }
								            	</c:forEach>
								        </div>
								        
								       <c:forEach items="${attrMap}" var="mymap" >
								         <div title="${mymap.key}" style="padding:10px;border:none" class="ext">
								         		<input type="checkbox" class="selectAll"/>全选<br/>
								            	 <c:forEach items="${mymap.value}" var="attr" >
								            		<input type="checkbox" name="${mymap.key}" value="${attr.attrId}" />${attr.attrName }
								            	</c:forEach>
								        </div>
									　　</c:forEach>
								    </div>
								
								<!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div><!-- /.main-content -->
			</div><!-- /.main-container-inner -->
		</div><!-- /.main-container -->

		<!-- basic scripts -->
		<script src="${pageContext.request.contextPath}/jslib/jquery-easyui-1.3.6/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/jslib/jquery-easyui-1.3.6/jquery.easyui.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/ace.min.js"></script>
		
		<script type="text/javascript">
        $(function(){
        	
        	var columns = $("#columns").val();
        	var columnsArray = columns.split(",");
        	$("#base").find("input").not(".selectAll").each(function(){
        		var i = columnsArray.length;
        	    while (i--) {
        	       if (columnsArray[i] === $(this).val()) {
        	    	   $(this).prop("checked",true);
        	    	   break;
        	       }
        	    }
        	});
        	
        	$(".selectAll").click(function(){
        		if($(this).is(":checked")){
        			$(this).siblings("input").each(function(){
	        			$(this).prop("checked",true);
	        		});
        		}else{
	        		$(this).siblings("input").each(function(){
	        			$(this).prop("checked",false);
	        		});
        		}
        		
        	});
        	
        	$("#to-search").click(function(){
        		var baseids = "";
        		$(".base").find("input:checked").not(".selectAll").each(function(){
        			baseids = baseids+$(this).val()+","
        		});
        		if(baseids.length > 1){
        			baseids = baseids.substring(0,baseids.length-1);
        		}
        		
        		var attrids = "";
        		$(".ext").find("input:checked").not(".selectAll").each(function(){
        			attrids = attrids+$(this).val()+","
        		});
        		if(attrids.length > 1){
        			attrids = attrids.substring(0,attrids.length-1);
        		}
        		location.href="${pageContext.request.contextPath}/asset/tosearch?key="+$("#key").val()+"&baseids="+baseids+"&attrids="+attrids;
        	});
        });
    </script>
		
</body>
</html>