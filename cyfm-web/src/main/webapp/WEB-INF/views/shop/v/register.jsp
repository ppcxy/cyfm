<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="${ctx}/static/shop/assets/lib/bootstrap/css/bootstrap.css" rel="stylesheet"/>
    <link href="${ctx}/static/shop/assets/css/style.css" rel="stylesheet"/>
</head>
<body>
<jsp:include page="../common/vHeader.jsp?open= hover-toggle"/>
    <div class="container">
        <!-- 内容部分开始 -->

        <!-- 注册模块开始 -->
        <div class="row p30">
            <div class="col-lg-8">
                <!-- 左侧广告位 -->
                <img alt="" src="${ctx}/static/shop/assets/img/advertise/login-ban.gif" />
            </div>
            <div class="col-lg-4">
                <!-- 注册表单开始 -->
                <form role="form" action="#" method="post" class="login-form f14" onsubmit="return validate()">
                    <div class="form-group">
                        <label for="username">用户名</label>
                        <input type="text" class="form-control" id="username" name="username" maxlength="20" placeholder="用户">
                    </div>
                    <div class="form-group">
                        <label for="username">电子邮箱</label>
                        <input type="email" class="form-control" id="email" name="email" maxlength="88" placeholder="邮箱">
                    </div>
                    <div class="form-group">
                        <label for="username">手机</label>
                        <input type="text" class="form-control" id="tel" name="tel" maxlength="11" placeholder="手机">
                    </div>
                    <div class="form-group">
                        <label for="password">密码</label>
                        <input type="password" class="form-control" id="password" name="password" maxlength="20" placeholder="密码">
                    </div>
                    <div class="form-group">
                        <label for="confirmPassword">确认密码</label>
                        <input type="password" class="form-control" id="confirmPassword" name="plainPassword" placeholder="确认密码">
                    </div>
                    <div class="form-group">
                        <label for="vcode">验证码</label>
                        <div class="input-group">
                            <input type="text" class="form-control" id="vcode" name="vcode" placeholder="验证码">
                            <span class="input-group-addon" style="padding:0 2px;cursor:pointer">
                                <img id="vcode_img" src="${ctx}/jcaptcha.jpg" data-src="/handler/verify.ashx" width="100" height="32" alt="验证码" title="点击切换验证码">
                            </span>
                        </div>
                    </div>
                    <div class="checkbox f12">
                        <label>
                            <input type="checkbox">
                            我已阅读并同意 &nbsp;<span class="blue-font"><a href="">《用户注册协议》</a></span>
                        </label>
                    </div>
                    <button type="submit" class="btn btn-danger btn-block f16">立即注册</button>
                </form>
                <!-- 注册表单结束 -->
            </div>
        </div>
        <!-- 注册模块结束 -->


        <!-- 内容部分结束 -->
        <%@include file="../common/vFooter.jsp"%>
    </div>
    <script type="text/javascript">
        /**
         * 错误重定向到注册页面，显示错误信息
         */
        if ('${param[error]}'==='0'){
            alert("未知原因注册失败，请重试.")
        }
        /**
         * 点击验证码图片切换验证密码
         */
        $('#vcode_img').click(function  () {
            $(this).attr('src',  "${ctx}/jcaptcha.jpg");
        });

        /**
         * 验证密码验证码和注册信息是否重复
         * @returns {*|boolean}
         */
        function validate() {
            return validatePassword() && validateVcode() && validateIdentity();
        }

        /**
         * 验证注册身份信息是否被使用
         * @returns {boolean}
         */
        function validateIdentity() {

            var result = true;

            if ( $("#username").val()==""){
                alert("用户名必须填写");
                return false;
            }
            $.ajax({
                type: 'get',
                url: '${ctx}/shop/v/register/checkUsername',
                async: false,
                data: {"username": $("#username").val()},
                success: function (data) {
                    result = data;
                }
            });
            if (!result) {
                alert("用户名已被使用，请修改。");
                return false
            }

            if ( $("#email").val()==""){
                alert("电子邮箱必须填写");
                return false;
            }
            $.ajax({
                type: 'get',
                url: '${ctx}/shop/v/register/checkEmail',
                async: false,
                data: {"email": $("#email").val()},
                success: function (data) {
                    result = data;
                }
            });
            if (!result) {
                alert("电子邮箱已被使用，请修改。");
                return false
            }

            if ( $("#tel").val()==""){
                alert("手机必须填写");
                return false;
            }
            $.ajax({
                type: 'get',
                url: '${ctx}/shop/v/register/checkTel',
                async: false,
                data: {"tel": $("#tel").val()},
                success: function (data) {
                    result = data;
                }
            });
            if (!result){
                alert("手机已被使用，请修改。");
                return false;
            }

            return true;

        }

        /**
         * 验证两次密码输入是否一致
         * @returns {boolean}
         */
        function validatePassword() {
            return $("#password").val() == $("#confirmPassword").val();
        }

        /**
         * 验证验证码是否输入正确
         * @returns {boolean}
         */
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
