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
		function refreshPage(){
			window.location.reload();
		}
		$("body").keydown(function(e){
			var ev = window.event || e;
			var code = ev.keyCode || ev.which;

			if (code==116) {
				// 阻止默认的F5事件
				if(ev.preventDefault) {
					ev.preventDefault();
				}else {
					ev.keyCode=0;
					ev.returnValue=false;
				}

				refreshPage();
				return false;
			}
			return true;
		});
		$(function () {
			if ($("table").find("td.action").size() > 0 && $("table").find("table thead tr").size() == 0) {
				$('table thead tr').append('<th class="action">操作</th>');
			}
			new TableDragSortResize(document.getElementById('contentTable'), {cidAttrName: "data-tid"});
		});
		<cy:showFieldError commandName="entity"/>
	</script>
</body>
</html>
