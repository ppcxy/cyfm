<%--
  Created by IntelliJ IDEA.
  User: weep
  Date: 2018/1/15
  Time: 15:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>正在切换用户,请稍等...</title>
</head>
<body>
正在切换用户... 如长时间未跳转,请<a href="${ctx}/">点击此处</a>
<script>
	showPlace = false;
	setTimeout(function(){
		window.location.href="${ctx}/"
	},1000);
</script>
</body>
</html>
