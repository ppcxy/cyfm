<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<html>
<head>
  <title>品牌详情</title>
</head>
<body>

<div class="portlet box editBox">
    <div class="portlet-title"><span>团队信息</span></div>
    <div class="portlet-body form">
        <form:form id="inputForm"  modelAttribute="entity" action="#" method="post">
        <div class="form-body">
            <input type="hidden" name="id" value="${entity.id}"/>
            <div id="messageBox" class="alert alert-error form-control controls" style="display:none">输入有误，请先更正。</div>
            <div class="form-group">
                <label for="brandName" class="control-label">品牌名:</label>
                <div class="controls">
                    <input type="text" id="brandName" name="brandName" value="${entity.brandName}" class="form-control required"/>
                </div>
            </div>
            <div class="form-group">
                <label for="origin" class="control-label">产地:</label>
                <div class="controls">
                    <input type="text" id="origin" name="origin" value="${entity.origin}" class="form-control required"/>
                </div>
            </div>
            <div class="form-group">
                <label for="weight" class="control-label">权重（影响排名）:</label>
                <div class="controls">
                    <input type="text" id="weight" name="weight" value="${entity.weight}" class="form-control required"/>
                </div>
            </div>
            <div class="form-actions">
                <input id="submit_btn" class="btn btn-primary" type="submit" value="提交"/>&nbsp;
                <p class="help-block">(点击提交保存信息.)</p>
            </div>
            </form:form>
        </div>
    </div>
</div>
<script>
    $cy.handleUniform();
    $("#inputForm").validate({

    });

</script>
</body>
</html>
