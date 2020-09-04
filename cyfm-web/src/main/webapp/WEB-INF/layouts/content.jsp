<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
    <title>${cy_systemName}:<sitemesh:title/></title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <meta http-equiv="Cache-Control" content="no-store"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <!-- ================================= Css 区域 ========================================== -->
    <%@include file="/WEB-INF/views/common/import-css.jspf" %>
    <!-- ================================= JS 区域 ========================================== -->
    <script>
        var $cy = {};
        var showPlace= true;
        var _isMobile = 'createTouch' in document && !('onmousemove' in document)
                || /(iPhone|iPad|iPod)/i.test(navigator.userAgent);
    </script>
    <%@include file="/WEB-INF/views/common/import-js.jspf" %>
    <sitemesh:head/>
    <style>
        .listTableWrap{
            visibility: hidden;
        }
    </style>
    <script>
        var placeTarget = undefined;
    </script>
</head>
<body style="padding: 5px !important;">
<c:if test="${not empty message or not empty errorMessage}">
    <cy:showMessage/>
</c:if>
<c:if test="${not empty page && not customToolbar}">
    <div class="tools btn-toolbar">
        <cy:listToolBarActions/>
    </div>
</c:if>
<div class="content-wrap">
    <sitemesh:body/>
</div>
<!-- BEGIN FOOTER -->
<div class="page-footer">
    <div class="scroll-box hidden">
        <div class="scroll"></div>
    </div>
    <div class="scroll-to-top">
        <i class="icon-arrow-up"></i>
    </div>
</div>
<!-- END FOOTER -->
<script>
    setTimeout(function () {
        // if (!_isMobile && $(".listTableWrap #contentTable").width() > 100) {
        //     $(".scroll-box .scroll").width($(".listTableWrap #contentTable").width()+11).css("height", "1px");
        //     $(".page-footer .scroll-box").width($(".listTableWrap").width() + 8).css({
        //         "overflow-x": "overlay",
        //         "height": "15px"
        //     }).scroll(function (e) {
        //         e.preventDefault();
        //         var py = $(this).scrollLeft();
        //         $(".listTableWrap").animate({scrollLeft: py}, 10);
        //     }).removeClass("hidden");
        //     // 已处理为隐藏状态，为了兼容苹果触控板滑动效果
        //     // $(".listTableWrap").css({"overflow": "hidden"});
        // }
    },100);
</script>
<script>
    var index = parent.layer.getFrameIndex(window.name);
    if ((top == parent ||  top.name=='mainFrame') && !index && showPlace){
        $cy.place.appendUrl(document.title.substring("${cy_systemName}".length+1), urlPrefix, urlSuffix, placeTarget);
    }
    <cy:showFieldError commandName="entity"/>
</script>
<script>
    var theadTop = 0;

    function initTableContentHeight(xz) {

        if (!xz) {
            xz = 0;
        }
        if (typeof cx != "undefined") {
            xz = xz + cx;
        }
        var xh = 20 + xz;

        if ($(".tools .more:visible,.config:visible").size() > 0) {
            xh += 45;
        } else {
            // $(".tools:first").hide();
        }
        xh += $(".form-search:visible").height();
        if ($(".nav-tabs").size()>0) {
            xh += 48;
        }
        if ($(".page-bar:visible").size() > 0) {
            xh += 45;
        }

        if ($(".tab-content:visible").size() > 0) {
            // xh += 16;
        }
        if ($(".alert.alert-success:visible,.alert.alert-error:visible").size() > 0) {
            xh += 70;
        }

        var bg = $(window).height() - xh;
        var tg = $("#contentTable:visible").height();
        tg = tg ? tg : 6666;
        // console.log(tg,bg,tg > bg ? bg : tg + 25)
        $(".listTableWrap").height(tg > bg ? bg : tg + 25).css({"visibility":"visible"});
    }
    $(function () {
        var $wrap = $(".listTableWrap");

        setTimeout(function () {
            var $thead = $wrap.find("#contentTable thead");
            if ($thead.size() > 0) {
                /**
                 * scroll handle
                 * @param {event} e -- scroll event
                 */
                function scrollHandle(e) {
                    var scrollTop = $wrap.scrollTop();
                    if ((scrollTop - theadTop) == 0) {
                        $thead.find("tr").css({
                            "transform": ""
                        });
                        return;
                    }
                    $thead.find("tr").css({
                        "transform": "translateY(" + (scrollTop - theadTop) + "px)"
                    });
                }

                $wrap.on('scroll', scrollHandle)
            }
            //}
        }, 100);

        initTableContentHeight(20);
    });
</script>
</body>
</html>
