<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<html>
<head>
	<title>用户在线历史</title>
</head>
<body>
<div class="tools">
	<div class="btn-group toolbar">
	</div>
	<shiro:hasPermission name="${resourceIdentity}:config">
		<ul class="toolbar-right">
			<li>
				<div class="btn-group config">
					<button type="button" class="btn btn-default dropdown-toggle no-disabled" data-toggle="dropdown" aria-expanded="false">
						<i class="fa fa-cog"></i> <span class="hidden-xs">设置</span> <i class="fa fa-angle-down hidden-xs"></i>
					</button>
					<ul class="dropdown-menu pull-right">
						<li class="more_list">
							<a onclick="javascript:$cy.table.resetTableResize($('table')[0])">重置表格</a>
							<a onclick="javascript:$cy.urlTools.resetSortUrl()">重置排序</a>
							<a onclick="javascript:$cy.urlTools.resetSearchParamUrl()">重置查询</a>
							<a onclick="javascript:$('.search-toolbar').toggle();updateTheadTop();">显示/隐藏查询</a>
						</li>
					</ul>
				</div>
			</li>
		</ul>
	</shiro:hasPermission>
</div>
<div class="tools search-toolbar">
	<div class="toolbar-right">
		<form class="form-search form-inline text-right" action="#">
			<div class="form-group">
				<c:if test="${empty param['search.userId_eq']}">
					<label>用户名：<input name="search.username_like" class="form-control input-small input-inline" placeholder="模糊查询"/></label>
				</c:if>

				<label>最后退出时间从：
					<input name="search.lastStopTimestamp_gte"
					       class="form-control input-small input-inline datepicker"
					       data-format="both"
					       placeholder="大于等于"
					       value="${param['search.lastStopTimestamp_gte']}"/>
					到
					<input name="search.lastStopTimestamp_lte"
					       class="form-control input-small input-inline datepicker"
					       data-format="both"
					       data-position="bottom-left"
					       placeholder="小于等于"
					       value="${param['search.lastStopTimestamp_lte']}"/>
				</label>
			</div>
			<div class="form-group">
				<label><button type="submit" class="btn btn-default" id="search_btn">查询</button></label>
			</div>
		</form>
	</div>
</div>
<div class="listTableWrap">
	<table id="contentTable" data-tid="${modelName}" class="table table-list table-sort table-striped table-bordered table-hover table-condensed table-advance">
		<thead>
		<tr>
			<th sort="username">用户</th>
			<th>用户会话ID</th>
			<th style="width: 150px;">用户主机IP</th>
			<th style="width: 150px;">系统主机IP</th>
			<th style="width: 150px;">User-Agent</th>
			<th sort="lastLoginTimestamp">最后登录时间</th>
			<th sort="lastStopTimestamp">最后退出时间</th>
			<th sort="loginCount">登录次数</th>
			<th sort="totalOnlineTime">总在线时长</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.content}" var="m">
			<tr>
				<td><a class="nojump" href="${ctx}/admin/sys/user/${m.userId}">${m.username}</a></td>
				<td>${m.uid}</td>
				<td>${m.host}</td>
				<td>${m.systemHost}</td>
				<td>${m.userAgent}</td>
				<td><pretty:prettyTime date="${m.lastLoginTimestamp}"/></td>
				<td><pretty:prettyTime date="${m.lastStopTimestamp}"/></td>
				<td>${m.loginCount}</td>
				<td><pretty:prettySecond seconds="${m.totalOnlineTime}"/></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
<cy:pagination page="${page}" paginationSize="5"/>
<script type="text/javascript">
	$(function() {
		$(".btn-force-logout").click(function() {
			var checkbox = $cy.table.getAllSelectedCheckbox($(".table"));
			if(!checkbox.length) {
				return;
			}
			$cy.confirm({
				message : "确认强制退出吗？",
				yes : function() {
					var url = ctx + "/sys/user/online/forceLogout?" + checkbox.serialize();
					window.location.href = url;
				}
			});
		});
	});
</script>
</body>
</html>
