<%@ tag import="com.ppcxy.common.spring.SpringContextHolder" %>
<%@ tag import="com.ppcxy.cyfm.sys.entity.team.Team" %>
<%@ tag import="com.ppcxy.cyfm.sys.service.team.TeamService" %>
<%@ tag pageEncoding="UTF-8" %>
<%@ attribute name="id" type="java.lang.Long" required="true" description="当前要展示的工作组的id" %>
<%@ attribute name="needLink" type="java.lang.Boolean" required="false" description="是否需要链接" %>
<%!private TeamService teamService;%>
<%

	if (teamService == null) {
		teamService = SpringContextHolder.getBean(TeamService.class);
	}

	Team team = teamService.findOne(id);

	if (team == null) {
		out.write("<span class='label label-important'>删除的数据，请修改</span>");
		return;
	}
	String teamName = team.getName();

	if (Boolean.FALSE.equals(needLink)) {
		out.write(teamName);
		return;
	}

	out.write(
			String.format(
					"<a class='btn btn-default btn-link no-padding'>%s</a>",
					teamName));
%>
