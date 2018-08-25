<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>我的订单</title>
    <link href="${ctx}/static/plugins/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/shop/assets/lib/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="${ctx}/static/shop/assets/css/style.css" rel="stylesheet" />
    <link type="image/x-icon" href="${ctx}/static/images/favicon.ico" rel="shortcut icon">
    <style>
        .nav-status ul {
            list-style: none;
            margin-bottom: 0px
        }
        .nav-status ul li {
            font-size: 18px;
            float: left;
            margin-right: 8px;
        }
        div.order-header{
            border: 1px solid #e0e0e0;
            background: #eee;
            height: 40px;
            vertical-align: center;
        }
        div.order-header table{
            width: 100%;
        }
        div.order-header table td {
            padding-top: 8px;
            font-size: 14px;
            text-align: center;
        }
        div.order-item{
            margin-top: 10px;
            border: 1px solid #daf3ff;
        }
        div.order-item .order-item-header {
            height: 40px;
            padding-top: 8px;
            font-size: 14px;
            background: #eaf8ff;
            padding-left: 8px;
        }
        div.order-item table{
            width: 100%;
        }
        div.order-item table{
            width: 100%;
        }

        div.order-item table tr{
            height: 88px;
        }
        div.order-item table tr:not(:last-child) td.hang{
            padding-left: 8px;
            border-bottom: 1px solid #daf3ff;
            vertical-align:text-top;padding-top: 33px;
        }
        div.order-item table td.lie{
            padding-left: 8px;
            border-left: 1px solid #daf3ff;
            vertical-align:text-top;padding-top: 33px;
        }
        div.order-item table td:last-child{
            border-right: 0;
        }


    </style>
    <style>
        div.pagin{
            margin-top: 5px;
            font-size: 16px;
            float: right;
            padding-right: 8px;
        }

        div.pagin ul{
            list-style: none;
        }

        div.pagin ul li{
            float: left;
        }
        .pagin .paginList .paginItem a.disabled i {
            color: #cccccc;
        }
        .pagin .paginList .paginItem:first-child a {
            border-left: 1px solid #DDD;
        }
        .pagin .paginList .paginItem a {
            float: left;
            width: 27px;
            height: 26px;
            border: 1px solid #DDD;
            text-align: center;
            line-height: 25px;
            border-left: none;
            color: #3399d5;
        }
    </style>
    <script src="${ctx}/static/plugins/jquery/jquery-1.9.1.min.js" type="text/javascript"></script>
</head>
<body>
<jsp:include page="../common/vHeader.jsp?open= hover-toggle"/>
    <div class="container">
        <div class="row">
            <h3 class="member-tit f16 fb tit-family">我的订单</h3>
        </div>
        <div class="row">
            <!-- 左边栏 -->
            <%@include file="member_left.jsp"%>
            <!-- 内容部分开始 -->
            <div id="content" class="col-lg-10">
                <c:if test="${not empty message or not empty error}">
                    <cy:showMessage/>
                </c:if>
                <div class="nav-status">
                    <ul>
                        <li><a href="${ctx}/shop/member/order">所有订单</a></li>
                        <li>|</li>
                        <li><a href="${ctx}/shop/member/order?search.orderState_eq=0">待付款</a></li>
                        <li>|</li>
                        <li><a href="${ctx}/shop/member/order?search.orderState_eq=1">待发货</a></li>
                        <li>|</li>
                        <li><a href="${ctx}/shop/member/order?search.orderState_eq=2">待收货</a></li>
                    </ul>
                </div>
                <div class="clearfix"></div>
                <div class="order-header">
                   <table>
                       <tbody>
                           <td width="30%">商品</td>
                           <td width="10%">单价</td>
                           <td width="10%">数量</td>
                           <td width="10%">实付款</td>
                           <td width="15%">交易状态</td>
                           <td width="15%">交易操作</td>
                       </tbody>
                   </table>
                </div>
                <div class="order-data">
                    <c:if test="${empty page.content}">
                        <div class="order-item">
                            <div class="order-item-header"><b></div>
                            <div>
                                <table>
                                    <tbody>
                                        <tr>
                                            <td colspan="6" align="center">暂无订单</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </c:if>
                    <c:forEach items="${page.content}" var="o">
                        <div class="order-item">
                            <div class="order-item-header"><b><fmt:formatDate value="${o.createDate}"></fmt:formatDate></b> 订单号: ${o.orderNum}</div>
                            <div>
                                <table>
                                    <tbody>
                                    <c:forEach var="g" items="${o.orderLists}" varStatus="s">
                                           <tr>
                                               <td width="30%" align="center" class="hang"><a href="${ctx}/shop/v/detail/${g.goodsBaseInfoId}">${g.title}</a></td>
                                               <td width="10%" align="center" class="hang">￥<fmt:formatNumber value="${g.price/g.goodsAmount}"/></td>
                                               <td width="10%" align="center" class="hang">${g.goodsAmount}</td>
                                               <c:if test="${s.index eq 0}">
                                               <td width="10%" align="center" class="lie" rowspan="${fn:length(o.orderLists)}">￥<fmt:formatNumber value="${o.orderPrice}"/></td>
                                               <td width="15%" align="center" class="lie" rowspan="${fn:length(o.orderLists)}">${o.orderStateInfo}</td>
                                                   <td width="15%" align="center" class="lie" rowspan="${fn:length(o.orderLists)}">
                                                       <c:if test="${o.orderState eq '0'}">
                                                           <button class="btn btn-xs btn-primary" onclick="goPay('${o.orderNum}')">付款</button>
                                                       </c:if>
                                                       <c:if test="${o.orderState eq '2'}">
                                                           <button class="btn btn-xs btn-primary" onclick="showOrderInfo('${o.id}')">订单信息</button>
                                                           <button class="btn btn-xs btn-danger">确认收货</button>
                                                   </c:if>
                                               </td>
                                               </c:if>
                                           </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <cy:pagination page="${page}" showMeg="false" paginationSize="5"/>
            </div>
        </div>
        <!-- 内容部分结束 -->
        <%@include file="../common/vFooter.jsp"%>
    </div>
   

    <script type="text/javascript">
        $('#vcode_img').click(function  () {
            $(this).attr('src',  $(this).data('src')+'?'+ Math.random());
        });


        function showOrderInfo(orderId) {
            top.layer.open({
                type: 2,
                title: '',
                shadeClose: false,
                shade: 0.3,
                maxmin: true, //开启最大化最小化按钮
                area: ['550px', '500px'],
                content: '${ctx}/shop/order/update/' + orderId
            });
        }

        function goPay(orderNum) {
            window.open("${ctx}/shop/order/goPay?orderNum=" + orderNum);
        }
    </script>
</body>
</html>
