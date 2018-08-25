<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>个人中心</title>
    <link href="${ctx}/static/shop/assets/lib/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="${ctx}/static/shop/assets/css/style.css" rel="stylesheet" />
</head>
<body>
<jsp:include page="../common/vHeader.jsp?open= hover-toggle"/>
    <div class="container">
        <!-- 内容部分开始 -->

        <div class="row">
            <h3 class="member-tit f16 fb tit-family">我的商城</h3>
        </div>
        <div class="row">
            <%@include file="member_left.jsp"%>
            <!-- 内容部分开始 -->
            <div id="content" class="col-lg-10">
                <div class="meb-content">
                    <div class="meb-avatar pull-left">
                        <img alt="" src="${ctx}/static/shop/assets/img/admin.png" />
                    </div>
                    <div class="meb-infor pull-right">
                        <div class="meb-infor-title mb10"><b class="orange-font f14"><shiro:principal property="username"/></b>&nbsp;&nbsp;欢迎您!</div>
                        <div class="account-security mb10">
                            账户安全：<b class="orange-font">中级</b> <i class="icon-main icon-security-4"></i>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <!-- 内容部分结束 -->
        <%@include file="../common/vFooter.jsp"%>
    </div>
</body>
</html>
