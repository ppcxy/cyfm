<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<html>
<head>
  <title>班级 列表</title>
</head>

<body>
 <div class="tools search-toolbar">
   <div class="toolbar-right">
       <form class="form-search form-inline" action="#">
         <div class="form-group">
             <label>班级名称：</label> <input type="text" name="search.classesName_like"   class="form-control input-small"  value="${param['search.classesName_like']}">
             <button type="submit" class="btn btn-default" id="search_btn">查询</button>
         </div>
       </form>
   </div>
 </div>
<div class="listTableWrap">
    <table id="contentTable" data-tid="classes" class="table table-list table-striped table-bordered table-hover table-condensed table-advance">
        <thead>
        <tr>
            <th class="check"><input type="checkbox"></th>
            <th>班级名称</th>
            <th>班级专业</th>
            <th>班级年级</th>
            <th>班级人数</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.content}" var="classes">
            <tr>
                <td class="check"><input type="checkbox" value="${classes.id}"></td>
                <td>${classes.classesName}&nbsp;</td>
                <td>${classes.major.majorName}&nbsp;</td>
                <td>${classes.grade.gradeName}&nbsp;</td>
                <td>${classes.enrollment}&nbsp;</td>
                <cy:listTableActions name="${classes.classesName}" id="${classes.id}"/>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
 <cy:pagination page="${page}" paginationSize="5"/>
</body>
</html>
