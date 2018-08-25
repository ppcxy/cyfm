<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>我的收藏</title>
    <link href="${ctx}/static/plugins/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/shop/assets/lib/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="${ctx}/static/shop/assets/css/style.css" rel="stylesheet" />
    <link type="image/x-icon" href="${ctx}/static/images/favicon.ico" rel="shortcut icon">
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
                <div class="pro-list-show">
                    <ul>
                        <c:forEach items="${favorites}" var="f">
                            <c:set var="g" value="${f.goodsBaseInfo}"/>
                            <li>
                                <a href="${ctx}/shop/v/detail/${g.id}">
                                    <img class="center-block" alt="" src="${g.firstPic}" /></a>
                                <div class="summary"><a href="">${g.title}</a></div>
                                <div class="price"><span class="pull-right red-font"></span><b>${g.basePrice}</b></div>
                                <div class="list-show-eva"><a href="">推荐指数</a>：<i class="icon-main icon-eva-6"></i>（${g.suggest}）</div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
        <!-- 内容部分结束 -->
        <%@include file="../common/vFooter.jsp"%>
    </div>
</body>
</html>
