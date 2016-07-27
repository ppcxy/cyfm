<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
	<meta charset="utf-8"/>
	<title>cyfm:<sitemesh:title/></title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta content="width=device-width, initial-scale=1" name="viewport"/>
	<meta content="" name="description"/>
	<meta content="" name="author"/>
	<meta HTTP-EQUIV="pragma" CONTENT="no-cache">
	<meta HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
	<meta HTTP-EQUIV="expires" CONTENT="0">
<!-- ================================= Css 区域 ========================================== -->
<%@include file="/WEB-INF/views/common/import-css.jspf"%>
<link href="${ctx}/static/index/layout/css/layout.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/static/index/layout/css/themes/default.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/static/common/styles/custom.css" rel="stylesheet" type="text/css" />
	<style>
		.page-sidebar-closed .page-logo{
			display: none !important
		}

		.page-logo a:hover{
			text-decoration: none;
		}
		.page-logo a{
			FONT-SIZE: 16PX;
			MARGIN-TOP: 12PX;
			COLOR: #b4bcc8;
			font-weight: 500;
		}
	</style>
<!-- ================================= JS 区域 ========================================== -->
<%@include file="/WEB-INF/views/common/import-js.jspf"%>
<script>
	$(function () {
		var body =$('body');
		$('body').on('click', '.sidebar-toggler', function (e) {
			var sidebar = $('.page-sidebar');
			var sidebarMenu = $('.page-sidebar-menu');
			$(".sidebar-search", sidebar).removeClass("open");

			if (body.hasClass("page-sidebar-closed")) {
				body.removeClass("page-sidebar-closed");
				sidebarMenu.removeClass("page-sidebar-menu-closed");
				if ($.cookie) {
					$.cookie('sidebar_closed', '0');
				}
			} else {
				body.addClass("page-sidebar-closed");
				sidebarMenu.addClass("page-sidebar-menu-closed");
				if (body.hasClass("page-sidebar-fixed")) {
					sidebarMenu.trigger("mouseleave");
				}
				if ($.cookie) {
					$.cookie('sidebar_closed', '1');
				}
			}

			$(window).trigger('resize');
		});

		$('.page-sidebar').on('click', 'li > a', function (e) {

			if ($('body').hasClass('page-sidebar-closed') &&  $(this).parent('li').parent('.page-sidebar-menu').size() === 1) {
				return;
			}

			var hasSubMenu = $(this).next().hasClass('sub-menu');


			if (hasSubMenu === false) {

				return;
			}

			if ($(this).next().hasClass('sub-menu always-open')) {
				return;
			}

			var parent = $(this).parent().parent();
			var the = $(this);
			var menu = $('.page-sidebar-menu');
			var sub = $(this).next();

			var autoScroll = menu.data("auto-scroll");
			var slideSpeed = parseInt(menu.data("slide-speed"));
			var keepExpand = menu.data("keep-expanded");

			if (keepExpand !== true) {
				parent.children('li.open').children('a').children('.arrow').removeClass('open');
				parent.children('li.open').children('.sub-menu:not(.always-open)').slideUp(slideSpeed);
				parent.children('li.open').removeClass('open');
			}

			var slideOffeset = -200;

			if (sub.is(":visible")) {
				$('.arrow', $(this)).removeClass("open");
				$(this).parent().removeClass("open");
				sub.slideUp(slideSpeed, function () {
					if (autoScroll === true && $('body').hasClass('page-sidebar-closed') === false) {
						if ($('body').hasClass('page-sidebar-fixed')) {
							menu.slimScroll({
								'scrollTo': (the.position()).top
							});
						} else {
						}
					}
				});
			} else if (hasSubMenu) {
				$('.arrow', $(this)).addClass("open");
				$(this).parent().addClass("open");
				sub.slideDown(slideSpeed, function () {
					if (autoScroll === true && $('body').hasClass('page-sidebar-closed') === false) {
						if ($('body').hasClass('page-sidebar-fixed')) {
							menu.slimScroll({
								'scrollTo': (the.position()).top
							});
						} else {
						}
					}
				});
			}

			e.preventDefault();
		});

		// handle ajax links within sidebar menu
		$('.page-sidebar').on('click', ' li > a.ajaxify', function (e) {
			e.preventDefault();

			var url = $(this).attr("href");
			var menuContainer = $('.page-sidebar ul');
			var pageContent = $('.page-content');
			var pageContentBody = $('.page-content .page-content-body');

			menuContainer.children('li.active').removeClass('active');
			menuContainer.children('arrow.open').removeClass('open');

			$(this).parents('li').each(function () {
				$(this).addClass('active');
				$(this).children('a > span.arrow').addClass('open');
			});
			$(this).parents('li').addClass('active');



			var the = $(this);

			$.ajax({
				type: "GET",
				cache: false,
				url: url,
				dataType: "html",
				success: function (res) {
					if (the.parents('li.open').size() === 0) {
						$('.page-sidebar-menu > li.open > a').click();
					}

					pageContentBody.html(res);
					Layout.fixContentHeight(); // fix content height
				},
				error: function (xhr, ajaxOptions, thrownError) {
					pageContentBody.html('<h4>Could not load the requested content.</h4>');
				}
			});
		});
	})
</script>
<sitemesh:head />

</head>

<body class="page-header-fixed page-quick-sidebar-over-content page-sidebar-closed-hide-logo page-container-bg-solid">

	<%@ include file="/WEB-INF/layouts/default/header.jsp"%>
	<div class="page-container">
		<%@ include file="/WEB-INF/layouts/default/left.jsp"%>
		<div class="page-content-wrapper">
			<div class="page-content">
				<div class="page-bar">
					<ul class="page-breadcrumb">
						<li>
							<i class="fa fa-home"></i>
							<a href="${ctx}/">首页</a>
							<i class="fa fa-angle-right"></i>
						</li>
						<li>
							<a href="#">xxx</a>
						</li>
					</ul>
					<div class="page-toolbar">
						<div class="theme-panel hidden-xs hidden-sm">
							<div class="toggler">
							</div>
							<div class="toggler-close">
							</div>
							<div class="theme-options">
								<div class="theme-option theme-colors clearfix">
				                   countnntntn
								</div>
							</div>
						</div>
						<div id="dashboard-report-range" class="pull-right tooltips btn btn-sm btn-default" data-container="body" data-placement="bottom" data-original-title="" title="">
							<span class="nowtime"></span>
						</div>

					</div>
				</div>
				<div class="content-body">
					<sitemesh:body />
				</div>
			</div>
		</div>

	</div>
	<%@ include file="/WEB-INF/layouts/default/footer.jsp"%>

	<script>
		<cy:showFieldError commandName="entity"/>
	</script>
</body>
</html>
