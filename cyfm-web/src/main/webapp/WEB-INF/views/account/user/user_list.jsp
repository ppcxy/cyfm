<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<html>
<head>
	<style>

	</style>
	<title>综合演示用例</title>
	<script>
		$(document).ready(function() {
		});
	</script>
</head>

<body>
	<div class="tools search-toolbar toolbar-right">
		<form class="form-search form-inline" action="#">
			<label>登录名：</label> <input type="text" name="search.loginName_like"   class="form-control input-small"  value="${param['search.loginName_like']}">
			<label>邮件名：</label> <input type="text" name="search.email_like" class="form-control input-small" value="${param['search.email_like']}">
			<button type="submit" class="btn" id="search_btn">查询</button>
		</form>
	</div>
	<table id="contentTable" class="tablelist table table-striped table-bordered table-hover table-condensed table-advance">
		<thead>
		<tr>
			<th class="check"><input type="checkbox"></th>
			<th>登录名</th>
			<th>姓名</th>
			<th>电邮</th>
			<th>角色</th>
			<th>状态</th>
            <shiro:hasPermission name="user:delete or user:update">
			<th>操作</th>
	        </shiro:hasPermission>
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
				<shiro:hasPermission name="user:delete or user:update">
				<td		 class="action">
                    <shiro:hasPermission name="user:update">
						<a href="${ctx}/account/user/update/${user.id}" id="editLink-${user.loginName}" class="btn btn-xs purple"><i class="fa fa-edit"></i> 修改</a>
                    </shiro:hasPermission>
                    <shiro:hasPermission name="user:delete">
						<a href="${ctx}/account/user/delete/${user.id}" id="deleteLink-${user.loginName}" class="btn btn-xs red"><i class="fa fa-trash"></i> 删除</a>
                    </shiro:hasPermission>
				</td>
				</shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<cy:pagination page="${page}" paginationSize="5"></cy:pagination>
</body>
</html>
