<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="${ctx}/static/plugins/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/shop/assets/lib/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="${ctx}/static/shop/assets/css/style.css" rel="stylesheet" />
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
        div.order-item table td{
            padding-left: 8px;
            border-right: 1px solid #daf3ff;
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
                <div class="nav-status">
                    <ul>
                        <li>所有订单</li>
                        <li>|</li>
                        <li>待付款</li>
                        <li>|</li>
                        <li>待发货</li>
                        <li>|</li>
                        <li>待收货</li>
                        <li>|</li>
                        <li>待评价</li>
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
                    <c:forEach items="${page.content}" var="o">
                        <div class="order-item">
                            <div class="order-item-header"><b><fmt:formatDate value="${o.createDate}"></fmt:formatDate></b> 订单号: ${o.orderNum}</div>
                            <div>
                                <table>
                                    <tbody>
                                    <td width="30%">${o.title}</td>
                                    <td width="10%"><fmt:formatNumber value="${o.orderPrice/o.goodsAmount}"/></td>
                                    <td width="10%">${o.goodsAmount}</td>
                                    <td width="10%"><fmt:formatNumber value="${o.orderPrice}"/></td>
                                    <td width="15%">${o.orderState}</td>
                                    <td width="15%">xxxxx</td>
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
    </script>
</body>
</html>
