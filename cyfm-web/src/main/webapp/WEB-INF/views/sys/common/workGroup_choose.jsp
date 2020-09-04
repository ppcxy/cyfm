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
	<title>工作组选择</title>
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
					<label>工作组名：<input type="text" name="search.keyword_custom"
					                   class="form-control input-small"
					                   value="${param['search.keyword_custom']}">
						<button type="submit" class="btn btn-default" id="search_btn">查询</button>
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
				<th>组名</th>
				<th>组长</th>
				<th>组内人数</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach items="${choosePage.content}" var="g">
				<tr>
					<td class="check"><input name="ids" type="checkbox" value="${g.id}" data-id="${g.id}" data-name="${g.name}" data-show="${g.name}[${g.id}]"  data-master="${g.master.username}" data-master-show="${g.master.showName}"></td>
					<td>${g.name}</td>
					<td>${g.master.showName}</td>
					<td>${fn:length(g.userList)}</td>
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
