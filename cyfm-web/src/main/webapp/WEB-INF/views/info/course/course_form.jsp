<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<html>
<head>
  <title>课程 编辑页面</title>
</head>
<body>

<div class="portlet box editBox">
    <div class="portlet-title"><span>课程信息</span></div>
    <div class="portlet-body form">
        <form:form id="inputForm"  modelAttribute="entity" action="#" method="post">
        <div class="form-body">
            <input type="hidden" name="id" value="${entity.id}"/>
            <div id="messageBox" class="alert alert-error form-control controls" style="display:none">输入有误，请先更正。</div>
            <div class="form-group">
                <label for="courseNumber" class="control-label">课程编号:</label>
                <div class="controls">
                    <input type="text" id="courseNumber" name="courseNumber" maxlength="20" value="${entity.courseNumber}" class="form-control required"/>
                </div>
            </div>
            <div class="form-group">
                <label for="courseName" class="control-label">课程名称:</label>
                <div class="controls">
                    <input type="text" id="courseName" name="courseName" maxlength="20" value="${entity.courseName}" class="form-control required"/>
                </div>
            </div>
            <div class="form-group">
                <label for="courseType" class="control-label">课程类型:</label>
                <div class="controls">
                    <input type="text" id="courseType" name="courseType" maxlength="20" value="${entity.courseType}" class="form-control required"/>
                </div>
            </div>
            <div class="form-group">
                <label for="coursePeriodCount" class="control-label">课时数:</label>
                <div class="controls">
                    <input type="number" id="coursePeriodCount" name="coursePeriodCount" value="${entity.coursePeriodCount}" class="form-control required"/>
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
                courseNumber:{
                    maxlength:20
                },
                courseName:{
                    maxlength:20
                },
                courseType:{
                    maxlength:20
                },
                coursePeriodCount:{
                    number:true,
                    min: 1
                }
            }
        });
    });
</script>
</body>
</html>
