<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<html>
<head>
  <title>专业 列表</title>
</head>

<body>
 <div class="tools search-toolbar">
   <div class="toolbar-right">
       <form class="form-search form-inline" action="#">
         <div class="form-group">
             <label>专业名称：</label> <input type="text" name="search.majorName_like"   class="form-control input-small"  value="${param['search.majorName_like']}">
             <button type="submit" class="btn btn-default" id="search_btn">查询</button>
         </div>
       </form>
   </div>
 </div>

<div class="listTableWrap">
    <table id="contentTable" data-tid="major" class="table table-list table-striped table-bordered table-hover table-condensed table-advance">
        <thead>
        <tr>
            <th class="check"><input type="checkbox"></th>
            <th>专业分类</th>
            <th>专业编号</th>
            <th>专业名称</th>
            <th>排序权重</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.content}" var="major">
            <tr>
                <td class="check"><input type="checkbox" value="${major.id}"></td>
                <td>${major.majorType}&nbsp;</td>
                <td>${major.majorNumber}&nbsp;</td>
                <td>${major.majorName}&nbsp;</td>
                <td>${major.weight}&nbsp;</td>
                <cy:listTableActions name="${major.majorName}" id="${major.id}"/>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
 <cy:pagination page="${page}" paginationSize="5"/>
</body>
</html>
