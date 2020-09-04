<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<html>
<head>
  <title><sys:showRtLevelName level='2' defaultName='工作组' suffix="管理"/></title>
</head>

<body>
 <div class="tools search-toolbar">
   <div class="toolbar-right">
       <form class="form-search form-inline text-right" action="#">
           <div class="form-group">
               <label>名称：<input type="text" name="search.name_like" placeholder="模糊匹配" class="form-control input-small"
                                  value="${param['search.name_like']}"></label>
           </div>
           <div class="form-group">
               <label><button type="submit" class="btn btn-default" id="search_btn">查询</button></label>
           </div>
       </form>
   </div>
 </div>
<div class="listTableWrap">
    <table id="contentTable" data-tid="${modelName}" class="table table-list table-sort table-striped table-bordered table-hover table-condensed table-advance">
        <thead>
        <tr>
            <th class="check"><input type="checkbox"></th>
            <th data-sort="name">团队</th>
            <th data-sort="name">名称</th>
            <th>管理者</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.content}" var="work">
            <tr>
                <td class="check"><input name="ids" type="checkbox" value="${work.id}"></td>
                <td>${work.team.name}</td>
                <td>${work.name}</td>
                <td>${work.master.showName}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
 <cy:pagination page="${page}" paginationSize="5"/>
</body>
</html>
