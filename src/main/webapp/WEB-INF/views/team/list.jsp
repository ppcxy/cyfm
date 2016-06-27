<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
  <title>team crud</title>
  <script>
    $(document).ready(function() {
      $("#team-tab").addClass("active");
    });
  </script>
</head>

<body>
<c:if test="${not empty message}">
  <div id="message" class="alert alert-success"><button data-dismiss="alert" class="close">×</button>${message}</div>
</c:if>
 <div class="tools search-toolbar">
   <div class="toolbar-right">
       <form class="form-search form-inline" action="#">
         <div class="form-group"> <label>登录名：</label> <input type="text" name="search.id_eq"   class="form-control input-small"  value="${param['search.id_eq']}"></div>
         <div class="form-group"> <label>邮件名：</label> <input type="text" name="search.name_like" class="form-control input-small" value="${param['search.name_like']}"></div>
         <button type="submit" class="btn btn-default" id="search_btn">查询</button>
       </form>
   </div>
 </div>
<table id="contentTable" class="tablelist table table-striped table-bordered table-hover table-advance">
  <thead>
  <tr>
    <th>团队id</th>
    <th>团队名称</th>
    <th>操作</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach items="${page.content}" var="team">
    <tr>
      <td>${team.id}&nbsp;</td>
      <td>${team.name}&nbsp;</td>
      <td>
        <shiro:hasPermission name="user:edit">
          <a href="${ctx}/account/user/update/${team.id}" id="editLink-${user.team.name}" class="btn default btn-xs purple">修改</a>
        </shiro:hasPermission>
      </td>
    </tr>
  </c:forEach>
  </tbody>
</table>
</body>
</html>
