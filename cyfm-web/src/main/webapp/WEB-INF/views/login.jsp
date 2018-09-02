<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf" %>
<script>
    ctx = _ctx = "${ctx}"
    if (top != window) {
        top.location.href = "${ctx}/";
    }
</script>
<%
    if (SecurityUtils.getSubject().isAuthenticated()) {
        if ("".equals(request.getContextPath())) {
            response.sendRedirect("/");
        } else {
            response.sendRedirect(request.getContextPath());
        }
    }
%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8"/>
    <title>登录页面</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8">
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN PAGE LEVEL STYLES -->
    <link href="${ctx}/static/manage/css/login-soft.css" rel="stylesheet" type="text/css"/>
    <!-- END PAGE LEVEL SCRIPTS -->
    <!-- BEGIN THEME STYLES -->
    <link href="${ctx}/static/common/styles/components.css" id="style_components" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/common/styles/plugins.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/manage/css/layout.css?2" rel="stylesheet" type="text/css"/>
    <link id="style_color" href="${ctx}/static/manage/css/darkblue.css?2" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/common/styles/custom.css" rel="stylesheet" type="text/css"/>
    <!-- END THEME STYLES -->
    <link rel="shortcut icon" href="favicon.ico"/>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="login">
<!-- BEGIN LOGO -->
<div class="logo">
    <a href="index.html">
        <%--<img src="../../assets/admin/layout/img/logo-big.png" alt=""/>--%>
    </a>
</div>
<!-- END LOGO -->
<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
<div class="menu-toggler sidebar-toggler">
</div>
<!-- END SIDEBAR TOGGLER BUTTON -->
<!-- BEGIN LOGIN -->
<div class="content">

    <!-- BEGIN LOGIN FORM -->
    <cy:showMessage/>
    <form class="login-form" action="${ctx}/login" method="post">
        <h3 class="form-title">登录您的账号</h3>
        <%
            String error = null;

            Object message = request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
            if(message instanceof Exception){
                error = ((Exception) message).getMessage();
            } else {
                error = (String) message;
            }

            if(error != null){
        %>
        <%--<div class="alert alert-error controls input-large">--%>
        <%--<button class="close" data-dismiss="alert">×</button>--%>

        <div class="alert alert-danger display">
            <button class="close" data-close="alert"></button>
            <span>
			<%
                if(error.contains("DisabledAccountException")){
                    out.print("用户已被屏蔽,请登录其他用户.");
                }
                else{
                    out.print(error);
                }
            %>. </span>
        </div>
        <%--</div>--%>
        <%
            }
        %>
        <div class="form-group">
            <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
            <label class="control-label visible-ie8 visible-ie9">Username</label>
            <div class="input-icon">
                <i class="fa fa-user"></i>
                <input class="form-control placeholder-no-fix required" type="text" autocomplete="off" placeholder="账号/Email/手机号" id="username" name="username"/>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">Password</label>
            <div class="input-icon">
                <i class="fa fa-lock"></i>
                <input class="form-control placeholder-no-fix required" type="password" autocomplete="off" placeholder="登录密码" id="password" name="password"/>
            </div>
        </div>
        <div class="form-actions">
            <label class="checkbox">
                <input type="checkbox" name="remember" value="1"/> 记住登录 </label>
            <button type="submit" class="btn blue pull-right">
                登录 <i class="m-icon-swapright m-icon-white"></i>
            </button>
        </div>
    </form>
    <!-- END LOGIN FORM -->
</div>
<!-- END LOGIN -->
<!-- BEGIN COPYRIGHT -->
<div class="copyright">
    <a href="http://www.ppcxy.com">ppcxy.com</a> 欢迎使用并反馈问题。
</div>
<!-- END COPYRIGHT -->
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
<script src="${ctx}/static/plugins/respond.min.js"></script>
<script src="${ctx}/static/plugins/excanvas.min.js"></script>
<![endif]-->
<script src="${ctx}/static/plugins/jquery/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="${ctx}/static/plugins/jquery/jquery-migrate.min.js" type="text/javascript"></script>
<script src="${ctx}/static/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${ctx}/static/plugins/jquery.blockUI.js" type="text/javascript"></script>
<script src="${ctx}/static/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<script src="${ctx}/static/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="${ctx}/static/plugins/jquery-validation/1.15.0/jquery.validate.js" type="text/javascript"></script>
<script src="${ctx}/static/plugins/backstretch/jquery.backstretch.min.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="${ctx}/static/manage/js/metronic.js" type="text/javascript"></script>
<script src="${ctx}/static/manage/js/layout.js" type="text/javascript"></script>
<script src="${ctx}/static/manage/js/login-soft.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
    jQuery(document).ready(function() {
        Metronic.init(); // init metronic core components
        Layout.init(); // init current layout
        Login.init();
        // init background slide images
        $.backstretch([
                _ctx+"/static/manage/img/media/bg/1.jpg",
                _ctx+"/static/manage/img/media/bg/2.jpg",
                _ctx+"/static/manage/img/media/bg/3.jpg",
                _ctx+"/static/manage/img/media/bg/4.jpg"
            ], {
                fade: 1000,
                duration: 8000
            }
        );

        $("#username").focus();
    });
</script>

<%--<div class="alert alert-error controls input-large">--%>
<%--<button class="close" data-dismiss="alert">×</button>--%>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
