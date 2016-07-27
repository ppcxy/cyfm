<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<html>
<head>
  <title>team crud</title>
</head>

<body>
 <div class="tools search-toolbar">
   <div class="toolbar-right">
       <form class="form-search form-inline" action="#">
         <div class="form-group">
             <label>角色名称：</label>
             <input type="text" name="search.name_like" class="form-control input-small" value="${param['search.name_like']}">
             <button type="submit" class="btn btn-default" id="search_btn">查询</button>
         </div>

       </form>
   </div>
 </div>
<div class="listTableWrap">
    <table id="contentTable" data-tid="team" class="table table-list table-striped table-bordered table-hover table-condensed table-advance">
        <thead>
        <tr>
            <th class="check"><input type="checkbox"></th>
            <th>角色id</th>
            <th>角色名称</th>
            <th>具备权限</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.content}" var="role">
            <tr>
                <td class="check"><input type="checkbox" value="${role.id}"></td>
                <td>${role.id}&nbsp;</td>
                <td>${role.name}&nbsp;</td>
                <td>${role.permissions}&nbsp;</td>
                <cy:listTableActions name="${role.name}" id="${role.id}"/>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
 <cy:pagination page="${page}" paginationSize="5"></cy:pagination>
</body>
</html>
