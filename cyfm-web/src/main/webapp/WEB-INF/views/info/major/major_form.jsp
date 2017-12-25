<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<html>
<head>
  <title>专业 编辑页面</title>
</head>
<body>
<div class="portlet box editBox">
    <div class="portlet-title"><span>专业信息</span></div>
    <div class="portlet-body form">
        <form:form id="inputForm"  modelAttribute="entity" action="#" method="post">
        <div class="form-body">
            <input type="hidden" name="id" value="${entity.id}"/>
            <div id="messageBox" class="alert alert-error form-control controls" style="display:none">输入有误，请先更正。</div>
            <div class="form-group">
                <label for="majorType" class="control-label">专业分类:</label>
                <div class="controls">
                    <input type="text" id="majorType" name="majorType" maxlength="20" value="${entity.majorType}" class="form-control required"/>
                </div>
            </div>
            <div class="form-group">
                <label for="majorNumber" class="control-label">专业编号:</label>
                <div class="controls">
                    <input type="text" id="majorNumber" name="majorNumber" maxlength="20" value="${entity.majorNumber}" class="form-control required"/>
                </div>
            </div>
            <div class="form-group">
                <label for="majorName" class="control-label">专业名称:</label>
                <div class="controls">
                    <input type="text" id="majorName" name="majorName" maxlength="20" value="${entity.majorName}" class="form-control required"/>
                </div>
            </div>
            <div class="form-group">
                <label for="weight" class="control-label">排序权重:</label>
                <div class="controls">
                    <input type="number" id="weight" name="weight" value="${entity.weight}" class="form-control required"/>
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
                majorType:{
                    maxlength:20
                },
                majorNumber:{
                    maxlength:20
                },
                majorName:{
                    maxlength:20
                }
            }
        });
    });
</script>
</body>
</html>
