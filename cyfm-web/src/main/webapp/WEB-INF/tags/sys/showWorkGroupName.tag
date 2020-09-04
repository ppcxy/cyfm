<%@ tag import="com.ppcxy.common.spring.SpringContextHolder" %>
<%@ tag import="com.ppcxy.cyfm.sys.service.group.WorkGroupService" %>
<%@ tag import="com.ppcxy.cyfm.sys.entity.group.WorkGroup" %>
<%@ tag pageEncoding="UTF-8" %>
<%@ attribute name="id" type="java.lang.Long" required="true" description="当前要展示的工作组的id" %>
<%@ attribute name="needLink" type="java.lang.Boolean" required="false" description="是否需要链接" %>
<%!private WorkGroupService workGroupService;%>
<%

    if (workGroupService == null) {
        workGroupService = SpringContextHolder.getBean(WorkGroupService.class);
    }

    WorkGroup workGroup = workGroupService.findOne(id);

    if (workGroup == null) {
        out.write("<span class='label label-important'>删除的数据，请修改</span>");
        return;
    }
    String workGroupName = workGroup.getName();

    if (Boolean.FALSE.equals(needLink)) {
        out.write(workGroupName);
        return;
    }

    out.write(
            String.format(
                    "<a class='btn btn-default btn-link no-padding'>%s</a>",
                    workGroupName));
%>
