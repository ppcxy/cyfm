<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<html>
<head>
  <title>商品基础信息管理</title>
</head>

<body>
 <div class="tools search-toolbar">
   <div class="toolbar-right">
       <form class="form-search form-inline text-right" action="#">
         <div class="form-group">
             <label>商品基础信息名称：</label> <input type="text" name="search.title_like"   class="form-control input-small"  value="${param['search.title_like']}">
             <button type="submit" class="btn btn-default" id="search_btn">查询</button>
         </div>
       </form>
   </div>
 </div>
<div class="listTableWrap">
    <table id="contentTable" data-tid="baseInfo" class="table table-list table-striped table-bordered table-hover table-condensed table-advance">
        <thead>
        <tr>
            <th class="check"><input type="checkbox"></th>
            <th>分类</th>
            <th>品牌</th>
            <th>名称</th>
            <th>计量单位</th>
            <th>基础单价</th>
            <th class="action">管理</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.content}" var="baseInfo">
            <tr>
                <td class="check"><input name="ids" type="checkbox" value="${baseInfo.id}"></td>
                <td><gs:showTypeName id="${baseInfo.goodsType.id}"/></td>
                <td>${baseInfo.goodsBrand.brandName}</td>
                <td>${baseInfo.title}</td>
                <td>${baseInfo.unit}</td>
                <td>${baseInfo.basePrice}</td>
                <td class="action"><a class="btn btn-xs blue" href="${ctx}/shop/gs/spec?goodsBaseInfoId=${baseInfo.id}&search.goodsBaseInfo.id_eq=${baseInfo.id}">规格管理</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
 <cy:pagination page="${page}" paginationSize="5"/>
</body>
</html>
