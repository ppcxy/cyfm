<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<html>
<head>
  <title>实验项目 编辑页面</title>
</head>
<body>

<div class="portlet box editBox">
    <div class="portlet-title"><span>实验项目基本信息</span></div>
    <div class="portlet-body form">
        <form:form id="inputForm"  modelAttribute="entity" action="#" method="post" target="rightFrame">
        <div class="form-body">
            <input type="hidden" name="id" value="${entity.id}"/>
            <input type="hidden" name="experimentPlan.id" value="${entity.experimentPlan.id}"/>
            <div id="messageBox" class="alert alert-error form-control controls" style="display:none">输入有误，请先更正。</div>
            <div class="form-group">
                <label for="projectName" class="control-label">实验项目名称:</label>
                <div class="controls">
                    <input type="text" id="projectName" name="projectName" maxlength="50" value="${entity.projectName}" class="form-control required"/>
                </div>
            </div>

            <div class="form-group">
                <label for="coursePeriodCount" class="control-label">学时数:</label>
                <div class="controls">
                    <input type="number" id="coursePeriodCount" name="coursePeriodCount" maxlength="11" value="${entity.coursePeriodCount}" class="form-control required"/>
                </div>
            </div>
            <div class="form-group">
                <label for="groupCount" class="control-label">同时实验组数:</label>
                <div class="controls">
                    <input type="number" id="groupCount" name="groupCount" maxlength="11" value="${entity.groupCount}" class="form-control required"/>
                </div>
            </div>
            <div class="form-group">
                <label for="groupPersonCount" class="control-label">每组人数:</label>
                <div class="controls">
                    <input type="number" id="groupPersonCount" name="groupPersonCount" maxlength="11" value="${entity.groupPersonCount}" class="form-control required"/>
                </div>
            </div>
            <div class="form-group">
                <label for="consume" class="control-label">实验消耗（元/人时）:</label>
                <div class="controls">
                    <input type="number" id="consume" name="consume" maxlength="20" value="${entity.consume}" class="form-control"/>
                </div>
            </div>
            <div class="form-group">
                <label for="beginTime" class="control-label">实施日期:</label>
                <div class="controls">
                    <input type="text" id="beginTime" name="beginTime" maxlength="20" value="${entity.projectName}" class="form-control"/>
                </div>
            </div>
            <div class="form-group">
                <label for="counsellor" class="control-label">辅导人员:</label>
                <div class="controls">
                    <input type="text" id="counsellor" name="counsellor" maxlength="20" value="${entity.counsellor}" class="form-control required"/>
                    <script>
                        <%--设定默认值--%>
                        $('#counsellor[value=""]').val('<shiro:principal property="name"/>');
                    </script>
                </div>
            </div>
            <div class="form-actions">
                <input id="submit_btn" class="btn btn-primary" type="submit" value="提交"/>&nbsp;
                <c:if test="${not empty entity.id}">
                    <a id="cancel_btn" class="btn btn-default" href="${ctx}/experi/experimentProject/delete/${entity.id}" target="rightFrame">删除</a>
                </c:if>
                <p class="help-block">(点击提交，保存实验项目.)</p>
            </div>
            </form:form>
        </div>
    </div>
</div>
<script>
    $('input[name="experimentPlan.id"]').val(parent.$('input[name=id]').val());
</script>
<script>
    $(function () {
        $cy.handleUniform();
        $("#inputForm").validate({
            rules: {
                planPersonCount:{
                    number:true,
                    range:[1,2000]
                },
                consume:{
                    number:true,
                    range:[0,2000]
                },

            }
        });

        if ($("#groupPersonCount").val()==""){
            var gpc = $("#groupPersonCount",parent.document).val();
            var ppc = $("#planPersonCount",parent.document).val();

            var gc = Math.ceil(ppc/gpc);

            $("#groupCount").val(gc);
            $("#groupPersonCount").val(gpc);
        }
    });
</script>
</body>
</html>
