<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<html>
<head>
  <title>年级 编辑页面</title>
</head>
<body>
<div class="portlet box editBox">
    <div class="portlet-title"><span>年级信息</span></div>
    <div class="portlet-body form">
        <form:form id="inputForm"  modelAttribute="entity" action="#" method="post">
        <div class="form-body">
            <input type="hidden" name="id" value="${entity.id}"/>
            <div id="messageBox" class="alert alert-error form-control controls" style="display:none">输入有误，请先更正。</div>
            <div class="form-group">
                <label for="gradeName" class="control-label">年级名称:</label>
                <div class="controls">
                    <input type="text" id="gradeName" name="gradeName" maxlength="20" value="${entity.gradeName}" class="form-control required"/>
                </div>
            </div>
            <div class="form-group">
                <label for="enrolYears" class="control-label">入学年份:</label>
                <div class="controls">
                    <input type="text" id="enrolYears" name="enrolYears" maxlength="4" value="${entity.enrolYears}" class="form-control required"/>
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
                gradeName:{
                    maxlength:20
                },
                enrolYears:{
                    range:[1900,2999],
                    number:true,
                },
                weight:{
                    number:true
                }
            },
            messages:{
                enrolYears:{
                    range:"请输入四位数的年，如：2018"
                }
            }
        });
    });
</script>
</body>
</html>
