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
            <th>订单号</th>
            <th>商品信息</th>
            <th>下单用户</th>
            <th>下单日期</th>
            <th>订单金额</th>
            <th>订单状态</th>
            <th class="action">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.content}" var="order">
            <tr>
                <td class="check"><input name="ids" type="checkbox" value="${order.id}"></td>
                <td>${order.orderNum}</td>
                <td>${fn:length(order.orderLists)}件商品</td>
                <td><sys:showUsername id="${order.userId}" needLink="false"/></td>
                <td>${order.createDate}</td>
                <td>${order.orderPrice}</td>
                <td>${order.orderStateInfo}</td>
                <td class="action">
                    <a href="${ctx}/shop/order/update/${order.id}" class="btn btn-xs green">查看详情</a>
                    <c:if test="${order.orderReturnState eq '0' && order.orderState eq '0'}">
                        <a href="${ctx}/shop/order/close/${order.id}" class="btn btn-xs red">关闭订单</a>
                    </c:if>
                    <c:if test="${order.orderReturnState  eq '0' && order.orderState eq '1'}">
                        <a href="${ctx}/shop/order/update/${order.id}" class="btn btn-xs blue">发货</a>
                    </c:if>
                    <c:if test="${order.orderReturnState eq '1'}">
                        <a href="${ctx}/shop/order/delete/${order.id}" class="btn btn-xs blue">删除订单</a>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
 <cy:pagination page="${page}" paginationSize="5"/>
<script>
    $(".action a").each(function (i, o) {
        $(this).attr("href", o.href + "?BackURL=" + encodeURIComponent(window.location.href));
    });
</script>
</body>
</html>
