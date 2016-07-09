<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>cyfm:<sitemesh:title/></title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<style type="text/css">
	#main {
		padding-top: 5px;
	}
	body{
		min-width: 0px !important;
	}
</style>
<!-- ================================= Css 区域 ========================================== -->
<%@include file="/WEB-INF/views/common/import-css.jspf"%>
<link href="${ctx}/static/manage/css/style.css" rel="stylesheet" type="text/css" />
<!-- ================================= JS 区域 ========================================== -->
<%@include file="/WEB-INF/views/common/import-js.jspf"%>
<sitemesh:head />

</head>

<body>
	<div class="container">
		<%@ include file="/WEB-INF/layouts/default/header.jsp"%>
		<div class="row">
			<%@ include file="/WEB-INF/layouts/default/left.jsp"%>
			<div id="main" class="col-md-10">
				<sitemesh:body />
			</div>
		</div>
		<%@ include file="/WEB-INF/layouts/default/footer.jsp"%>
	</div>
	<script>
		<cy:showFieldError commandName="entity"/>
	</script>
</body>
</html>
