<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
    <title>后台管理首页</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
    <meta http-equiv="Cache-Control" content="no-store" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <meta name="meta.decorator" content="content" />
    <meta name="decorator" content="content" />
    <link href="${ctx}/static/manage/css/style.css" rel="stylesheet" type="text/css" />
    <style>
        body{
            overflow: hidden;
        }
        div {
            width: 100%;
        }
        div.rightinfo{
            margin: 0;
            padding: 0;
        }
        div.manage-main{
            display: none;
        }

        .manage-main * {
            box-sizing: content-box;
            -moz-box-sizing: content-box;
            -webkit-box-sizing: content-box;
            overflow: hidden;
        }

        div.manage-main iframe {
            width: 100%;
            height: 100%;
        }

        div.top, div.top iframe {
            height: 88px;
        }

        div.content div{
            float: left;
            display: inline;
        }

        div.content div.left {
            width: 187px;
            height: 100%;
        }

        div.content div.right  {
            height: 100%;
        }
        div.content div.right iframe {
            width: 100%;
        }
        div.place{
            /*position: relative;*/
        }
    </style>
    <title>cyfm:后台管理</title>
    <script type="text/javascript" src="${ctx}/static/plugins/jquery/jquery-1.9.1.min.js"></script>
    <script src="${ctx}/static/plugins/layer-dialog/layer-dialog.dev.js" type="text/javascript"></script>
    <script type="text/javascript" src="${ctx}/static/plugins/jquery.cokie.min.js"></script>
    <!-- cy api封装 -->
    <script src="${ctx}/static/common/js/common.js" type="text/javascript"></script>
    <script>


        function layoutManageMain(){
            var width = $(window).width();
            var height = $(window).height();

            $("div.content").css({"width":width,"height": height - 88 + "px"});
            $("div.right").css("width", width - 187 + "px");
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
        })
    </script>
</head>
<body>
<div class="manage-main">
    <div class="top"><iframe src="${ctx}/manage/top/" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" title="topFrame"></iframe></div>
    <div class="content">
        <div class="left">
            <iframe src="${ctx}/manage/left/" name="leftFrame" scrolling="No" noresize="noresize" id="leftFrame"
                    title="leftFrame"></iframe>
        </div>
        <div class="right">
            <div class="place">
                <span>位置：</span>
                <ul class="placeul">
                    <li><a href="#">首页</a></li>
                </ul>
            </div>
            <iframe src="${ctx}/manage/index/" name="rightFrame" id="rightFrame" title="rightFrame"></iframe>
        </div>
    </div>
</div>
</body>
</html>
