<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
    <title>${cy_systemName}</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
    <meta http-equiv="Cache-Control" content="no-store" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <meta name="meta.decorator" content="content" />
    <meta name="decorator" content="content" />
    <%@include file="/WEB-INF/views/common/import-css.jspf" %>
    <link href="${ctx}/static/manage/css/layout.css?5" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/manage/css/darkblue.css?5" rel="stylesheet" type="text/css"/>
    <style>
        body{
            -webkit-user-select:none;
            -moz-user-select:none;
            -ms-user-select:none;
            user-select:none;
            overflow: hidden;
        }
        .page-header.navbar .page-logo .logo-default {
            margin: 0 0 0 0;
        }
    </style>
    <%@include file="/WEB-INF/views/common/import-js.jspf"%>
    <script src="${ctx}/static/manage/js/metronic.js" type="text/javascript"></script>
    <script src="${ctx}/static/manage/js/layout.js" type="text/javascript"></script>
    <script src="${ctx}/static/manage/js/skin-config.js?17" type="text/javascript"></script>
    <script src="${ctx}/static/manage/js/quick-sidebar.js" type="text/javascript"></script>
    <script>
        showPlace = false;
        var topHeight = 46;
        var placeHeight = 55;
        var pageLrMargin = 16;
        var footerHeight = 35;

        window.paceOptions = {
            ajax: {
                trackMethods: ['GET', 'POST']
            },
            eventLag: false,
            elements: false
        }


        function layoutManageMain() {
            var width = $(window).width();
            var height = $(window).height();

            var sidebarWidth = $(".page-sidebar").width();

            $("div.manage-main").css("width", width - sidebarWidth - pageLrMargin + "px").css("height", height - topHeight - placeHeight - footerHeight);
        }

        $(function () {
            setTimeout(function () {
                $("#rightFrame").on("load", function () {
                    console.debug("加载页面完毕解锁.");
                    top.$cy.waitingOver();
                });
            }, 500);
            $(".manage-main").css("display", "block");

            layoutManageMain();
            $(window).resize(function () {
                layoutManageMain();
            });
            $(".sidebar-toggler").click(function(){
                setTimeout(function () {
                    layoutManageMain();
                }, 200);
            })
        })
    </script>
    <style>
        div.manage-main{
            position: fixed;
        }
        div.manage-main iframe {
            width: 100%;
            height: 100%;
        }
        div.page-logo a{
            line-height: 46px;
        }
    </style>
