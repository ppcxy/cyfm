<%--
  Created by IntelliJ IDEA.
  User: weep
  Date: 2017/9/10
  Time: 下午1:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf" %>
<html>
<head>
	<title>数据源选择</title>
	<style>
        body{
            min-width: auto;
        }

	</style>
</head>
<body>
<div class="container">
	<div class="tools search-toolbar">
		<div class="toolbar-right">
			<form class="form-search form-inline text-right" action="#">
				<div class="form-group">
					<label>数据源名称：<input type="text" name="search.keyword_custom"
					                    class="form-control input-small"
					                    value="${param['search.keyword_custom']}">
						<button type="submit" class="btn btn-default" id="search_btn">查询</button>
						<a href="${ctx}/sys/common/datasourceChoose/create" class="btn blue" id="create_btn">创建</a>
					</label>
				</div>
			</form>
		</div>
	</div>
	<div class="listTableWrap">
		<table id="contentTable" data-tid="user_choose"
		       class="table table-list table-sort table-striped table-bordered table-hover table-condensed table-advance">
			<thead>
			<tr>
				<th class="check"><input type="checkbox"></th>
				<th>数据源名称</th>
				<th>数据库类型</th>
				<th>数据库名称</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach items="${choosePage.content}" var="t">
				<tr>
					<td class="check"><input name="ids" type="checkbox" value="${t.id}" data-id="${t.id}" data-dsname="${t.dsName}" data-show="${t.dsName}[${t.id}]"></td>
					<td>${t.dsName}</td>
					<td>${t.dbType.name}</td>
					<td>${t.dbName}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	<cy:pagination page="${choosePage}" paginationSize="5"></cy:pagination>
</div>
<script>
	$(function () {
		if ($("tbody tr").size()==1) {
			$("tbody tr td:visible:eq(2)").click();
		}
	});
</script>
</body>
</html>
