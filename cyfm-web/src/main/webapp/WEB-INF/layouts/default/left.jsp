<%@ page language="java" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<div class="page-sidebar-wrapper">
	<div class="page-sidebar navbar-collapse collapse">
		<!-- BEGIN SIDEBAR MENU -->
		<ul class="page-sidebar-menu " data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200">
			<li class="sidebar-toggler-wrapper">
				<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
				<div class="sidebar-toggler">
				</div>
				<!-- END SIDEBAR TOGGLER BUTTON -->
			</li>
			<li class="sidebar-search-wrapper">
				<!-- BEGIN RESPONSIVE QUICK SEARCH FORM -->
				<form class="sidebar-search " action="extra_search.html" method="POST">
					<a href="javascript:;" class="remove">
						<i class="icon-close"></i>
					</a>
					<div class="input-group">
						<input type="text" class="form-control" placeholder="Search...">
							<span class="input-group-btn">
							<a href="javascript:;" class="btn submit"><i class="icon-magnifier"></i></a>
							</span>
					</div>
				</form>
				<!-- END RESPONSIVE QUICK SEARCH FORM -->
			</li>
			<li class="start open">
				<a href="javascript:;">
					<i class="icon-twitter"></i>
					<span class="title">独立演示</span>
					<span class="arrow open"></span>
				</a>
				<ul class="sub-menu" style="display: block;">
					<li>
						<a id="web-tab" href="${ctx}/story/web">Web演示</a>
						<a id="webservice-tab"href="${ctx}/story/webservice">WebService演示</a>
						<a id="hystrix-tab" href="${ctx}/hystrix">Hystrix演示</a>
						<a id="jmx-tab" href="${ctx}/story/jmx">JMX演示</a>
						<a id="log-tab" href="${ctx}/story/log">日志高级演示</a>
						<a id="monitor-tab" href="${ctx}/story/monitor">性能监控演示</a>
					</li>
				</ul>
			</li>
			<li class="start">
				<a href="javascript:;">
					<i class="icon-twitter"></i>
					<span class="title">演示说明</span>
					<span class="arrow open"></span>
				</a>
				<ul class="sub-menu">
					<li>
						<a id="persistence-tab" href="${ctx}/story/persistence">持久化高级演示</a>
						<a id="jms-tab" href="${ctx}/story/jms">JMS演示</a>
						<a id="reids-tab" href="${ctx}/story/redis">Redis演示</a>
						<a id="cache-tab" href="${ctx}/story/cache">Cache演示</a>
						<a id="schedule-tab" href="${ctx}/story/schedule">定时任务演示</a>
						<a id="security-tab" href="${ctx}/story/security">安全高级演示</a>
						<a id="utilizes-tab"href="${ctx}/story/utilizes">工具类演示</a>
						<a id="executablewar-tab"href="${ctx}/story/executablewar">可运行war包演示</a>
					</li>
				</ul>
			</li>
			<li class="start">
				<a href="javascript:;">
					<i class="icon-twitter"></i>
					<span class="title">综合演示</span>
					<span class="arrow open"></span>
				</a>
				<ul class="sub-menu">
					<li>
						<a id="user-tab" href="${ctx}/sys/user" nav-n="系统管理,帐号管理,/workflow/process/list,ajax">
							<i class="icon-play"></i>
							<span class="title">帐号管理</span>
						</a>
					</li>
				</ul>
			</li>
		</ul>
		<!-- END SIDEBAR MENU -->
	</div>
</div>
