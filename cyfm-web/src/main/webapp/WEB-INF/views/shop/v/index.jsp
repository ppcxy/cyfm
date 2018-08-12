<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!-- ================================= Css 公用区域开始 ========================================== -->
    <link type="image/x-icon" href="${ctx}/static/images/favicon.ico" rel="shortcut icon">

    <!-- 插件扩展区 bengin-->
    <link href="${ctx}/static/plugins/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/plugins/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet" />

    <link href="${ctx}/static/plugins/jquery-validation/1.15.0/validate.css" type="text/css" rel="stylesheet" />
    <link href="${ctx}/static/plugins/jquery-ui-bootstrap/css/custom-theme/jquery-ui-1.10.3.custom.css" type="text/css" rel="stylesheet" />
    <link href="${ctx}/static/plugins/jquery-ui-bootstrap/css/layout-default-1.3.0.css" type="text/css" rel="stylesheet" />
    <link href="${ctx}/static/plugins/uniform/css/uniform.default.min.css" type="text/css" rel="stylesheet" />
    <link href="${ctx}/static/plugins/table-drag-sort-resize/table-drag-sort-resize.css" rel="stylesheet" type="text/css" />
    <!-- 插件扩展区 end-->

    <link href="${ctx}/static/shop/assets/css/style.css" rel="stylesheet" />
    <title>首页</title>

