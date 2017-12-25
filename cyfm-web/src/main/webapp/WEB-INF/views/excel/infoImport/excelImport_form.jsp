<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf" %>
<html>
<head>
    <title>实验计划 编辑页面</title>
</head>
<body>
<div>
    <form:form id="editForm" method="post" commandName="m" cssClass="form-horizontal" enctype="multipart/form-data" onsubmit="return checkFile();">

        <mm:showMessage/>
        <div class="control-group">
            <c:choose>
                <c:when test="${type eq 'csv'}">
                    一行一条，以逗号分隔，如：1,zhangsan
                </c:when>
                <c:otherwise>
                    一行一条，每个单元格一个，如： 1 | zhangsan
                </c:otherwise>
            </c:choose>
        </div>
        <div class="control-group">
            <label for="file" class="control-label">导入类型:</label>
           <div>
               <input type="radio" name="infoType" value="major"> 专业
               <input type="radio" name="infoType" value="grade"> 年级
               <input type="radio" name="infoType" value="classes"> 班级
               <input type="radio" name="infoType" value="course"> 课程
               <input type="radio" name="infoType" value="experimentPlace"> 实验场地
               <input type="radio" name="infoType" value="experimentDevice"> 实验设备
           </div>
        </div>

        <div class="control-group">
            <label for="file" class="control-label">文件</label>

            <div class="controls">
                <input id="file" type="file" name="file" class="custom-file-input"/>
            </div>
        </div>

        <div class="control-group">
            <div class="controls">
                <button type="submit" class="btn btn-primary">
                    <i class="icon-level-down"></i>
                    导入
                </button>
            </div>
        </div>
        <div>说明：
            <div>专业导入文件字段顺序：专业类型,专业编号,专业名称,排序优先级（数字）| <a href="${ctx}/static/mb/major.xlsx">点击下载模板</a></div>
            <div>年级导入文件字段顺序：年级名称,入学年份,排序优先级（数字）| <a href="${ctx}/static/mb/grade.xlsx">点击下载模板</a></div>
            <div>班级导入文件字段顺序：班级名称,专业名称,年级名称,班级人数 | <a href="${ctx}/static/mb/classes.xlsx">点击下载模板</a></div>
            <div>课程导入文件字段顺序：课程编号,课程名称,课程类型,课时数 | <a href="${ctx}/static/mb/course.xlsx">点击下载模板</a></div>
            <div>试验场地导入文件字段顺序： 实验场地名称,实验场地信息 | <a href="${ctx}/static/mb/plan.xlsx">点击下载模板</a></div>
            <div>实验设备导入文件字段顺序：实验设备名称,实验设备类型,实验设备状态 | <a href="${ctx}/static/mb/device.xlsx">点击下载模板</a></div>
        </div>

    </form:form>
</div>
<mm:contentFooter/>
<script>
    function checkFile() {
        if ($('[name=infoType]:checked').size() == 0) {
            $cy.warn("请选择要导入的基础信息类型。")
            return false
        }
        if ($('#file').val() == "") {
            $cy.warn("请选择一个文件。")
           return false
        }
        return true
    }
</script>
</body>
</html>
