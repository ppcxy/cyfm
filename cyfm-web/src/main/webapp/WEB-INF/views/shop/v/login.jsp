<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@ page import="org.apache.shiro.web.filter.authc.ShopCustomFormAuthenticationFilter" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
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
<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="${ctx}/static/shop/assets/lib/bootstrap/css/bootstrap.css" rel="stylesheet"/>
    <link href="${ctx}/static/shop/assets/css/style.css" rel="stylesheet" />
</head>
<body>
<jsp:include page="../common/vHeader.jsp?open= hover-toggle"/>
    <!--/#header-->
    <div class="container">
        <!-- 内容部分开始 -->



        <!-- 登录模块开始 -->
        <div class="row p30">
            <div class="col-lg-8">
                <!-- 左侧广告位 -->
                <img alt="" src="${ctx}/static/shop/assets/img/advertise/login-ban.gif" />
            </div>
            <div class="col-lg-4">
                <!-- 登录表单开始 -->
                <form role="form" class="login-form f14" action="${ctx}/shop/v/login" method="post" autocomplete="off" onsubmit="return validateVcode()">
                    <div class="form-group">
                        <label for="username">邮箱/用户名/已验证手机</label>
                        <input type="text" class="form-control" id="username" name="username" placeholder="邮箱/用户名/已验证手机" />
                    </div>
                    <div class="form-group">
                        <label for="password">密码</label>
                        <input type="password" class="form-control" id="password" name="password" placeholder="密码" />
                    </div>
                    <div class="form-group">
                        <label for="vcode">验证码</label>
                        <div class="input-group">
                            <input type="text" class="form-control" id="vcode" name="jcaptchaCode" placeholder="验证码">
                            <span class="input-group-addon" style="padding: 0 2px; cursor: pointer">
                                <img id="vcode_img" src="${ctx}/jcaptcha.jpg"  width="100" height="32" alt="验证码" title="点击切换验证码">
                            </span>
                        </div>
                    </div>
                    <div class="checkbox f12">
                        <label>
                            <input type="checkbox" />记住我</label>
                        <span class="pull-right"><a href="findme.aspx">忘记密码？</a>&nbsp;<a href="register.aspx">免费注册</a></span>
                    </div>
                    <button type="submit" class="btn btn-danger btn-block f16">登 录</button>
                   
                </form>
                <!-- 登录表单结束 -->
            </div>
        </div>
        <!-- 登录模块结束 -->


        <%@include file="../common/vFooter.jsp"%>
    </div>

<%
    String error = null;

    Object message = request.getAttribute(ShopCustomFormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
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
    <script type="text/javascript">
        $('#vcode_img').click(function  () {
            $(this).attr('src',  "${ctx}/jcaptcha.jpg");
        });

        function validateVcode() {
            var result = true;
            $.ajax({
                type: 'get',
                url: '${ctx}/jcaptcha-validate',
                async: false,
                data: {field: "验证码", fieldValue: $("#vcode").val()},
                success: function (data) {
                    if (data[1] == 0) {
                        alert(data[2]);
                        result = false;
                    } else {
                        result = true;
                    }

                }
            });
            return result;
        }

    </script>
</body>
</html>
