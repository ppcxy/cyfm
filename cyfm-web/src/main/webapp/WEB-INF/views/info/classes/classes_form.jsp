<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<html>
<head>
  <title>班级 编辑页面</title>
</head>
<body>

<div class="portlet box editBox">
    <div class="portlet-title"><span>班级信息</span></div>
    <div class="portlet-body form">
        <form:form id="inputForm"  modelAttribute="entity" action="#" method="post">
        <div class="form-body">
            <input type="hidden" name="id" value="${entity.id}"/>
            <div id="messageBox" class="alert alert-error form-control controls" style="display:none">输入有误，请先更正。</div>
            <div class="form-group">
                <label for="classesName" class="control-label">班级名称:</label>
                <div class="controls">
                    <input type="text" id="classesName" name="classesName" maxlength="20" value="${entity.classesName}" class="form-control required"/>
                </div>
            </div>
            <div class="form-group">
                <label for="major" class="control-label">所属专业:</label>
                <div class="controls">
                    <select type="text" id="major" name="major" maxlength="20" class="form-control required">
                        <option value="">请选择</option>
                        <c:forEach items="${majors}" var="major">
                            <option value="${major.id}">${major.majorName}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="grade" class="control-label">年级:</label>
                <div class="controls">
                    <select type="text" id="grade" name="grade" class="form-control required">
                        <option value="">请选择</option>
                        <c:forEach items="${grades}" var="grade">
                            <option value="${grade.id}">${grade.gradeName}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="enrollment" class="control-label">班级人数:</label>
                <div class="controls">
                    <input type="text" id="enrollment" name="enrollment" value="${entity.enrollment}" class="form-control required"/>
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
        $('#grade').val('${entity.grade.id}')
        $('#major').val('${entity.major.id}')
        $cy.handleUniform();
        $("#inputForm").validate({
            rules: {
                classesName:{
                    maxlength:20
                },
                enrollment:{
                    range:[10,500]
                }
            }
        });
    });
</script>
</body>
</html>
