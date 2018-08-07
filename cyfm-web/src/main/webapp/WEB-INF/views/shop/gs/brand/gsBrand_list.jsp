<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<html>
<head>
  <title>品牌管理</title>
</head>

<body>
 <div class="tools search-toolbar">
   <div class="toolbar-right">
       <form class="form-search form-inline text-right" action="#">
         <div class="form-group">
             <label>品牌名称：</label> <input type="text" name="search.brandName_like"   class="form-control input-small"  value="${param['search.brandName_like']}">
             <button type="submit" class="btn btn-default" id="search_btn">查询</button>
         </div>
       </form>
   </div>
 </div>
<div class="listTableWrap">
    <table id="contentTable" data-tid="brand" class="table table-list table-striped table-bordered table-hover table-condensed table-advance">
        <thead>
        <tr>
            <th class="check"><input type="checkbox"></th>
            <th>品牌名</th>
            <th>产地</th>
            <th>权重（影响排序）</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.content}" var="brand">
            <tr>
                <td class="check"><input name="ids" type="checkbox" value="${brand.id}"></td>
                <td>${brand.brandName}</td>
                <td>${brand.origin}</td>
                <td>${brand.weight}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
 <cy:pagination page="${page}" paginationSize="5"/>
</body>
</html>
