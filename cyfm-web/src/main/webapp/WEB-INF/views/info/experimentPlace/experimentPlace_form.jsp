<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<html>
<head>
  <title>实验场地 编辑页面</title>
</head>
<body>

<div class="portlet box editBox">
    <div class="portlet-title"><span>实验场地信息</span></div>
    <div class="portlet-body form">
        <form:form id="inputForm"  modelAttribute="entity" action="#" method="post">
        <div class="form-body">
            <input type="hidden" name="id" value="${entity.id}"/>
            <div id="messageBox" class="alert alert-error form-control controls" style="display:none">输入有误，请先更正。</div>
            <div class="form-group">
                <label for="placeName" class="control-label">实验场地名称:</label>
                <div class="controls">
                    <input type="text" id="placeName" name="placeName" maxlength="30" value="${entity.placeName}" class="form-control required"/>
                </div>
            </div>
            <div class="form-group">
                <label for="placeInfo" class="control-label">场地信息描述:</label>
                <div class="controls">
                    <textarea type="text" id="placeInfo" name="placeInfo" maxlength="90" value="${entity.placeInfo}" class="form-control">${entity.placeInfo}</textarea>
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
                placeName:{
                    maxlength:30
                },
                placeInfo:{
                    maxlength:90
                }
            }
        });
    });
</script>
</body>
</html>
