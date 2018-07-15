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
    <style>
        body{
            overflow: hidden;
        }
    </style>
    <%@include file="/WEB-INF/views/common/import-js.jspf"%>
    <script>
        window.paceOptions = {
            ajax: {
                trackMethods: ['GET', 'POST']
            },
            eventLag: false,
            elements: false
        }

        function contentUrl(url){
            $("#rightFrame").attr("src",url);
            leftFrameRefresh();
        }

        function leftFrameRefresh() {
            $("#leftFrame").load(function(){
                $(".left-reorder",$("#leftFrame")[0].contentWindow.document).click(function () {
                    $(".left").width("0px");
                    $(".right").width($(".right",window.parent.document).width()+187);
                    $(".left-control").removeClass("hidden");
                })
            });
        }

        function layoutManageMain(){
            var width = $(window).width();
            var height = $(window).height();

            $("div.content").css({"width":width,"height": height - 88 + "px"});
            $("div.right").css("width", width - 187 + "px").css("height", height - 88 - 35);
        }
        
        $(function () {
            $("#leftFrame").on("load", function () {
                $cy.waitingOver();
                $("#rightFrame").on("load", function () {
                    $cy.waitingOver();
                });
                $(".manage-main").css("display", "block");
            });

            $cy.waiting();
            layoutManageMain();
            $(window).resize(function () {
                layoutManageMain();
            });

            $(".left-control").click(function(){
                $(".left").width("187px");
                $(".right").width($(".right",window.parent.document).width()-187);
                $(".left-control").addClass("hidden");
            })
            leftFrameRefresh();
        })
    </script>
</head>
<body>
<div class="manage-main" >
    <div class="top"><iframe src="${ctx}/manage/top/" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" title="topFrame" frameborder=no
                             border=0></iframe></div>
    <div class="content">
        <div class="left">
            <iframe src="${ctx}/manage/left/1/" name="leftFrame" scrolling="No" noresize="noresize" id="leftFrame"
                    title="leftFrame" frameborder=no
                    border=0></iframe>
        </div>
        <div class="place">
            <span class="hidden left-control" style="cursor: pointer;color:#979797;padding-top:1px;"><i class="fa fa-reorder icon-large" style="line-height: 16px"></i></span>
            <span>位置：</span>
            <ul class="placeul">
                <li class="default"><a href="${ctx}/">首页</a></li>
            </ul>
        </div>
        <div class="right" style="position: fixed;margin-top:40px;">
            <iframe src="${ctx}/manage/index/" name="rightFrame" id="rightFrame" title="rightFrame" frameborder=no border=0></iframe>
        </div>
    </div>
</div>
</body>
</html>
