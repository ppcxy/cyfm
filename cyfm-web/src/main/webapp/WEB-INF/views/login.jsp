<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf" %>
<script>
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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>登录页面</title>
    <style>
        *{
            box-sizing: content-box;
            -moz-box-sizing: content-box;
            -webkit-box-sizing: content-box;
        }
        body {
            background-color: #1c77ac;
            background-image: url(${ctx}/static/manage/images/light.png);
            background-repeat: no-repeat;
            background-position: center top;
            overflow: hidden;
        }
    </style>
    <link href="${ctx}/static/manage/css/style.css" rel="stylesheet" type="text/css"/>
    <script src="${ctx}/static/plugins/jquery/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="${ctx}/static/manage/js/cloud.js" type="text/javascript"></script>

    <script language="javascript">
        $(function () {
            $('.loginbox').css({'position': 'absolute', 'left': ($(window).width() - 692) / 2});
            $(window).resize(function () {
                $('.loginbox').css({'position': 'absolute', 'left': ($(window).width() - 692) / 2});
            });

            setTimeout(function(){
                $(":input").attr("disabled", false).eq(0).focus();
            },0)
        });

    </script>

</head>
<body class="login-page">
<div id="mainBody">
    <div id="cloud1" class="cloud"></div>
    <div id="cloud2" class="cloud"></div>
</div>
<div class="logintop">
    <span>欢迎登陆天翔统一数据平台</span>
    <ul>
        <li><a href="${ctx}/">回首页</a></li>
        <li><a href="#">帮助</a></li>
        <li><a href="#">关于</a></li>
    </ul>
</div>
<div class="loginbody">
    <span class="systemlogo"></span>
    <div class="loginbox">
        <form id="loginForm" action="${ctx}/login" method="post" autocomplete="off">
        <%--
            &lt;%&ndash;&lt;%&ndash;dash;%&gt;
            &lt;%&ndash;Object object = request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);&ndash;%&gt;
            &lt;%&ndash;if (object != null) {&ndash;%&gt;
            &lt;%&ndash;if (object instanceof Exception) {&ndash;%&gt;
            &lt;%&ndash;Exception exception = (Exception)object;&ndash;%&gt;
            &lt;%&ndash;exception.printStackTrace();&ndash;%&gt;
            &lt;%&ndash;} else {&ndash;%&gt;
            &lt;%&ndash;System.out.println(object);&ndash;%&gt;
            &lt;%&ndash;}&ndash;%&gt;
            &lt;%&ndash;}&ndash;%&gt;
            &lt;%&ndash;dash;%&gt;&ndash;%&gt;
            &lt;%&ndash;&lt;%&ndash;dash;%&gt;
            &lt;%&ndash;String error = (String) request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);&ndash;%&gt;
            &lt;%&ndash;if(error != null){&ndash;%&gt;
            &lt;%&ndash;dash;%&gt;&ndash;%&gt;
            &lt;%&ndash;<div class="alert alert-error controls input-large">&ndash;%&gt;
            &lt;%&ndash;<button class="close" data-dismiss="alert">×</button>&ndash;%&gt;
            &lt;%&ndash;&lt;%&ndash;dash;%&gt;
            &lt;%&ndash;if(error.contains("DisabledAccountException")){&ndash;%&gt;
            &lt;%&ndash;out.print("用户已被屏蔽,请登录其他用户.");&ndash;%&gt;
            &lt;%&ndash;}&ndash;%&gt;
            &lt;%&ndash;else{&ndash;%&gt;
            &lt;%&ndash;out.print("登录失败，请重试.");&ndash;%&gt;
            &lt;%&ndash;}&ndash;%&gt;
            &lt;%&ndash;dash;%&gt;&ndash;%&gt;
            &lt;%&ndash;</div>&ndash;%&gt;
            &lt;%&ndash;&lt;%&ndash;dash;%&gt;
            &lt;%&ndash;}&ndash;%&gt;
            &lt;%&ndash;dash;%&gt;&ndash;%&gt;
            <div class="control-group">
                <label for="username" class="control-label">名称:</label>
                <div class="controls">
                    <input type="text" id="username" name="username" value="${username}" class="input-medium required"/>
                </div>
            </div>
            <div class="control-group">
                <label for="password" class="control-label">密码:</label>
                <div class="controls">
                    <input type="password" id="password" name="password" class="input-medium required"/>
                </div>
            </div>
            <c:if test="${jcaptchaEbabled}">
                <div class="control-group">
                    <label for="jcaptchaCode">验证码</label>
                    <div class="input-prepend">
                        <span class="add-on icon-circle-blank"></span>
                        <input type="text" id="jcaptchaCode" name="jcaptchaCode"
                               class="input-medium validate[required,ajax[ajaxJcaptchaCall]]" placeholder="请输入验证码">
                    </div>
                    <img class="jcaptcha-btn jcaptcha-img" style="margin-left: 10px;" src="${ctx}/jcaptcha.jpg"
                         title="点击更换验证码">
                    <a class="jcaptcha-btn btn btn-link">换一张</a>
                </div>
            </c:if>

            <div class="control-group">
                <div class="controls">
                    <label class="checkbox inline" for="rememberMe"> <input type="checkbox" id="rememberMe"
                                                                            name="rememberMe"/> 记住我</label>
                    <input id="submit_btn" class="btn" type="submit" value="登录"/>
                    <p class="help-block">(管理员：<b>admin/admin</b>, 普通用户：<b>user/user</b>)</p>
                </div>
            </div>
        --%>
        <ul>
            <li>
                <input type="text" id="username" name="username" value="${username}" class="loginuser required" autocomplete="off" disabled/>
            </li>
            <li>
                <input style="display:none">
                <input type="password" id="password" name="password" class="loginpwd required" autocomplete="off" disabled/>
            <li>
            <input type="submit" class="loginbtn" value="登录" id="submit_btn"/>
            <label><input name="rememberMe" id="rememberMe" type="checkbox" value="true"/>记住登录</label><label><a href="#">忘记密码？</a></label></li>
        </ul>
    </form>

    </div>

</div>


<div class="loginbm">版权所有 2013 <a href="http://www.ppcxy.com">ppcxy.com</a> 仅供学习交流，勿用于任何商业用途</div>

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

<script>
    $(function () {
        <%
            if(error.contains("DisabledAccountException")){
                out.print("alert('用户已被屏蔽,请登录其他用户.')");
            }
            else{
                out.print("alert('"+error+"')");
            }
        %>
    })
</script>
<%--</div>--%>
<%
    }
%>
</body>

</html>

