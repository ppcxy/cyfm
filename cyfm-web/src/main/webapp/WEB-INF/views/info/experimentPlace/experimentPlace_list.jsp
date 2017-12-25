<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<html>
<head>
  <title>实验场地 列表</title>
</head>

<body>
 <div class="tools search-toolbar">
   <div class="toolbar-right">
       <form class="form-search form-inline" action="#">
         <div class="form-group">
             <label>实验场地名称：</label> <input type="text" name="search.placeName_like"   class="form-control input-small"  value="${param['search.placeName_like']}">
             <button type="submit" class="btn btn-default" id="search_btn">查询</button>
         </div>
       </form>
   </div>
 </div>
<div class="listTableWrap">
    <table id="contentTable" data-tid="plan" class="table table-list table-striped table-bordered table-hover table-condensed table-advance">
        <thead>
        <tr>
            <th class="check"><input type="checkbox"></th>
            <th>实验场地名称</th>
            <th>实验场地描述</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.content}" var="plan">
            <tr>
                <td class="check"><input type="checkbox" value="${plan.id}"></td>
                <td>${plan.placeName}&nbsp;</td>
                <td>${plan.placeInfo}&nbsp;</td>
                <cy:listTableActions name="${plan.placeName}" id="${plan.id}"/>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
 <cy:pagination page="${page}" paginationSize="5"/>
</body>
</html>
