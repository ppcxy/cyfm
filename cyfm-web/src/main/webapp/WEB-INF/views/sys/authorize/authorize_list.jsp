<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<html>
<head>
  <title>permission crud</title>
</head>

<body>
 <div class="tools search-toolbar">
   <div class="toolbar-right">
       <form class="form-search form-inline" action="#">
         <div class="form-group">
             <label>授权用户：</label>
             <input type="text" name="search.userId_like" class="form-control input-small" value="${param['search.userId_like']}">
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
            <th>主键</th>
            <th>用户id</th>
            <th>目标id</th>
            <th>授权类型</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.content}" var="authorize">
            <tr>
                <td class="check"><input type="checkbox" value="${authorize.id}"></td>
                <td>${authorize.id}&nbsp;</td>
                <td>${authorize.authType.info}&nbsp;</td>
                <td><sys:showUsername id="${authorize.userId}"/>&nbsp;</td>
                <td><sys:showRoleName id="${authorize.targetId}"/>&nbsp;</td>
                <cy:listTableActions name="${permission.userId}" id="${authorize.id}"/>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
 <cy:pagination page="${page}" paginationSize="5"></cy:pagination>
</body>
</html>
