<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<html>
<head>
  <title>实验计划列表</title>
</head>

<body>
 <div class="tools search-toolbar">
   <div class="toolbar-right">
       <form class="form-search form-inline" action="#">
         <div class="form-group">
             <label>主讲教师：</label> <input type="text" name="search.principalTeacher_like"   class="form-control input-small"  value="${param['search.principalTeacher_like']}">
             <button type="submit" class="btn btn-default" id="search_btn">查询</button>
         </div>

       </form>
   </div>
 </div>
<div class="listTableWrap">
    <table id="contentTable" data-tid="experimentPlan" class="table table-list table-striped table-bordered table-hover table-condensed table-advance">
        <thead>
        <tr>
            <th class="check"><input type="checkbox"></th>
            <th>课程名称</th>
            <th>实验班别</th>
            <th>主讲教师</th>
            <th>实验项目数</th>
            <th>审批状态</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.content}" var="experimentPlan">
            <tr>
                <td class="check"><input type="checkbox" value="${experimentPlan.id}"></td>
                <td>${experimentPlan.course.courseName}&nbsp;</td>
                <td>
                    <c:forEach items="${experimentPlan.classes}" var="c">
                    <div>班级：${c.classesName} ，专业：${c.major.majorName}，年级：${c.grade.gradeName}, 人数: ${c.enrollment} </div>
                    </c:forEach>
                </td>
                <td>${experimentPlan.principalTeacher}&nbsp;</td>
                <td>${fn:length(experimentPlan.projects)}&nbsp;</td>
                <td title="${experimentPlan.approveInfo}">
                    <span style="${experimentPlan.approveStatus < 0 ? 'color:red;' : experimentPlan.approveStatus > 0 ? 'color:green;' : ''}">${experimentPlan.approveStatusInfo}&nbsp;<br>
                    <c:if test="${experimentPlan.approveStatus eq 1}"><a href="javascript:;" onclick="window.open('${ctx}/excel/planExport?planId=${experimentPlan.id}');">点击导出计划</a></c:if>
                    </span>
                </td>
                <cy:listTableActions name="${experimentPlan.id}" id="${experimentPlan.id}"/>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
 <cy:pagination page="${page}" paginationSize="5"/>
<script>
    $li = $("a[href='"+window.location.pathname+"']",parent.document.getElementById("leftFrame").contentWindow.document).parent("li");
    $li.parent("ul").show();
    $li.addClass("active");
</script>
</body>
</html>
