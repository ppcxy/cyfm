<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<html>
<head>
	<style>

	</style>
	<title>综合演示用例</title>
	<script>
		$(document).ready(function () {
		});
	</script>
</head>
<body>
<div class="tools search-toolbar">
	<div class="toolbar-right">
		<form class="form-search form-inline" action="#">
			<div class="form-group">
				<label>登录名：</label> <input type="text" name="search.loginName_like" class="form-control input-small"
										   value="${param['search.loginName_like']}">
				<label>邮件名：</label> <input type="text" name="search.email_like" class="form-control input-small"
										   value="${param['search.email_like']}">
				<button type="submit" class="btn" id="search_btn">查询</button>
			</div>
		</form>
	</div>
</div>
<%--用来控制table横向滚动条的div--%>
<div class="listTableWrap">
	<table id="contentTable" data-tid="user"
		   class="table table-list table-striped table-bordered table-hover table-condensed table-advance">
		<thead>
		<tr>
			<th class="check"><input type="checkbox"></th>
			<th>登录名</th>
			<th>姓名</th>
			<th>电邮</th>
			<th>角色</th>
			<th>状态</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.content}" var="user">
			<tr>
				<td class="check"><input type="checkbox" value="${user.id}"></td>
				<td>${user.loginName}&nbsp;</td>
				<td>${user.name}&nbsp;</td>
				<td>${user.email}&nbsp;</td>
				<td>${user.roleNames}&nbsp;</td>
				<td>${allStatus[user.status]}&nbsp;</td>
					<%-- 根据权限显示按钮 --%>
				<cy:listTableActions id="${user.id}" name="${user.loginName}"/>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
<cy:pagination page="${page}" paginationSize="5"></cy:pagination>
</html>
</body>
</html>
