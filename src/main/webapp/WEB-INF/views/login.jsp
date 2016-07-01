<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.SecurityUtils"%>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<%
	if (SecurityUtils.getSubject().isAuthenticated()) {
		if ("".equals(request.getContextPath())) {
			response.sendRedirect("/");
		} else {
			response.sendRedirect(request.getContextPath());
		}
	}
%>
<html>
<head>
	<title>登录页</title>

</head>

<body>
	<h1>登录页</h1>
	<form id="loginForm" action="${ctx}/login" method="post">
		<%--<%--%>
            <%--Object object = request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);--%>
            <%--if (object != null) {--%>
                <%--if (object instanceof Exception) {--%>
                    <%--Exception exception = (Exception)object;--%>
                    <%--exception.printStackTrace();--%>
                <%--} else {--%>
                    <%--System.out.println(object);--%>
                <%--}--%>
            <%--}--%>
		<%--%>--%>
		<%--<%--%>
			<%--String error = (String) request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);--%>
			<%--if(error != null){--%>
		<%--%>--%>
				<%--<div class="alert alert-error controls input-large">--%>
					<%--<button class="close" data-dismiss="alert">×</button>--%>
		<%--<%--%>
				<%--if(error.contains("DisabledAccountException")){--%>
					<%--out.print("用户已被屏蔽,请登录其他用户.");--%>
				<%--}--%>
				<%--else{--%>
					<%--out.print("登录失败，请重试.");--%>
				<%--}--%>
		<%--%>--%>
				<%--</div>--%>
		<%--<%--%>
			<%--}--%>
		<%--%>--%>
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
					<img class="jcaptcha-btn jcaptcha-img" style="margin-left: 10px;" src="${ctx}/jcaptcha.jpg" title="点击更换验证码">
					<a class="jcaptcha-btn btn btn-link">换一张</a>
				</div>
			</c:if>

		<div class="control-group">
			<div class="controls">
				<label class="checkbox inline" for="rememberMe"> <input type="checkbox" id="rememberMe" name="rememberMe"/> 记住我</label>
				<input id="submit_btn" class="btn" type="submit" value="登录"/>
				<p class="help-block">(管理员：<b>admin/admin</b>, 普通用户：<b>user/user</b>)</p>
			</div>
		</div>
	</form>

	<script>
		$(document).ready(function() {
			$("#loginForm").validate();
		});
	</script>
</body>
</html>
