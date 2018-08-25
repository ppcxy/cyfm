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
            <div id="content" class="col-lg-4">
                <form action="#" method="post">
                <div class="pro-list-show">
                    <div class="form-group">
                        <label>姓名</label>
                        <input type="input" class="form-control" id="realName" name="realName" maxlength="16" placeholder="姓名" value="${detail.realName}">
                    </div>
                    <hr>
                    <div class="form-group">
                        <label>性别</label>
                        <input type="input" class="form-control" id="gender" name="gender" maxlength="2" placeholder="性别" value="${detail.gender}">
                    </div>
                    <div class="form-group">
                        <label>出生日期</label>
                        <input type="input" class="form-control" id="birthDate" name="birthDate"  data-format="both" placeholder="出生日期" value="${detail.birthDate}">
                    </div>
                    <div class="form-group">
                        <label>省</label>
                        <input type="input" class="form-control" id="province" name="province" maxlength="10" placeholder="省" value="${detail.province}">
                    </div>
                    <div class="form-group">
                        <label>市</label>
                        <input type="input" class="form-control" id="city" name="city" maxlength="20" placeholder="市" value="${detail.city}">
                    </div>
                    <div class="form-group">
                        <label>详细地址</label>
                        <input type="input" class="form-control" id="address" name="address" maxlength="100" placeholder="详细地址" value="${detail.address}">
                    </div>
                    <div class="form-group">
                        <label>邮政编码</label>
                        <input type="input" class="form-control" id="zipCode" name="zipCode" maxlength="10" placeholder="邮政编码" value="${detail.zipCode}">
                    </div>
                    <div class="clearfix"></div>
                    <div class="actions">
                        <button type="submit" class="btn btn-primary pull-right updateBtn">确认修改</button>
                    </div>
                </div>
                </form>
            </div>
        </div>
        <!-- 内容部分结束 -->
        <%@include file="../common/vFooter.jsp"%>
    </div>
   

    <script type="text/javascript">
    </script>
</body>
</html>
