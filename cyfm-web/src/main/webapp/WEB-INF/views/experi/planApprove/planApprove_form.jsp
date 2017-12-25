<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<html>
<head>
  <title>实验计划 编辑页面</title>
</head>
<body>

<div class="portlet box editBox">
    <div class="portlet-title"><span>实验计划基本信息</span></div>
    <div class="portlet-body form">
        <form:form id="inputForm"  modelAttribute="entity" action="#" method="post">
        <div class="form-body">
            <input type="hidden" name="id" value="${entity.id}"/>
            <div id="messageBox" class="alert alert-error form-control controls" style="display:none">输入有误，请先更正。</div>
            <div class="form-group">
                <label for="principalTeacher" class="control-label">主讲教师:</label>
                <div class="controls">
                    <input type="text" id="principalTeacher"  maxlength="20" value="${entity.principalTeacher}" class="form-control" readonly/>
                    <script>
                        <%--设定默认值--%>
                        $('#principalTeacher[value=""]').val('<shiro:principal property="name"/>');
                    </script>
                </div>
            </div>
            <div class="form-group">
                <label for="course" class="control-label">课程:</label>
                <div class="controls">
                    <select type="text" id="course" class="form-control" readonly>
                        <option value="">请选择</option>
                        <c:forEach items="${courses}" var="course">
                            <option value="${course.id}" data-number="${course.courseNumber}" data-count="${course.coursePeriodCount}">课程编号：${course.courseNumber} ，名称：${course.courseName}，课时数：${course.coursePeriodCount}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label for="classesInfo" class="control-label">班别:</label>
                <div id="classesInfo" <c:if test="${not empty entity.classes}">style="border: 1px solid red;padding: 3px;"</c:if>>
                    <c:forEach items="${entity.classes}" var="c">
                        <div class="cif">班级：${c.classesName} ，专业：${c.major.majorName}，年级：${c.grade.gradeName}, 人数: ${c.enrollment}</div>
                    </c:forEach>
                </div>
            </div>

            <div class="form-group">
                <label for="planPersonCount" class="control-label">实验人数:</label>
                <div class="controls">
                    <input type="number" id="planPersonCount"  value="${empty entity.planPersonCount ? 0 : entity.planPersonCount}" class="form-control" readonly/>
                </div>
            </div>

            <div class="form-group">
                <label for="experiDate" class="control-label">实验日期:</label>
                <div class="controls">
                    <input type="text" id="experiDate" value="${entity.experiDate}" class="form-control" readonly/>
                </div>
            </div>
            <c:if test="${not empty entity.id}">
                <div>
                    <div class="form-group">
                        <label for="projectsInfo" class="control-label">实验项目:</label>
                        <div id="projectsInfo" <c:if test="${not empty entity.projects}">style="border: 1px solid red;padding: 3px;"</c:if>>
                            <c:forEach items="${entity.projects}" var="p" varStatus="s">
                                <div class="pif"><input type="hidden" value="${p.id}">项目名称：${p.projectName} ，学时数：${p.coursePeriodCount} ， 实验组数：${p.groupCount} ， 每组人数：${p.groupPersonCount} ， 实验消耗（元/人时）：${p.consume} ， 实施日期：${p.beginTime} ，  辅导人员姓名：${p.counsellor} </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </c:if>
            <div class="form-group">
                <label for="approveInfo" class="control-label">审批信息(点击色条切换审批状态):</label>
                <div class="approveInfo">
                    <input type="hidden" id="approveStatus" name="approveStatus" value="${entity.approveStatus}"/>
                    <button id="approveStatusBtn" type="button" style="width: 100%;height: 30px;" class="btn red">未通过审批</button>
                    <div>
                        <textarea id="approveInfo" name="approveInfo" class="form-control" placeholder="请填写审批意见">${entity.approveInfo}</textarea>
                    </div>
                </div>
            </div>

            <div class="form-actions">
                <input id="submit_btn" class="btn btn-primary" type="submit" value="提交"/>&nbsp;
                <input id="cancel_btn" class="btn" type="button" value="返回" onclick="window.location.href='${ctx}/experi/planApprove'"/>
                <p class="help-block">(点击提交，保存计划基本信息后添加项目.)</p>
            </div>
            </form:form>
        </div>
    </div>
</div>
<script>
    //计算总人数
    function jsPersonCount(){
        var countPerson=0;
        $('input[name=classes]').each(function (i, o) {
            var count = $(o).data('enrollment');
            countPerson += count;
        });

        $('#planPersonCount').val(countPerson);
    }

</script>
<script>
    $(function () {
    $('#course').val('${entity.course.id}').attr('disabled',true);
        $('#approveStatusBtn').click(function () {
            if ($(this).hasClass('red')) {
                $(this).removeClass('red').addClass('green').text('已通过审批');
                $('#approveStatus').val(1);
            } else {
                $(this).removeClass('green').addClass('red').text('未通过审批');
                $('#approveStatus').val(-1);
            }
        });
        if ('${entity.approveStatus}'== '1'){
            $('#approveStatusBtn').click();
        } else if('${entity.approveStatus}' == '0'){
            $('#approveStatus').val(-1);
        }

        $cy.handleUniform();
        $("#inputForm").validate({
            
        });
    });
</script>
</body>
</html>
