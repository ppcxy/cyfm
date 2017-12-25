<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<html>
<head>
  <title>课程 列表</title>
</head>

<body>
 <div class="tools search-toolbar">
   <div class="toolbar-right">
       <form class="form-search form-inline" action="#">
         <div class="form-group">
             <label>课程名称：</label> <input type="text" name="search.courseName_like"   class="form-control input-small"  value="${param['search.courseName_like']}">
             <label>课程编号：</label> <input type="text" name="search.courseNumber_like"   class="form-control input-small"  value="${param['search.courseNumber_like']}">
             <button type="submit" class="btn btn-default" id="search_btn">查询</button>
         </div>

       </form>
   </div>
 </div>
 
<div class="listTableWrap">
    <table id="contentTable" data-tid="course" class="table table-list table-striped table-bordered table-hover table-condensed table-advance">
        <thead>
        <tr>
            <th class="check"><input type="checkbox"></th>
            <th>课程编号</th>
            <th>课程名称</th>
            <th>课程类型</th>
            <th>课时数</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.content}" var="course">
            <tr>
                <td class="check"><input type="checkbox" value="${course.id}"></td>
                <td>${course.courseNumber}&nbsp;</td>
                <td>${course.courseName}&nbsp;</td>
                <td>${course.courseType}&nbsp;</td>
                <td>${course.coursePeriodCount}&nbsp;</td>
                <cy:listTableActions name="${course.courseName}" id="${course.id}"/>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
 <cy:pagination page="${page}" paginationSize="5"/>
</body>
</html>
