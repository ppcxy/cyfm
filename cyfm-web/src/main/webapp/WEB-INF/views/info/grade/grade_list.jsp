<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<html>
<head>
  <title>年级 列表</title>
</head>

<body>
 <div class="tools search-toolbar">
   <div class="toolbar-right">
       <form class="form-search form-inline" action="#">
         <div class="form-group">
             <label>年级名称：</label> <input type="text" name="search.gradeName_like"   class="form-control input-small"  value="${param['search.gradeName_like']}">
             <button type="submit" class="btn btn-default" id="search_btn">查询</button>
         </div>
       </form>
   </div>
 </div>
 
<div class="listTableWrap">
    <table id="contentTable" data-tid="grade" class="table table-list table-striped table-bordered table-hover table-condensed table-advance">
        <thead>
        <tr>
            <th class="check"><input type="checkbox"></th>
            <th>年级名称</th>
            <th>入学年份</th>
            <th>排序权重</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.content}" var="grade">
            <tr>
                <td class="check"><input type="checkbox" value="${grade.id}"></td>
                <td>${grade.gradeName}&nbsp;</td>
                <td>${grade.enrolYears}&nbsp;</td>
                <td>${grade.weight}&nbsp;</td>
                <cy:listTableActions name="${grade.gradeName}" id="${grade.id}"/>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
 <cy:pagination page="${page}" paginationSize="5"/>
</body>
</html>
