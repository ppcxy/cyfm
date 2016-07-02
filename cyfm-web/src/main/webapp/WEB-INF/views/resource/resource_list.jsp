<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<html>
<head>
  <title>资源管理</title>
  <script>
    $(document).ready(function() {
      $("#resource-tab").addClass("active");
    });
  </script>
</head>
<body>
<div class="tools search-toolbar toolbar-right">
    <form class="form-search form-inline" action="#">
      <label>资源名称：</label> <input type="text" name="search.name_like"   class="form-control input-small"  value="${param['search.name_like']}">
      <label>访问地址：</label> <input type="text" name="search.url_like" class="form-control input-small" value="${param['search.url_like']}">
      <button type="submit" class="btn" id="search_btn">查询</button>
    </form>
</div>
<table id="contentTable" class="tablelist table table-striped table-bordered table-hover table-condensed table-advance">
  <thead>
  <tr>
    <th><input type="checkbox"></th>
    <th>id</th>
    <th>名称</th>
    <th>identity</th>
    <th>url</th>
    <th>parentId</th>
    <th>parentIds</th>
    <th>weight</th>
    <th>icon</th>
    <th>hasChildren</th>
    <th>show</th>
    <th>操作</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach items="${page.content}" var="item">
    <tr>
      <td class="check"><input type="checkbox" value="${item.id}"></td>
      <td>${item.id}&nbsp;</td>
      <td>${item.name}&nbsp;</td>
      <td>${item.identity}&nbsp;</td>
      <td>${item.url}&nbsp;</td>
      <td>${item.parentId}&nbsp;</td>
      <td>${item.parentIds}&nbsp;</td>
      <td>${item.weight}&nbsp;</td>
      <td>${item.icon}&nbsp;</td>
      <td>${item.hasChildren}&nbsp;</td>
      <td>${item.show}&nbsp;</td>
      <td>
        <shiro:hasPermission name="user:edit">
          <a href="${ctx}/resource/update/${item.id}" id="editLink-${item.name}" class="btn btn-xs purple">
            <i class="fa fa-edit"></i> 修改
          </a>
          <a href="${ctx}/resource/delete/${item.id}" id="editLink-${item.name}" class="btn default btn-xs black">
            <i class="fa fa-trash-o"></i> 删除</a>
        </shiro:hasPermission>
      </td>
    </tr>
  </c:forEach>
  </tbody>
</table>
<cy:pagination page="${page}" paginationSize="5"></cy:pagination>
</body>
</html>
