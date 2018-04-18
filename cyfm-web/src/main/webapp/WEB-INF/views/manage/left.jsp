<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <!-- ================================= Css 区域 ========================================== -->
    <%@include file="/WEB-INF/views/common/import-css.jspf" %>
    <link href="${ctx}/static/manage/css/style.css" rel="stylesheet" type="text/css"/>
    <!-- ================================= JS 区域 ========================================== -->
    <title>左侧菜树</title>
    <%@include file="/WEB-INF/views/common/import-js.jspf" %>
    <script type="text/javascript">
        $(function () {
            //导航切换
            $(".menuson li").click(function () {
                //TODO 导航切换不锁,等待写锁div方案
                //parent.$cy.waiting();
                $(".menuson li.active").removeClass("active");
                $(this).addClass("active");
            });

            $('.title').click(function () {
                var $ul = $(this).next('ul');
                $('dd').find('ul').slideUp();
                if ($ul.is(':visible')) {
                    $(this).next('ul').slideUp();
                } else {
                    $(this).next('ul').slideDown();
                }
            });
        })
    </script>
</head>
<body style="background:#f0f9fd;">

<div class="lefttop"><span></span>系统设置</div>

<dl class="leftmenu">
    <c:forEach items="${menus}" var="m">
        <dd>
            <div class="title">
                <span><i class="${m.icon}"></i></span>${m.name}
            </div>
            <ul class="menuson">
                <c:forEach items="${m.children}" var="c">
                    <cy:submenu menu="${c}" parentName="${m.name}"/>
                </c:forEach>
            </ul>
        </dd>
    </c:forEach>
    <dd>
        <div class="title">
            <span><img src="${ctx}/static/manage/images/leftico02.png"/></span>演示说明
        </div>
        <ul class="menuson">
            <li><cite></cite><a id="persistence-tab" href="${ctx}/story/persistence"
                                target="rightFrame">持久化高级演示</a><i></i></li>
            <li><cite></cite><a id="jms-tab" href="${ctx}/story/jms" target="rightFrame">JMS演示</a><i></i></li>
            <li><cite></cite><a id="cache-tab" href="${ctx}/story/cache" target="rightFrame">Cache演示</a><i></i></li>
            <li><cite></cite><a id="security-tab" href="${ctx}/story/security" target="rightFrame">安全高级演示</a><i></i>
            </li>
            <li><cite></cite><a id="utilizes-tab" href="${ctx}/story/utilizes" target="rightFrame">工具类演示</a><i></i></li>
            <li><cite></cite><a id="executablewar-tab" href="${ctx}/story/executablewar"
                                target="rightFrame">可运行war包演示</a><i></i></li>
        </ul>
    </dd>
</dl>
</body>
</html>
