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
         <div class="form-group"> <label>团队名称：</label> <input type="text" name="search.name_like"   class="form-control input-small"  value="${param['search.name_like']}"></div>
         <button type="submit" class="btn btn-default" id="search_btn">查询</button>
       </form>
   </div>
 </div>
<div class="listTableWrap">
    <table id="contentTable" data-tid="team" class="table table-list table-striped table-bordered table-hover table-condensed table-advance">
        <thead>
        <tr>
            <th>团队id</th>
            <th>团队名称</th>
            <th>团队管理者</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.content}" var="team">
            <tr>
                <td>${team.id}&nbsp;</td>
                <td>${team.name}&nbsp;</td>
                <td>${team.master.name}&nbsp;</td>
                <cy:listTableActions name="${team.name}" id="${team.id}"/>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
 <cy:pagination page="${page}" paginationSize="5"></cy:pagination>
</body>
</html>
