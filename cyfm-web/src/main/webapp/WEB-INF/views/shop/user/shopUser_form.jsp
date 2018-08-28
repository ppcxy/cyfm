<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<html>
<head>
    <title>用户详情</title>
</head>

<body>

<div class="portlet box editBox">
    <div class="portlet-title"><span>用户信息</span></div>
    <div class="portlet-body form">
        <form:form id="inputForm"  modelAttribute="entity" action="#" method="post">
            <div class="form-body">
                <input type="hidden" name="id" value="${entity.id}"/>
                <div id="messageBox" class="alert alert-error form-control controls" style="display:none">输入有误，请先更正。</div>
                <div class="form-group">
                    <label for="username" class="control-label">登录名:</label>
                    <div class="controls">
                        ${entity.user.username}
                    </div>
                </div>
                <div class="form-group">
                    <label for="name" class="control-label">用户姓名:</label>
                    <div class="controls">
                        ${entity.realName}
                    </div>
                </div>
                <div class="form-group">
                    <label for="email" class="control-label">邮箱:</label>
                    <div class="controls">
                        ${entity.user.email}
                    </div>
                </div>
                <div class="form-group">
                    <label for="tel" class="control-label">手机:</label>
                    <div class="controls">
                        ${entity.user.tel}
                    </div>
                </div>
                <div class="form-group">
                    <label for="tel" class="control-label">详细地址:</label>
                    <div class="controls">
                        ${entity.address}
                    </div>
                </div>
                <div class="form-group">
                    <label for="status" class="control-label">状态:</label>
                    <div class="controls">
                        <form:radiobuttons path="user.status" items="${allStatus}" labelCssClass="inline" cssClass="required"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="plainPassword" class="control-label">密码:</label>
                    <div class="controls">
                        <input type="password" id="plainPassword" name="user.plainPassword" class="form-control" placeholder="...Leave it blank if no change" autocomplete="off" />
                    </div>
                </div>
                <div class="form-actions">
                    <input id="submit_btn" class="btn btn-primary" type="submit" value="提交"/>&nbsp;
                    <p class="help-block">(点击提交保存信息.)</p>
                        <%--<p class="help-block">(保存后将发送JMS消息通知改动，而消息接收者将发送提醒邮件)</p>--%>
                </div>
            </div>
        </form:form>
    </div>
</div>
<script>
    $(function () {
        $cy.handleUniform();
        $("#inputForm").validate();
    })
</script>
</body>
</html>