</head>
<body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white">
<div class="page-wrapper">
    <div class="page-header -i navbar navbar-fixed-top">
        <div class="page-logo">
            <a href="${ctx}/" class="tooltips" title="${cy_systemName}" data-placement="bottom">
                <img src="${ctx}/static/images/logo.png" width="150" alt="logo" class="logo-default">
                <b class="logo-default"></b>
            </a>
            <div class="menu-toggler sidebar-toggler">
                <span></span>
            </div>
        </div>
        <div class="hor-menu hidden-sm hidden-xs">
            <ul class="nav navbar-nav">
                <!-- DOC: Remove data-hover="dropdown" and data-close-others="true" attributes below to disable the horizontal opening on mouse hover -->
                <c:forEach items="${roots}" var="root">
                    <li class="classic-menu-dropdown ${root.id == rootId ? 'active' : ''}">
                        <c:choose>
                            <c:when test="${root.resourceType eq 'rightFrame'}">
                                <a href="${ctx}/desktop/${root.id}/">
                                        ${root.name} <span class="${root.id == rootId ? 'selected' : ''}"></span>
                                </a>
                            </c:when>
                            <c:otherwise>
                                <a href="${ctx}${root.url}" target="_${root.resourceType}">
                                        ${root.name} <span class="${root.id == rootId ? 'selected' : ''}"></span>
                                </a>
                            </c:otherwise>
                        </c:choose>
                    </li>
                </c:forEach>
                <%--                <li class="classic-menu-dropdown">--%>
                <%--                    <a data-toggle="dropdown" href="javascript:;" data-hover="megamenu-dropdown" data-close-others="true">--%>
                <%--                        更多操作 <i class="fa fa-angle-down"></i>--%>
                <%--                    </a>--%>
                <%--                    <ul class="dropdown-menu pull-left">--%>
                <%--                        <li>--%>
                <%--                            <a href="javascript:;">--%>
                <%--                                <i class="fa fa-bookmark-o"></i> Section 1 </a>--%>
                <%--                        </li>--%>
                <%--                        <li>--%>
                <%--                            <a href="javascript:;">--%>
                <%--                                <i class="fa fa-user"></i> Section 2 </a>--%>
                <%--                        </li>--%>
                <%--                        <li>--%>
                <%--                            <a href="javascript:;">--%>
                <%--                                <i class="fa fa-puzzle-piece"></i> Section 3 </a>--%>
                <%--                        </li>--%>
                <%--                        <li>--%>
                <%--                            <a href="javascript:;">--%>
                <%--                                <i class="fa fa-gift"></i> Section 4 </a>--%>
                <%--                        </li>--%>
                <%--                        <li>--%>
                <%--                            <a href="javascript:;">--%>
                <%--                                <i class="fa fa-table"></i> Section 5 </a>--%>
                <%--                        </li>--%>
                <%--                        <li class="dropdown-submenu">--%>
                <%--                            <a href="javascript:;">--%>
                <%--                                <i class="fa fa-envelope-o"></i> More options </a>--%>
                <%--                            <ul class="dropdown-menu">--%>
                <%--                                <li>--%>
                <%--                                    <a href="javascript:;">--%>
                <%--                                        Second level link </a>--%>
                <%--                                </li>--%>
                <%--                                <li class="dropdown-submenu">--%>
                <%--                                    <a href="javascript:;">--%>
                <%--                                        More options </a>--%>
                <%--                                    <ul class="dropdown-menu">--%>
                <%--                                        <li>--%>
                <%--                                            <a href="index.html">--%>
                <%--                                                Third level link </a>--%>
                <%--                                        </li>--%>
                <%--                                        <li>--%>
                <%--                                            <a href="index.html">--%>
                <%--                                                Third level link </a>--%>
                <%--                                        </li>--%>
                <%--                                        <li>--%>
                <%--                                            <a href="index.html">--%>
                <%--                                                Third level link </a>--%>
                <%--                                        </li>--%>
                <%--                                        <li>--%>
                <%--                                            <a href="index.html">--%>
                <%--                                                Third level link </a>--%>
                <%--                                        </li>--%>
                <%--                                        <li>--%>
                <%--                                            <a href="index.html">--%>
                <%--                                                Third level link </a>--%>
                <%--                                        </li>--%>
                <%--                                    </ul>--%>
                <%--                                </li>--%>
                <%--                                <li>--%>
                <%--                                    <a href="index.html">--%>
                <%--                                        Second level link </a>--%>
                <%--                                </li>--%>
                <%--                                <li>--%>
                <%--                                    <a href="index.html">--%>
                <%--                                        Second level link </a>--%>
                <%--                                </li>--%>
                <%--                                <li>--%>
                <%--                                    <a href="index.html">--%>
                <%--                                        Second level link </a>--%>
                <%--                                </li>--%>
                <%--                            </ul>--%>
                <%--                        </li>--%>
                <%--                    </ul>--%>
                <%--                </li>--%>
            </ul>
        </div>
        <a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse">
        </a>
        <div class="top-menu">
            <ul class="nav navbar-nav pull-right">
                <li class="dropdown dropdown-extended dropdown-notification" id="header_notification_bar">
                    <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                        <i class="icon-bell"></i>
                        <span class="badge badge-default notice_count"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li class="external">
                            <h3>共 <span class="bold notice_count">0 </span> 条未读通知</h3>
                            <a href="${ctx}/manage/maintain/notification?search.read_eq=false" target="rightFrame">查看所有</a>
                        </li>
                        <li>
                            <ul class="dropdown-menu-list scroller notification-list" style="height: 250px;" data-handle-color="#637283">

                            </ul>
                        </li>
                    </ul>
                </li>
                <li class="dropdown dropdown-user">
                    <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                        <img alt="" class="img-circle" src="${ctx}/static/manage/img/avatar.png"/>
                        <span class="username username-hide-on-mobile">
					        <shiro:principal property="name"/>
                        </span>
                        <i class="fa fa-angle-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-default">
                        <li>
                            <a href="${ctx}/personal/profile" target="rightFrame">
                                <i class="icon-user"></i> 个人中心 </a>
                        </li>
                        <li class="divider">
                        </li>
                        <c:if test="${!existPreUser}">
                            <shiro:hasRole name="Admin">
                                <li>
                                    <a href="javascript:void(0);" onclick="$cy.tools.chooseUser({callback: function (show, result) {$cy.confirm({message: '是否切换到用户：' + show, yes: function () {window.location.href = '${ctx}/sys/admin/switchToUser?userName=' + result.data('username');}})}})">
                                        <i class="icon-user"></i> 切换用户 </a>
                                </li>
                                <li class="divider">
                                </li>
                            </shiro:hasRole>
                        </c:if>
                        <c:if test="${existPreUser}">
                            <li>
                                <a href="${ctx}/sys/admin/mainJob">
                                    <i class="icon-retweet"></i> 返回主用户
                                </a>
                            </li>
                            <li class="divider">
                            </li>
                        </c:if>
                        <li>
                            <a href="javascript:;" onclick="lockScreen()">
                                <i class="icon-lock"></i> 锁定屏幕 </a>
                        </li>
                        <li>
                            <a href="${ctx}/exitSystem">
                                <i class="icon-key"></i> 退出系统 </a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown dropdown-quick-sidebar-toggler-1">
                    <a title="退出系统" onclick="$cy.confirm({title:'退出系统',message:'是否退出系统？', yes:function(i,o){window.location.href='${ctx}/exitSystem'}})" href1="javascript:;" class="dropdown-toggle">
                        <i class="icon-logout"></i>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <div class="clearfix"> </div>
    <div class="page-container">
        <div class="page-sidebar-wrapper">
            <div class="page-sidebar navbar-collapse collapse">
                <ul class="page-sidebar-menu  page-header-fixed" data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200">
                    <!-- DOC: To remove the sidebar toggler from the sidebar you just need to completely remove the below "sidebar-toggler-wrapper" LI element -->
                    <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
                    <li class="sidebar-toggler-wrapper hide">
                        <div class="sidebar-toggler">
                            <span></span>
                        </div>
                    </li>
                    <!-- END SIDEBAR TOGGLER BUTTON -->
                    <!-- DOC: To remove the search box from the sidebar you just need to completely remove the below "sidebar-search-wrapper" LI element -->
                    <li class="sidebar-search-wrapper">
                        <!-- BEGIN RESPONSIVE QUICK SEARCH FORM -->
                        <!-- DOC: Apply "sidebar-search-bordered" class the below search form to have bordered search box -->
                        <!-- DOC: Apply "sidebar-search-bordered sidebar-search-solid" class the below search form to have bordered & solid search box -->
                        <form class="sidebar-search" action="#" method="POST">
                            <a href="javascript:;" class="remove">
                                <i class="icon-close"></i>
                            </a>
                            <div class="input-group">
                                <input type="text" name="searchText" value="${searchText}" class="form-control" placeholder="快速查找...">
                                <span class="input-group-btn">
                                            <a href="javascript:void(0);" class="btn submit">
                                                <i class="icon-magnifier"></i>
                                            </a>
                                        </span>
                            </div>
                        </form>
                        <!-- END RESPONSIVE QUICK SEARCH FORM -->
                    </li>
                    <%--<li class="heading">--%>
                    <%--<h3 class="uppercase">系统管理</h3>--%>
                    <%--</li>--%>
                    <c:forEach items="${menus}" var="m" varStatus="s">
                        <li class="nav-item ${s.index eq 0 ? 'start active open' : ''}">
                            <a href="javascript:;" class="nav-link nav-toggle">
                                <i class="${m.icon}"></i>
                                <span class="title">${m.name}</span>
                                <span class="selected"></span>
                                <span class="arrow ${s.index eq 0 ? 'open' : ''}"></span>
                            </a>
                            <ul class="sub-menu">
                                <c:forEach items="${m.children}" var="c">
                                    <cy:submenu menu="${c}" parentName="${m.name}"/>
                                </c:forEach>
                            </ul>
                        </li>
                    </c:forEach>
                </ul>
                <%--<iframe src="${ctx}/manage/left/1/" name="leftFrame" scrolling="No" noresize="noresize" id="leftFrame"--%>
                <%--title="leftFrame" frameborder=no--%>
                <%--border=0></iframe>--%>
            </div>
        </div>
        <div class="page-content-wrapper">
            <div class="page-content" style="min-height: 1112px;">
                <div class="page-bar place">
                    <ul class="page-breadcrumb placeul">
                        <li class="default">
                            <a href="${ctx}${root.url}" target="rightFrame">首页</a>
                        </li>
                    </ul>
                    <div class="page-toolbar">
                        <!-- BEGIN STYLE CUSTOMIZER -->
                        <div class="theme-panel hidden-xs hidden-sm">
                            <div class="toggler hidden">
                            </div>
                            <div class="toggler-close">
                            </div>
                            <div class="theme-options">
                                <div class="theme-option theme-colors clearfix">
						<span>
						皮肤设定 </span>
                                    <ul>
                                        <li class="color-default current tooltips" data-style="default" data-container="body" data-original-title="Default">
                                        </li>
                                        <li class="color-darkblue tooltips" data-style="darkblue" data-container="body" data-original-title="Dark Blue">
                                        </li>
                                        <li class="color-blue tooltips" data-style="blue" data-container="body" data-original-title="Blue">
                                        </li>
                                        <li class="color-grey tooltips" data-style="grey" data-container="body" data-original-title="Grey">
                                        </li>
                                        <li class="color-light tooltips" data-style="light" data-container="body" data-original-title="Light">
                                        </li>
                                        <li class="color-light2 tooltips" data-style="light2" data-container="body" data-html="true" data-original-title="Light 2">
                                        </li>
                                    </ul>
                                </div>
                                <div class="theme-option">
						<span>
						皮肤风格 </span>
                                    <select class="layout-style-option form-control input-sm">
                                        <option value="square" selected="selected">方角</option>
                                        <option value="rounded">圆角</option>
                                    </select>
                                </div>
                                <div class="theme-option">
						<span>
						布局 </span>
                                    <select class="layout-option form-control input-sm">
                                        <option value="fluid" selected="selected">全屏</option>
                                        <option value="boxed">居中</option>
                                    </select>
                                </div>
                                <div class="theme-option">
						<span>
						头部 </span>
                                    <select class="page-header-option form-control input-sm">
                                        <option value="fixed" selected="selected">固定</option>
                                        <option value="default">默认</option>
                                    </select>
                                </div>
                                <div class="theme-option">
						<span>
						顶部菜单下拉</span>
                                    <select class="page-header-top-dropdown-style-option form-control input-sm">
                                        <option value="light" selected="selected">浅色</option>
                                        <option value="dark">深色</option>
                                    </select>
                                </div>
                                <div class="theme-option">
						<span>
						侧边栏模式</span>
                                    <select class="sidebar-option form-control input-sm">
                                        <option value="fixed" selected="selected">固定</option>
                                        <%--<option value="default">经典</option>--%>
                                    </select>
                                </div>
                                <div class="theme-option">
						<span>
						侧边栏菜单 </span>
                                    <select class="sidebar-menu-option form-control input-sm">
                                        <option value="accordion" selected="selected">折叠模式</option>
                                        <%--<option value="hover">悬浮模式</option>--%>
                                    </select>
                                </div>
                                <div class="theme-option">
						<span>
						侧边栏样式 </span>
                                    <select class="sidebar-style-option form-control input-sm">
                                        <option value="default" selected="selected">默认</option>
                                        <option value="light">经典</option>
                                    </select>
                                </div>
                                <div class="theme-option">
						<span>
						侧边栏位置 </span>
                                    <select class="sidebar-pos-option form-control input-sm">
                                        <option value="left" selected="selected">左侧</option>
                                        <option value="right">右侧</option>
                                    </select>
                                </div>
                                <div class="theme-option">
						<span>
						底部版权信息 </span>
                                    <select class="page-footer-option form-control input-sm">
                                        <option value="fixed" selected="selected">固定</option>
                                        <%--<option value="default" >默认</option>--%>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <!-- END STYLE CUSTOMIZER -->
                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="manage-main">
                    <iframe src="${ctx}${root.url}" name="rightFrame" id="rightFrame" title="" frameborder=no border=0></iframe>
                </div>
            </div>
        </div>
    </div>
    <!-- BEGIN FOOTER -->
    <div class="page-footer">
        <div class="page-footer-inner">
            <%@include file="/WEB-INF/views/common/footer.jsp"%>
        </div>
        <div class="scroll-to-top">
            <i class="icon-arrow-up"></i>
        </div>
    </div>
    <!-- END FOOTER -->
    <!-- BEGIN QUICK SIDEBAR -->
    <a href="javascript:;" class="page-quick-sidebar-toggler"><i class="icon-close"></i></a>
    <div class="page-quick-sidebar-wrapper">
        <div class="page-quick-sidebar">
            <div class="nav-justified">
                <ul class="nav nav-tabs nav-justified">
                    <li class="active">
                        <a href="#quick_sidebar_tab_1" data-toggle="tab">
                            Users <span class="badge badge-danger">2</span>
                        </a>
                    </li>
                    <li>
                        <a href="#quick_sidebar_tab_2" data-toggle="tab">
                            Alerts <span class="badge badge-success">7</span>
                        </a>
                    </li>
                    <li class="dropdown">
                        <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">
                            More<i class="fa fa-angle-down"></i>
                        </a>
                        <ul class="dropdown-menu pull-right" role="menu">
                            <li>
                                <a href="#quick_sidebar_tab_3" data-toggle="tab">
                                    <i class="icon-bell"></i> Alerts </a>
                            </li>
                            <li>
                                <a href="#quick_sidebar_tab_3" data-toggle="tab">
                                    <i class="icon-info"></i> Notifications </a>
                            </li>
                            <li>
                                <a href="#quick_sidebar_tab_3" data-toggle="tab">
                                    <i class="icon-speech"></i> Activities </a>
                            </li>
                            <li class="divider">
                            </li>
                            <li>
                                <a href="#quick_sidebar_tab_3" data-toggle="tab">
                                    <i class="icon-settings"></i> Settings </a>
                            </li>
                        </ul>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active page-quick-sidebar-chat" id="quick_sidebar_tab_1">
                        111222
                    </div>
                    <div class="tab-pane page-quick-sidebar-alerts" id="quick_sidebar_tab_2">
                        333444
                    </div>
                    <div class="tab-pane page-quick-sidebar-settings" id="quick_sidebar_tab_3">
                        111222333444555
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- END QUICK SIDEBAR -->
</div>
<script type="text/javascript">
    $(function () {
        //导航切换
        $(".nav-item a").click(function () {
            if ($(this).is("a[target]")) {
                $("li.nav-item.active").removeClass("active");
                $("li.nav-item.open").addClass("active");
                $(this).parent("li.nav-item").addClass("active");
                $cy.place.clean()
            }
        });
    })
