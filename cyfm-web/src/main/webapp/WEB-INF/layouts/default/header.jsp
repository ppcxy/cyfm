<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<div id="header" class="row hidden">
	<div><h1>Showcase示例<small>--开源项目大派对</small></h1></div>
	<div class="pull-right">
		<shiro:guest><a href="${ctx}/login">登录</a></shiro:guest>
		<shiro:user>你好, <shiro:principal property="name"/> <a href="${ctx}/logout">退出登录</a></shiro:user>
	</div>
</div>
<div class="page-header navbar navbar-fixed-top">
	<!-- BEGIN HEADER INNER -->
	<div class="page-header-inner">
		<!-- BEGIN LOGO -->
		<div class="page-logo">
			<a href="${ctx}">
				CYFM快速开发框架
				<%--<img src="${ctx}/static/admin/layout/img/logo-big-white.png" alt="logo" class="logo-default"/>--%>
			</a>
			<div class="menu-toggler sidebar-toggler hide">
			</div>
		</div>
		<div class="hor-menu hor-menu-light hidden-sm hidden-xs">
			<!-- DOC: Remove data-hover="dropdown" and data-close-others="true" attributes below to disable the horizontal opening on mouse hover -->
			<ul class="nav navbar-nav">
				<li class="classic-menu-dropdown active">
					<a href="${ctx}/">
						系统功能 <span class="selected">
					</span>
					</a>
				</li>
			</ul>
		</div>
		<!-- END LOGO -->
		<!-- BEGIN RESPONSIVE MENU TOGGLER -->
		<a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse"></a>
		<!-- END RESPONSIVE MENU TOGGLER -->
		<!-- BEGIN TOP NAVIGATION MENU -->
		<div class="top-menu">
			<ul class="nav navbar-nav pull-right">
				<!-- BEGIN NOTIFICATION DROPDOWN -->
				<!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
				<li class="dropdown dropdown-extended dropdown-notification" id="header_notification_bar">
					<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
						<i class="icon-bell"></i>
					</a>
					<ul class="dropdown-menu">
						<li class="external">
							<h3><span class="bold">0 </span> 条未读通知</h3>
							<a href="javascript:;">查看全部</a>
						</li>
						<li>
							<ul class="dropdown-menu-list scroller notification-list" style="height: 250px;" data-handle-color="#637283">
							</ul>
						</li>
					</ul>
				</li>
				<!-- END NOTIFICATION DROPDOWN -->
				<!-- BEGIN INBOX DROPDOWN -->
				<!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
				<li class="dropdown dropdown-extended dropdown-inbox" id="header_inbox_bar">
					<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
						<i class="icon-envelope-open"></i>
					</a>
					<ul class="dropdown-menu">
						<li class="external">
							<h3>你有 <span class="bold">0 </span> 条未读消息</h3>
							<a href="javascript:;">查看全部</a>
						</li>
						<li>
							<ul class="dropdown-menu-list scroller message-list" style="height: 250px;" data-handle-color="#637283">
							</ul>
						</li>
					</ul>
				</li>
				<!-- END TODO DROPDOWN -->
				<!-- BEGIN USER LOGIN DROPDOWN -->
				<!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
				<li class="dropdown dropdown-user">
					<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
						<img alt="" class="img-circle" src="${ctx}/static/index/layout/img/avatar3_small.jpg"/>
					<span class="username username-hide-on-mobile">
					<shiro:principal property="name"/> </span>
						<i class="fa fa-angle-down"></i>
					</a>
					<ul class="dropdown-menu dropdown-menu-default">
						<li>
							<a href="javascript:;">
								<i class="icon-user"></i> 个人信息 </a>
						</li>
						<li class="divider">
						<li>
							<a href="javascript:;">
								<i class="icon-calendar"></i> 日程表 </a>
						</li>
						<li>
							<a href="javascript:;">
								<i class="icon-envelope-open"></i> 收件箱
							</a>
						</li>
						<li>
							<a href="javascript:;">
								<i class="icon-rocket"></i> 我的任务
							</a>
						</li>
						<li class="divider">
						</li>
						<li>
							<a href="${ctx}/exitSystem">
								<i class="icon-key"></i> 注销 </a>
						</li>
					</ul>
				</li>
				<!-- END USER LOGIN DROPDOWN -->
				<!-- BEGIN QUICK SIDEBAR TOGGLER -->
				<!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
				<li class="dropdown dropdown-quick-sidebar-toggler">
					<a href="javascript:;" class="dropdown-toggle">
						<i class="icon-logout"></i>
					</a>
				</li>
				<!-- END QUICK SIDEBAR TOGGLER -->
			</ul>
		</div>
		<!-- END TOP NAVIGATION MENU -->
	</div>
	<!-- END HEADER INNER -->
</div>
<!-- END HEADER -->
<div class="clearfix"></div>
