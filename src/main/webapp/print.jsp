<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <style type="text/css">
    body{background:white;margin:0px;padding:0px;font-size:13px;text-align:left;}
	.pb{font-size:13px;border-collapse:collapse;}
	.pb th{font-weight:bold;text-align:center;border:1px solid #333333;padding:2px;}
	.pb td{border:1px solid #333333;padding:2px;}
 	</style>
</head>
<body>
    <script type="text/javascript">
    	var value = window.top.opener.document.getElementById("printBody").value;
        document.write(value);
        window.print();
    </script>
</body>
</html>