<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<html>
<head>
  <title>团队详情</title>
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
                <label for="name" class="control-label">团队名称:</label>
                <div class="controls">
                    <input type="text" id="name" name="name" value="${entity.name}" class="form-control required"/>
                </div>
            </div>
            <div class="form-group">
                <label for="master" class="control-label">管理人员:</label>
                <div class="controls">
                    <input type="text" id="masterInfo" value="${entity.master.showName}" class="form-control required" readonly/>
                    <input type="hidden" id="master" name="master" value="${entity.master.id}"/>
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
    $("#inputForm").validate({

    });

    $("#masterInfo").focus(function () {
        $cy.tools.chooseUser({
            callback: function (show, results) {
                $("#masterInfo").val(show);
                $("#master").val(results.data("id"));
            }
        })
    });
</script>
</body>
</html>