</script>
<script type="text/javascript">
    $(function(){
        //顶部导航切换
        $cy.sysNotice.init();

        $(".user").click(function () {
            //iframe窗
            top.layer.open({
                type: 2,
                title: '系统通知',
                shadeClose: true,
                shade: 0.3,
                maxmin: true, //开启最大化最小化按钮
                area: ['400px', '600px'],
                content: '${ctx}/manage/maintain/notification/list/unread'
            });
            /*top.layer.open({
                type: 2,
                title: false,
                closeBtn: 0, //不显示关闭按钮
                shade: [0],
                area: ['340px', '215px'],
                offset: 'rb', //右下角弹出
                time: 2000, //2秒后自动关闭
                anim: 2,
                content: ['test/guodu.html', 'no'], //iframe的url，no代表不显示滚动条
                end: function () { //此处用于演示

                }
            });*/
        });
    })

</script>
<script>
    window.name = "mainFrame";
    Metronic.init(); // init metronic core componets
    Layout.init(); // init layout
    QuickSidebar.init(); // init quick sidebar
    skinConf.init(); // init skin features
    function lockScreen(message) {
        if (!message) {
            message = "您已锁屏离开";
        }
        $.blockUI({
            message: message,
            baseZ: 9999,
            css: {
                border: 'none',
                padding: '15px',
                backgroundColor: '#000',
                opacity: 0.15,
                color: '#fff',
            }
        });
    }

    $("[data-target-type]").each(function () {
        var targetType = $(this).data("target-type");
        switch (targetType) {
                // case "default":;
                // case "ajax":
            case "blank":
                $(this).attr("target", "_blank");
                break;
            case "self":
                $(this).attr("target", "_self");
                break;
            case "dialog":
                var menuHref = $(this).attr("href");
                $(this).click(function () {
                    layer.open({
                        type: 2,
                        area:['1024px','650px'],
                        content: menuHref
                    });
                    return false;
                });
                break
            case "fullDialog":
                var menuHref = $(this).attr("href");
                $(this).click(function () {
                    var index = layer.open({
                        type: 2,
                        content: menuHref
                    });
                    layer.full(index);
                    return false;
                });
                break
            default:
                $(this).attr("target", "rightFrame");
                break;
        }
    });
</script>
</body>
</html>