</head>
<body>
<jsp:include page="../common/vHeader.jsp?open= open"/>
<div class="container">
    <!-- 内容部分开始 -->

    <!-- 第一行 轮播广告 开始 -->
    <div class="row first lazy">
        <div class="col-lg-2"></div>
        <div class="col-lg-8">
            <div id="focus_carousel" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#focus_carousel" data-slide-to="0" class="active"></li>
                    <li data-target="#focus_carousel" data-slide-to="1" class=""></li>
                    <li data-target="#focus_carousel" data-slide-to="2" class=""></li>
                    <li data-target="#focus_carousel" data-slide-to="3" class=""></li>
                </ol>
                <div class="carousel-inner">
                    <div class="item active">
                        <img src="${ctx}/static/shop/assets/img/advertise/focus-ban-3.jpg" />
                    </div>
                    <div class="item">
                        <img src="${ctx}/static/shop/assets/img/advertise/focus-ban-5.jpg" />
                    </div>
                    <div class="item">
                        <img src="${ctx}/static/shop/assets/img/advertise/focus-ban-6.jpg" />
                    </div>
                    <div class="item">
                        <img src="${ctx}/static/shop/assets/img/advertise/focus-ban-3.jpg" />
                    </div>
                </div>
                <a class="left carousel-control" href="#focus_carousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
                <a class="right carousel-control" href="#focus_carousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
            </div>
            <div id="topic_scroll" class="topic-scroll carousel slide">
                <div class="carousel-inner">
                    <div class="item active">
                        <ul class="topic-list">
                            <li><a href="">
                                <img alt="" src="${ctx}/static/shop/assets/img/advertise/focus-ban-3.jpg" /></a></li>
                            <li><a href="">
                                <img alt="" src="${ctx}/static/shop/assets/img/advertise/focus-ban-3.jpg" /></a></li>
                            <li><a href="">
                                <img alt="" src="${ctx}/static/shop/assets/img/advertise/focus-ban-3.jpg" /></a></li>
                            <li><a href="">
                                <img alt="" src="${ctx}/static/shop/assets/img/advertise/focus-ban-3.jpg" /></a></li>
                        </ul>
                    </div>
                    <div class="item">
                        <ul class="topic-list">
                            <li><a href="">
                                <img alt="" src="${ctx}/static/shop/assets/img/advertise/focus-ban-5.jpg" /></a></li>
                            <li><a href="">
                                <img alt="" src="${ctx}/static/shop/assets/img/advertise/focus-ban-5.jpg" /></a></li>
                            <li><a href="">
                                <img alt="" src="${ctx}/static/shop/assets/img/advertise/focus-ban-5.jpg" /></a></li>
                            <li><a href="">
                                <img alt="" src="${ctx}/static/shop/assets/img/advertise/focus-ban-5.jpg" /></a></li>
                        </ul>
                    </div>
                    <div class="item">
                        <ul class="topic-list">
                            <li><a href="">
                                <img alt="" src="${ctx}/static/shop/assets/img/advertise/focus-ban-6.jpg" /></a></li>
                            <li><a href="">
                                <img alt="" src="${ctx}/static/shop/assets/img/advertise/focus-ban-6.jpg" /></a></li>
                            <li><a href="">
                                <img alt="" src="${ctx}/static/shop/assets/img/advertise/focus-ban-6.jpg" /></a></li>
                            <li><a href="">
                                <img alt="" src="${ctx}/static/shop/assets/img/advertise/focus-ban-6.jpg" /></a></li>
                        </ul>
                    </div>
                </div>
                <a class="left carousel-control" href="#topic_scroll" data-slide="prev"><i class="glyphicon glyphicon-chevron-left"></i></a>
                <a class="right carousel-control" href="#topic_scroll" data-slide="next"><i class="glyphicon glyphicon-chevron-right"></i></a>
            </div>
        </div>
        <div class="col-lg-2">
            <div class="mb10">
                <img alt="" src="${ctx}/static/shop/assets/img/advertise/ad-right-1.jpg" />
            </div>
            <div class="mb10">
                <img alt="" src="${ctx}/static/shop/assets/img/advertise/ad-right-2.jpg" />
            </div>
            <div class="mb10">
                <img alt="" src="${ctx}/static/shop/assets/img/advertise/ad-right-3.jpg" />
            </div>
            <div class="mb10">
                <img alt="" src="${ctx}/static/shop/assets/img/advertise/ad-right-4.jpg" />
            </div>
            <div>
                <img alt="" src="${ctx}/static/shop/assets/img/advertise/ad-right-5.jpg" />
            </div>
        </div>
    </div>
    <!-- 第一行 轮播广告 结束 -->

    <!-- 促销模块开始 -->
    <div class="row mb10 lazy">
        <div class="col-lg-12">
            <ul class="nav-orange nav-justified" id="myTab">
                <li class="active"><a href="#special" data-toggle="tab">特价产品</a></li>
                <li><a href="#new" data-toggle="tab">新品上架</a></li>
                <li><a href="#hot" data-toggle="tab">热评商品</a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="special">
                    <ul class="listbar">
                        <li><a href="">
                            <img alt="" class="center-block" src="${ctx}/static/shop/assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                            <div class="price mt5">抢购价：<b>¥96</b><i class="fr">送200优惠宝</i></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="${ctx}/static/shop/assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                            <div class="price mt5">抢购价：<b>¥96</b><i class="fr">送200优惠宝</i></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="${ctx}/static/shop/assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                            <div class="price mt5">抢购价：<b>¥96</b><i class="fr">送200优惠宝</i></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="${ctx}/static/shop/assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                            <div class="price mt5">抢购价：<b>¥96</b><i class="fr">送200优惠宝</i></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="${ctx}/static/shop/assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                            <div class="price mt5">抢购价：<b>¥96</b><i class="fr">送200优惠宝</i></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="${ctx}/static/shop/assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                            <div class="price mt5">抢购价：<b>¥96</b><i class="fr">送200优惠宝</i></div>
                        </li>
                    </ul>
                </div>
                <div class="tab-pane" id="new">
                    <ul class="listbar">
                        <li><a href="">
                            <img alt="" class="center-block" src="${ctx}/static/shop/assets/img/advertise/ad-2.jpg"></a>
                            <div class="summary"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                            <div class="price mt5">抢购价：<b>¥96</b><i class="fr">送200优惠宝</i></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="${ctx}/static/shop/assets/img/advertise/ad-2.jpg"></a>
                            <div class="summary"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                            <div class="price mt5">抢购价：<b>¥96</b><i class="fr">送200优惠宝</i></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="${ctx}/static/shop/assets/img/advertise/ad-2.jpg"></a>
                            <div class="summary"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                            <div class="price mt5">抢购价：<b>¥96</b><i class="fr">送200优惠宝</i></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="${ctx}/static/shop/assets/img/advertise/ad-2.jpg"></a>
                            <div class="summary"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                            <div class="price mt5">抢购价：<b>¥96</b><i class="fr">送200优惠宝</i></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="${ctx}/static/shop/assets/img/advertise/ad-2.jpg"></a>
                            <div class="summary"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                            <div class="price mt5">抢购价：<b>¥96</b><i class="fr">送200优惠宝</i></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="${ctx}/static/shop/assets/img/advertise/ad-2.jpg"></a>
                            <div class="summary"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                            <div class="price mt5">抢购价：<b>¥96</b><i class="fr">送200优惠宝</i></div>
                        </li>
                    </ul>
                </div>
                <div class="tab-pane" id="hot">
                    <ul class="listbar">
                        <li><a href="">
                            <img alt="" class="center-block" src="${ctx}/static/shop/assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                            <div class="price mt5">抢购价：<b>¥96</b><i class="fr">送200优惠宝</i></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="${ctx}/static/shop/assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                            <div class="price mt5">抢购价：<b>¥96</b><i class="fr">送200优惠宝</i></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="${ctx}/static/shop/assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                            <div class="price mt5">抢购价：<b>¥96</b><i class="fr">送200优惠宝</i></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="${ctx}/static/shop/assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                            <div class="price mt5">抢购价：<b>¥96</b><i class="fr">送200优惠宝</i></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="${ctx}/static/shop/assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                            <div class="price mt5">抢购价：<b>¥96</b><i class="fr">送200优惠宝</i></div>
                        </li>
                        <li><a href="">
                            <img alt="" class="center-block" src="${ctx}/static/shop/assets/img/advertise/ad-1.jpg"></a>
                            <div class="summary"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                            <div class="price mt5">抢购价：<b>¥96</b><i class="fr">送200优惠宝</i></div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- 促销模块结束 -->

    <!-- 楼层1 节日促销开始 -->
    <div class="row mb10 lazy">
        <div class="col-lg-2">
            <div class="floor-title floor-bb-1 floor-text"><i class="icon-main icon-floor-1 pull-left mt10"></i>商城重点推荐</div>
            <div class="floor-show">
                <img src="${ctx}/static/shop/assets/img/advertise/floor-1.jpg">
            </div>
        </div>
        <div class="col-lg-10">
            <div class="floor-title floor-bb-1 tr f12"><a href="">未过期的活动名称</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="">春节活动</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="">免运费活动</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="">更多&gt;&gt;</a></div>
            <div class="floor-product">
                <ul class="listbar-2">
                    <li><a href="">
                        <img alt="" class="center-block" src="${ctx}/static/shop/assets/img/advertise/ad-2.jpg"></a>
                        <div class="summary mt20"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                        <div class="price mt5">抢购价：<b>¥96</b><i class="fr">送200优惠宝</i></div>
                    </li>
                    <li><a href="">
                        <img alt="" class="center-block" src="${ctx}/static/shop/assets/img/advertise/ad-2.jpg"></a>
                        <div class="summary mt20"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                        <div class="price mt5">抢购价：<b>¥96</b><i class="fr">送200优惠宝</i></div>
                    </li>
                    <li><a href="">
                        <img alt="" class="center-block" src="${ctx}/static/shop/assets/img/advertise/ad-2.jpg"></a>
                        <div class="summary mt20"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                        <div class="price mt5">抢购价：<b>¥96</b><i class="fr">送200优惠宝</i></div>
                    </li>
                    <li><a href="">
                        <img alt="" class="center-block" src="${ctx}/static/shop/assets/img/advertise/ad-2.jpg"></a>
                        <div class="summary mt20"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                        <div class="price mt5">抢购价：<b>¥96</b><i class="fr">送200优惠宝</i></div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!-- 楼层1 节日促销结束 -->

    <!-- 内容部分结束 -->
    <%@include file="../common/vFooter.jsp"%>
</div>
</body>
</html>
