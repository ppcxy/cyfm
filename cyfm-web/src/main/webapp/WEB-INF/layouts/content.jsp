<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
	<title>cyfm:<sitemesh:title/></title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta http-equiv="Cache-Control" content="no-store" />
	<meta http-equiv="Pragma" content="no-cache" />
	<meta http-equiv="Expires" content="0" />
	<!-- ================================= Css 区域 ========================================== -->
	<%@include file="/WEB-INF/views/common/import-css.jspf"%>
	<link href="${ctx}/static/manage/css/style.css" rel="stylesheet" type="text/css" />
	<!-- ================================= JS 区域 ========================================== -->
	<%@include file="/WEB-INF/views/common/import-js.jspf"%>
	<sitemesh:head />
</head>
<body>
<div class="rightinfo">
	<c:if test="${not empty message}">
		<cy:showMessage/>
	</c:if>
	<c:if test="${not empty page}">
		<div class="tools">
			<cy:listToolBarActions/>
		</div>
	</c:if>

	<sitemesh:body />
</div>
<script>


</script>
</body>
</html>
