<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<html>
<head>
  <title>商品规格管理</title>
</head>

<body>
 <div class="tools search-toolbar">
   <div class="toolbar-right">
       <form class="form-search form-inline text-right" action="#">
         <div class="form-group">
             <input type="text" name="search.specGroup_like" value="${param['search.specGroup_like']}">
             <input type="hidden" name="goodsBaseInfoId" value="${param['goodsBaseInfoId']}">
             <input type="hidden" name="search.goodsBaseInfo.id_eq" value="${param['search.goodsBaseInfo.id_eq']}">
         </div>
       </form>
   </div>
 </div>
<div class="listTableWrap">
    <table id="contentTable" data-tid="spec" class="table table-list table-striped table-bordered table-hover table-condensed table-advance">
        <thead>
        <tr>
            <th class="check"><input type="checkbox"></th>
            <th>商品</th>
            <th>规格分组</th>
            <th>规格标题</th>
            <th>规格详细信息</th>
            <th>基础价格调整</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.content}" var="spec">
            <tr>
                <td class="check"><input name="ids" type="checkbox" value="${spec.id}"></td>
                <td>${spec.goodsBaseInfo.title}</td>
                <td>${spec.specGroup}</td>
                <td>${spec.specTitle}</td>
                <td>${spec.specInfo}</td>
                <td>${spec.price}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
 <cy:pagination page="${page}" paginationSize="5"/>
<script>
    $("a.btn.create").attr("href","${ctx}/${viewPrefix}/create?goodsBaseInfoId=${param['goodsBaseInfoId']}");
    $("a.btn.update").data("baseurl","${ctx}/shop/gs/spec/update/{id}?goodsBaseInfoId=${param['goodsBaseInfoId']}");
</script>
</body>
</html>
