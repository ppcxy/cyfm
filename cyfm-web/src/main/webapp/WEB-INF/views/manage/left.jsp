<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <!-- ================================= Css 区域 ========================================== -->
    <%@include file="/WEB-INF/views/common/import-css.jspf" %>
    <style type="text/css">
        body {
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }
        body>div{
            width: 187px;
        }
    </style>
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

                $cy.place.clean()
            });

            $('.title').click(function () {
                $(this).addClass("open").siblings().remove("open")
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
<div class="left-container">
<div class="lefttop">
    <span class="${root.icon} icon-large"></span> ${root.name}
    <div class="left-reorder" style="cursor: pointer;float:right;padding-right: 10px;margin-top: 15px;">
        <i class="fa fa-reorder icon-large"></i>
    </div>
</div>

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
</dl>
</div>
</body>
</html>
