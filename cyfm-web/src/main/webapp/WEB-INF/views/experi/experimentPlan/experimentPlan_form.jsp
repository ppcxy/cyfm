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
                    <input type="text" id="principalTeacher" name="principalTeacher" maxlength="20" value="${entity.principalTeacher}" class="form-control required"/>
                    <script>
                        <%--设定默认值--%>
                        $('#principalTeacher[value=""]').val('<shiro:principal property="name"/>');
                    </script>
                </div>
            </div>

            <div class="form-group">
                <label for="schoolYear" class="control-label">学年:</label>
                <div class="controls">
                    <select type="text" id="schoolYear" name="schoolYear" class="form-control required">
                        <option value="2018/2019">2018 -- 2019</option>
                        <option value="2019/2020">2019 -- 2020</option>
                        <option value="2020/2021">2020 -- 2021</option>
                        <option value="2021/2022">2021 -- 2022</option>
                        <option value="2022/2023">2022 -- 2023</option>
                        <option value="2023/2024">2023 -- 2024</option>
                        <option value="2024/2025">2024 -- 2025</option>
                    </select>
                    <script>
                        <%--设定默认值--%>
                        $('#schoolYear').val('${entity.schoolYear}');
                    </script>
                </div>
            </div>

            <div class="form-group">
                <label for="semester" class="control-label">学期:</label>
                <div class="controls">
                    <select type="text" id="semester" name="semester" class="form-control required">
                        <option value="1">1</option>
                        <option value="2">2</option>
                    </select>
                    <script>
                        <%--设定默认值--%>
                        $('#semester').val('${entity.semester}');
                    </script>
                </div>
            </div>

            <div class="form-group">
                <label for="course" class="control-label">课程:</label>
                <div class="controls">
                    <select type="text" id="course" name="course" class="form-control required">
                        <option value="">请选择</option>
                        <c:forEach items="${courses}" var="course">
                            <option value="${course.id}" data-number="${course.courseNumber}" data-count="${course.coursePeriodCount}">课程编号：${course.courseNumber} ，名称：${course.courseName}，课时数：${course.coursePeriodCount}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="plan" class="control-label">试验场地:</label>
                <div class="controls">
                    <select type="text" id="plan" name="plan" class="form-control required">
                        <option value="">请选择</option>
                        <c:forEach items="${places}" var="plan">
                            <option value="${plan.id}">${plan.placeName}</option>
                        </c:forEach>
                    </select>
                    <script>
                        <%--设定默认值--%>
                        $('#plan').val('${entity.place.id}');
                    </script>
                </div>
            </div>
            <div class="form-group">
                <label for="device" class="control-label">所需试验设备:</label>
                <div class="controls">
                    <select type="text" id="device" name="device" class="form-control">
                        <option value="">请选择</option>
                        <c:forEach items="${devices}" var="device">
                            <option value="${device.id}">${device.deviceName}</option>
                        </c:forEach>
                    </select>
                    <script>
                        <%--设定默认值--%>
                        $('#device').val('${entity.device.id}');
                    </script>
                </div>
            </div>
            <div class="form-group">
                <label for="soft" class="control-label">所需试验软件:</label>
                <div class="controls">
                    <input type="text" id="soft" name="soft" value="${entity.soft}" class="form-control"/>
                </div>
            </div>

            <div class="form-group">
                <label for="classes" class="control-label">班别（双击已添加条目可删除）:</label>
                <div id="classesInfo" <c:if test="${not empty entity.classes}">style="border: 1px solid red;padding: 3px;"</c:if>>
                    <input type="hidden" name="classes" data-enrollment="0">
                    <c:forEach items="${entity.classes}" var="c">
                        <div class="cif"><input type="hidden" name="classes" data-enrollment="${c.enrollment}" value="${c.id}">班级：${c.classesName} ，专业：${c.major.majorName}，年级：${c.grade.gradeName}, 人数: ${c.enrollment}</div>
                    </c:forEach>
                </div>
                <div class="controls">
                    <div>选择班级，点击添加按钮添加</div>
                    <div class="input-group">
                        <select type="text" id="classesselect" class="form-control">
                            <option value="">请选择班级</option>
                            <c:forEach items="${classes}" var="c">
                                <option value="${c.id}" data-enrollment="${c.enrollment}">班级：${c.classesName} ，专业：${c.major.majorName}，年级：${c.grade.gradeName}, 人数: ${c.enrollment}</option>
                            </c:forEach>
                        </select>
                        <span class="input-group-btn">
                            <button id="classes" type="button" class="btn btn-default"><i class="fa fa-plus"></i> 添加</button>
                        </span>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label for="planPersonCount" class="control-label">实验人数:</label>
                <div class="controls">
                    <input type="number" id="planPersonCount" name="planPersonCount" value="${empty entity.planPersonCount ? 0 : entity.planPersonCount}" class="form-control required"/>
                </div>
            </div>
            <div class="form-group">
                <label for="groupPersonCount" class="control-label">单组人数:</label>
                <div class="controls">
                    <input type="number" id="groupPersonCount" name="groupPersonCount" value="${empty entity.groupPersonCount ? 1 : entity.groupPersonCount}" class="form-control required"/>
                </div>
            </div>

            <div class="form-group">
                <label for="experiDate" class="control-label">实验周学时:</label>
                <div class="weeksPeriodCount">
                    <input type="number" id="weeksPeriodCount" name="weeksPeriodCount" value="${entity.weeksPeriodCount}" class="form-control required"/>
                </div>
            </div>
            <div class="form-group">
                <label for="weeksCount" class="control-label">实验周数:</label>
                <div class="controls">
                    <input type="number" id="weeksCount" name="weeksCount" value="${entity.weeksCount}" class="form-control required"/>
                </div>
            </div>

            <div class="form-group">
                <label for="experiDate" class="control-label">起始-结束周:</label>
                <div class="controls">
                    <input type="text" id="experiDate" name="experiDate" value="${entity.experiDate}" class="form-control required"/>
                </div>
            </div>

            <div class="form-group">
                <label for="remark" class="control-label">备注:</label>
                <div class="controls">
                    <input type="text" id="remark" name="remark" value="${entity.remark}" class="form-control"/>
                </div>
            </div>
            <c:if test="${not empty entity.id}">
                <div>
                    <div class="form-group">
                        <label for="projectsInfo" class="control-label">实验项目（双击已添加条目可修改）:</label>
                        <div id="projectsInfo" <c:if test="${not empty entity.projects}">style="border: 1px solid red;padding: 3px;"</c:if>>
                            <c:forEach items="${entity.projects}" var="p" varStatus="s">
                                <div class="pif"><input type="hidden" value="${p.id}">项目名称：${p.projectName} ，学时数：${p.coursePeriodCount} ， 实验组数：${p.groupCount} ， 每组人数：${p.groupPersonCount} ， 实验消耗（元/人时）：${p.consume} ， 实施日期：${p.beginTime} ，  辅导人员姓名：${p.counsellor} </div>
                            </c:forEach>
                        </div>
                        <div class="controls text-right">
                            <button id="projectsAdd" type="button" class="btn green"><i class="fa fa-plus"></i> 添加项目</button>
                        </div>
                    </div>
                </div>
            </c:if>
            <c:if test="${not empty entity.id}">
            <div class="form-group">
                <label for="approveInfo" class="control-label">审批信息:</label>
                <div class="approveInfo">
                    <input type="hidden" id="approveStatus" name="approveStatus" value="${entity.approveStatus}"/>
                    <button id="approveStatusBtn" type="button" style="width: 100%;height: 30px;" class="btn yellow">等待审批中</button>
                    <div>
                        <textarea id="approveInfo" name="approveInfo" class="form-control" readonly>${entity.approveInfo}</textarea>
                    </div>
                </div>
            </div>
                <script>
                    switch($('#approveStatus').val()){
                        case '1' :  $('#approveStatusBtn').removeClass('yellow').addClass('green').text('已通过审批');break;
                        case '-1' :$('#approveStatusBtn').removeClass('yellow').addClass('red').text('未通过审批'); break;
                    }
                </script>
            </c:if>
            <div class="form-actions">
                <input id="submit_btn" class="btn btn-primary" type="submit" value="提交"/>&nbsp;
                <input id="cancel_btn" class="btn" type="button" value="返回" onclick="window.location.href='${ctx}/experi/experimentPlan'"/>
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
    //注册删除班级事件
    $('body').on('dblclick','div.cif',function () {
        $(this).remove();
        jsPersonCount();
    })
    //注册添加班级事件
    $('#classes').click(function () {
        var $classesInfo = $('#classesInfo');
        var $newClassID = $('#classesselect').val();
        if($newClassID){
            var $selectedText = $('#classesselect').find("option:selected").text();
            var $enrollment = $('#classesselect').find("option:selected").data('enrollment');

            $classesInfo.find('input[value='+$newClassID+']').parent('div').remove();
            $classesInfo.append('<div class="cif"><input data-enrollment="'+$enrollment+'" type="hidden" name="classes" value="' + $newClassID + '">'+$selectedText+'</div>');

            jsPersonCount()
        }
    })

    //注册实验项目弹出事件
    $('body').on('dblclick','div.pif',function () {
        var $projectId = $(this).find("input:hidden").val();
        layer.open({
            type: 2,
            title: '实验项目信息',
            shadeClose: true,
            shade: false,
            maxmin: true, //开启最大化最小化按钮
            area: ['893px', '600px'],
            content: '${ctx}/experi/experimentProject/update/'+$projectId
        });
    })

    $('#projectsAdd').click(function () {
        layer.open({
            type: 2,
            title: '实验项目信息',
            shadeClose: true,
            shade: false,
            maxmin: true, //开启最大化最小化按钮
            area: ['700px', '600px'],
            content: '${ctx}/experi/experimentProject/create'
        });
    });

</script>
<script>
    $(function () {
        $('#course').val('${entity.course.id}')

        $cy.handleUniform();
        $("#inputForm").validate({
            rules: {
                planPersonCount:{
                    number:true,
                    range:[1,2000]
                },
                groupPersonCount:{
                    number:true,
                    range:[1,2000]
                },
                weeksPeriodCount:{
                    number:true,
                    range:[1,500]
                },
                weeksCount:{
                    number:true,
                    range:[1,500]
                }
            }
        });
    });
</script>
</body>
</html>
