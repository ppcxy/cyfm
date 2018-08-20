<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<html>
<head>
  <title>任务详情</title>
</head>
<body>

<div class="portlet box editBox">
    <div class="portlet-title"><span>任务信息</span></div>
    <div class="portlet-body form">
        <form:form id="inputForm"  modelAttribute="entity" action="#" method="post">
        <div class="form-body">
            <input type="hidden" name="id" value="${entity.id}"/>
            <div id="messageBox" class="alert alert-error form-control controls" style="display:none">输入有误，请先更正。</div>
            <div class="form-group">
                <label for="name" class="control-label">任务名称:</label>
                <div class="controls">
                    <input type="text" id="name" name="name" value="${entity.name}" class="form-control required"/>
                </div>
            </div>
            <div class="form-group">
                <label for="cron" class="control-label">Cron 表达式:</label>
                <div class="controls">
                    <input type="text" id="cron" name="cron" value="${entity.cron}" class="form-control required"/>
                </div>
            </div>
            <div class="form-group">
                <label for="beanClass" class="control-label">执行任务类全名(含包名):</label>
                <div class="controls">
                    <input type="text" id="beanClass" maxlength="300" name="beanClass" value="${entity.beanClass}" class="form-control"/>
                </div>
            </div>
            <div class="form-group">
                <label for="beanName" class="control-label">执行任务Spring Bean名:</label>
                <div class="controls">
                    <input type="text" id="beanName" maxlength="300" name="beanName" value="${entity.beanName}" class="form-control"/>
                </div>
            </div>
            <div class="form-group">
                <label for="methodName" class="control-label">执行方法名:</label>
                <div class="controls">
                    <input type="text" id="methodName" maxlength="300" name="methodName" value="${entity.methodName}" class="form-control required"/>
                </div>
            </div>
            <div class="form-group">
                <label for="description" class="control-label">任务描述:</label>
                <div class="controls">
                    <input type="text" id="description" maxlength="1000" name="description" value="${entity.description}" class="form-control"/>
                </div>
            </div>
            <div class="form-actions">
                <input id="submit_btn" class="btn btn-primary" type="submit" value="提交"/>&nbsp;
                <p class="help-block">(点击提交保存信息.)</p>
            </div>
        </div>
        </form:form>
    </div>
</div>
<script>
    $cy.handleUniform();
    $("#inputForm").validate({});
</script>
</body>
</html>
