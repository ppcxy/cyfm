<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<html>
<head>
    <title>订单支付</title>
</head>
<body>
<div style="margin-top:5px;min-width: 800px;" class="col-md-10 col-lg-offset-1 col-lg-6 col-lg-offset-3">
    <div>
        <h2>
        订单信息：[${order.orderNum}] ${order.title}
        </h2>
    </div>
    <form id="payForm" method="post" action="${ctx}/shop/order/pay">
        <input type="hidden" name="orderNum" value="${order.orderNum}">
        <strong>选择银行：</strong>
        <p>
            <br/>
            <input type="radio" name="pd_FrpId" value="ICBC-NET-B2C" checked="checked" />工商银行
            <img src="${ctx}/static/shop/bank_img/icbc.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="radio" name="pd_FrpId" value="BOC-NET-B2C" />中国银行
            <img src="${ctx}/static/shop/bank_img/bc.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="radio" name="pd_FrpId" value="ABC-NET-B2C" />农业银行
            <img src="${ctx}/static/shop/bank_img/abc.bmp" align="middle" />
            <br/>
            <br/>
            <input type="radio" name="pd_FrpId" value="BOCO-NET-B2C" />交通银行
            <img src="${ctx}/static/shop/bank_img/bcc.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="radio" name="pd_FrpId" value="PINGANBANK-NET" />平安银行
            <img src="${ctx}/static/shop/bank_img/pingan.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="radio" name="pd_FrpId" value="CCB-NET-B2C" />建设银行
            <img src="${ctx}/static/shop/bank_img/ccb.bmp" align="middle" />
            <br/>
            <br/>
            <input type="radio" name="pd_FrpId" value="CEB-NET-B2C" />光大银行
            <img src="${ctx}/static/shop/bank_img/guangda.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="radio" name="pd_FrpId" value="CMBCHINA-NET-B2C" />招商银行
            <img src="${ctx}/static/shop/bank_img/cmb.bmp" align="middle" />

        </p>
    </form>
    <hr/>
    <p style="text-align:right;margin-right:100px;">
        <a href="javascript:document.getElementById('payForm').submit();">
            <img src="${ctx}/static/shop/finalbutton.gif" width="204" height="51" border="0" />
        </a>
    </p>
    <hr/>

</div>
</body>
</html>
