<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<html>
<head>
  <title>设备 编辑页面</title>
</head>
<body>

<div class="portlet box editBox">
    <div class="portlet-title"><span>设备信息</span></div>
    <div class="portlet-body form">
        <form:form id="inputForm"  modelAttribute="entity" action="#" method="post">
        <div class="form-body">
            <input type="hidden" name="id" value="${entity.id}"/>
            <div id="messageBox" class="alert alert-error form-control controls" style="display:none">输入有误，请先更正。</div>
            <div class="form-group">
                <label for="deviceName" class="control-label">设备名称:</label>
                <div class="controls">
                    <input type="text" id="deviceName" name="deviceName" maxlength="30" value="${entity.deviceName}" class="form-control required"/>
                </div>
            </div>
            <div class="form-group">
                <label for="deviceType" class="control-label">设备类型:</label>
                <div class="controls">
                    <input type="text" id="deviceType" name="deviceType" maxlength="20" value="${entity.deviceType}" class="form-control required"/>
                </div>
            </div>
            <div class="form-group">
                <label for="deviceState" class="control-label">设备状态:</label>
                <div class="controls">
                    <input type="text" id="deviceState" name="deviceState" maxlength="20" value="${entity.deviceState}" class="form-control required"/>
                </div>
            </div>

            <div class="form-actions">
                <input id="submit_btn" class="btn btn-primary" type="submit" value="提交"/>&nbsp;
                <input id="cancel_btn" class="btn" type="button" value="返回" onclick="history.back()"/>
                <p class="help-block">(点击提交保存信息.)</p>
            </div>
            </form:form>
        </div>
    </div>
</div>
<script>
    $(function () {
        $cy.handleUniform();
        $("#inputForm").validate({
            rules: {
                deviceName:{
                    maxlength:30
                },
                deviceType:{
                    maxlength:20
                },
                deviceState:{
                    maxlength:20
                }
            }
        });
    });
</script>
</body>
</html>
