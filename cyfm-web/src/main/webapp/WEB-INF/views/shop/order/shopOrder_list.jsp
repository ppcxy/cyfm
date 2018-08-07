<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<html>
<head>
  <title>订单管理</title>
</head>

<body>
 <div class="tools search-toolbar">
   <div class="toolbar-right">
       <form class="form-search form-inline text-right" action="#">
         <div class="form-group">
             <label>订单状态：</label>
             <select name="search.orderState_eq" class="form-control input-small hidden">
                 <option value="">全部</option>
                 <option value="dfk">待付款</option>
                 <option value="dfh">待发货</option>
                 <option value="dqs">待签收</option>
                 <option value="ywc">已完成</option>
             </select>
             <script>
                 $("[name='search.orderState_eq']").val("${param['search.orderState_eq']}")
             </script>
             <button type="submit" class="btn btn-default" id="search_btn">查询</button>
         </div>
       </form>
   </div>
 </div>
<div class="listTableWrap">
    <table id="contentTable" data-tid="order" class="table table-list table-striped table-bordered table-hover table-condensed table-advance">
        <thead>
        <tr>
            <th class="check"><input type="checkbox"></th>
            <th>订单</th>
            <th>订单价格</th>
            <th>下单日期</th>
            <th>订单状态</th>
            <th>退货状态</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.content}" var="order">
            <tr>
                <td class="check"><input name="ids" type="checkbox" value="${order.id}"></td>
                <td>${order.title}-${order.goodsSpecIdsnfo}</td>
                <td>${order.orderPrice}</td>
                <td>${order.createDate}</td>
                <td>${order.createState}</td>
                <td>${order.returnState}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
 <cy:pagination page="${page}" paginationSize="5"/>
</body>
</html>
