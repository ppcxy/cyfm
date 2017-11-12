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
    <title>用户选择</title>
</head>
<body>
<div class="tools search-toolbar">
    <div class="toolbar-right">
        <form class="form-search form-inline" action="#">
            <div class="form-group">
                <label>关键字(用户名,用户姓名, Email)：</label>
                <input type="text" name="search.name_or_username_or_email_like      " class="form-control input-small"
                       value="${param['search.name_like']}">
                <button type="submit" class="btn btn-default" id="search_btn">查询</button>
            </div>

        </form>
    </div>
</div>
<div class="listTableWrap">
    <table id="contentTable" data-tid="team"
           class="table table-list table-striped table-bordered table-hover table-condensed table-advance">
        <thead>
        <tr>
            <th class="check"><input type="checkbox"></th>
            <th>用户名</th>
            <th>用户姓名</th>
            <th>Email</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${choosePage.content}" var="user">
            <tr>
                <td class="check"><input type="checkbox" value="${user.id}"></td>
                <td>${user.username}</td>
                <td>${user.name}</td>
                <td>${user.email}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<cy:pagination page="${choosePage}" paginationSize="5"></cy:pagination>
</body>
</html>
