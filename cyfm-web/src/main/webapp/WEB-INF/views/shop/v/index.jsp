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
    <link href="${ctx}/static/plugins/jquery-ui-bootstrap/css/font-wesome/font-awesome.css" rel="stylesheet" type="text/css"/>
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
<div id="sitebar">
    <div class="container">
        <div class="row h30 lh30 f12">
            <div class="col-lg-6">
                <a href="javascript:;" class="bootmark" rel="nofollow"><i class="icon-main icon-collect mt8 mr5"></i>收藏商城</a>
                <span>您好，欢迎您光临商城网！请</span>
                <span class="bar-link">
                        <a href="/account/login.aspx">登录</a>
                        <a href="/account/register.aspx">注册</a>
                    </span>
            </div>
            <div class="col-lg-6">
                <ul class="pull-right bar-link">
                    <li><a href="/member/order.aspx">我的订单</a> | </li>
                    <li><a href="http://wpa.qq.com/msgrd?v=3&amp;uin=27102514&amp;site=qq&amp;menu=yes">客服服务</a> | </li>
                    <li><a href="sitemap.aspx">网站导航</a> |&nbsp;&nbsp;&nbsp;&nbsp;</li>
                    <li class="tel-num"><i class="icon-main icon-tel mt8 mr5"></i>8888-888-888</li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!--/#sitebar-->
<div id="header">
    <div class="container">
        <div class="row search">
            <div class="col-lg-4">
                <h1 class="logo"><a href="/">
                    <img src="${ctx}/static/shop/assets/img/logo/logo.png" alt="商城" /></a><img src="${ctx}/static/shop/assets/img/logo/logo-text.png" alt="让每个人都满意！" /></h1>
            </div>
            <div class="col-lg-5">
                <form action="search.aspx" method="get">
                    <label for="txt_search" class="hidden">搜索商城 分类/品牌/商品</label>
                    <input id="txt_search" type="text" name="q" accesskey="s" autocomplete="off" autofocus="true" x-webkit-speech="" x-webkit-grammar="builtin:translate" class="s-combobox-input" role="combobox" aria-haspopup="true" title="请输入搜索文字" aria-label="请输入搜索文字">
                    <button id="btn_search" type="submit">搜索</button>
                </form>
            </div>
            <div class="col-lg-3">
                <div id="my_account" class="btn-group mt30 ml50 ">
                    <button type="button" class="btn btn-radius-none btn-default dropdown-toggle f12" data-toggle="dropdown">我的账户 <span class="caret"></span></button>
                    <!--登录之前-->
                    <!-- <ul class="dropdown-menu p10 f12" role="menu">
                        <li><a href="/account/login.aspx" class="btn btn-warning btn-block">立即登录</a>新客户？<a class="blue-font" href="/account/register.aspx">免费注册</a></li>
                        <li class="divider"></li>
                        <li><a href="/member/">我的账户</a></li>
                        <li><a href="/member/order.aspx">我的订单</a></li>
                        <li><a href="#">评论已购商品</a></li>
                        <li><a href="#">为我推荐</a></li>
                    </ul> -->
                    <!--登录之后-->
                    <ul class="dropdown-menu p10 f12" style="width: 240px;" role="menu">
                        <li>
                            <div class="box-title fb"><span class="pull-right"><a href="/member/" class="blue-font">去我的商城首页</a></span>用户名称</div>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <div class="box-title">最新订单状态：<span><a href="/member/order.aspx">查看所有订单</a></span></div>
                        </li>
                        <li class="divider"></li>
                        <li><a href="/member/order.aspx?status=0">待处理订单<i class="gray-font">(0)</i></a></li>
                        <li><a href="/member/order.aspx?status=1">待处理订单<i class="gray-font">(1)</i></a></li>
                        <li><a href="/member/order.aspx?status=2">待处理订单<i class="gray-font">(2)</i></a></li>
                        <li><a href="/member/order.aspx?status=3">待处理订单<i class="gray-font">(3)</i></a></li>
                    </ul>
                </div>
                <div id="mini_cart" class="btn-group mt30 ml15">
                    <a href="/cart/" class="btn btn-radius-none btn-default dropdown-toggle f12" data-toggle="dropdown">
                        <i class="icon-main icon-cart ilb"></i>去购物车结算 <span class="caret"></span>
                    </a>
                    <!--购物车为空-->
                    <!--<ul class="dropdown-box" role="menu">
                        <li><i class="icon-main icon-mini-cart ilb"></i>购物车中还没有商品，赶紧选购吧！</li>
                    </ul>-->
                    <!--购物车有商品-->
                    <ul class="dropdown-box" role="menu">
                        <li>
                            <div class="box-title fb p10">最新加入的商品</div>
                            <div class="box-content ">
                                <ul class="box-list">
                                    <li>
                                        <div class="pull-left product-info">
                                            <img class="pull-left" alt="" src="" />
                                            <div class="summary"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                                        </div>
                                        <div class="pull-right price-info">
                                            <b class="red-font">￥779.00</b>×1<br>
                                            <span class="blue-font pull-right"><a href="">删除</a></span>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="pull-left product-info">
                                            <img class="pull-left" alt="" src="" />
                                            <div class="summary"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                                        </div>
                                        <div class="pull-right price-info ">
                                            <b class="red-font">￥779.00</b>×1<br>
                                            <span class="blue-font pull-right"><a href="">删除</a></span>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="pull-left product-info">
                                            <img class="pull-left" alt="" src="" />
                                            <div class="summary"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                                        </div>
                                        <div class="pull-right price-info">
                                            <b class="red-font">￥779.00</b>×1<br>
                                            <span class="blue-font pull-right"><a href="">删除</a></span>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="box-settlement tr">
                                共 <b class="red-font">3</b> 件商品&nbsp;&nbsp;共计<b class="red-font f16">￥ 2008.00</b>
                                <a href="/cart/" class="btn btn-danger">去购物车结算</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="navbar navbar-red" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <div id="menu" class="dropdown open">
                    <a class="navbar-brand dropdown-toggle" href="#">全部商品分类 <b class="caret"></b></a>
                    <!--data-toggle="dropdown"-->
                    <div class="clearfix"></div>
                    <ul id="categories" class="dropdown-menu">
                        <li>
                            <a href="#"><i class="icon-main icon-3"></i>运动 户外</a>
                            <ul class="sub-item">
                                <li><a href="#">运动 户外</a></li>
                                <li><a href="#">运动 户外</a></li>
                                <li><a href="#">运动 户外</a></li>
                                <li><a href="#">运动 户外</a></li>
                                <li><a href="#">家居 家具 厨具 清洁</a></li>
                                <li><a href="#">运动 户外</a></li>
                                <li><a href="#">运动 户外</a></li>
                                <li><a href="#">运动 户外</a></li>
                                <li><a href="#">运动 户外</a></li>
                                <li><a href="#">运动 户外</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav f14">
                    <li class="active"><a href="#">首页</a></li>
                    <li><a href="#">专题</a></li>
                    <li><a href="#">优惠券</a></li>
                    <!--<li class="dropdown"> <a href="#">Dropdown </a> </li>-->
                </ul>
                <!--<ul class="nav navbar-nav navbar-right">
                    <li class="active"><a href="./">Default</a></li>
                    <li><a href="../navbar-static-top/">Static top</a></li>
                    <li><a href="../navbar-fixed-top/">Fixed top</a></li>
                </ul>-->
            </div>
            <!--/.nav-collapse -->
        </div>
    </div>
</div>
<!--/#header-->
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
            <div id="topic_scroll" class="topic-scroll slide">
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
    <div class="row mt20">
        <div class="col-lg-12">
            <ul class="listbar-5">
                <li><i class="icon-main icon-intr-1 ilb ml31"></i>
                    <p class="tc gray-font">
                        正品保证<br>
                        假1赔10
                    </p>
                </li>
                <li><i class="icon-main icon-intr-2 ilb ml31"></i>
                    <p class="tc gray-font">
                        质优价廉<br>
                        买贵就赔
                    </p>
                </li>
                <li><i class="icon-main icon-intr-3 ilb ml31"></i>
                    <p class="tc gray-font">
                        7天保障<br>
                        无理由退换
                    </p>
                </li>
                <li><i class="icon-main icon-intr-4 ilb ml31"></i>
                    <p class="tc gray-font">
                        满100元<br>
                        免运费
                    </p>
                </li>
                <li><i class="icon-main icon-intr-5 ilb ml31"></i>
                    <p class="tc gray-font">
                        100优惠宝<br>
                        =1元
                    </p>
                </li>
                <li><i class="icon-main icon-intr-6 ilb ml31"></i>
                    <p class="tc gray-font">
                        24小时<br>
                        闪电发货
                    </p>
                </li>
                <li><i class="icon-main icon-intr-7 ilb ml31"></i>
                    <p class="tc gray-font">
                        7x24小时<br>
                        在线客服
                    </p>
                </li>
                <li><i class="icon-main icon-intr-8 ilb ml31"></i>
                    <p class="tc gray-font">
                        支持多种<br>
                        支付方式
                    </p>
                </li>
                <li><i class="icon-main icon-intr-9 ilb ml31"></i>
                    <p class="tc gray-font">
                        开箱验货<br>
                        放心付款
                    </p>
                </li>
                <li><i class="icon-main icon-intr-10 ilb ml31"></i>
                    <p class="tc gray-font">
                        晒单奖励<br>
                        评论奖励
                    </p>
                </li>
            </ul>
        </div>
    </div>
    <div class="row mt10">
        <div class="col-lg-12 help-center">
            <ul class="help-list">
                <li>
                    <ul class="help-on">
                        <li class="ontitle"><i class="icon-main icon-help-1 pull-left"></i>关于我们</li>
                        <li class="ontext"><a href="#">关于商城</a></li>
                        <li class="ontext"><a href="#">联系我们</a></li>
                        <li class="ontext"><a href="#">加入我们</a></li>
                    </ul>
                </li>
                <li>
                    <ul class="help-on">
                        <li class="ontitle"><i class="icon-main icon-help-2 pull-left"></i>购物指南</li>
                        <li class="ontext"><a href="#">购物流程</a></li>
                        <li class="ontext"><a href="#">服务协议</a></li>
                        <li class="ontext"><a href="#">优惠券说明</a></li>
                    </ul>
                </li>
                <li>
                    <ul class="help-on">
                        <li class="ontitle"><i class="icon-main icon-help-3 pull-left"></i>支付方式</li>
                        <li class="ontext"><a href="#">银联支付</a></li>
                        <li class="ontext"><a href="#">快钱支付</a></li>
                        <li class="ontext"><a href="#">支付宝支付</a></li>
                    </ul>
                </li>
                <li>
                    <ul class="help-on">
                        <li class="ontitle"><i class="icon-main icon-help-4 pull-left"></i>配送方式</li>
                        <li class="ontext"><a href="#">运费说明</a></li>
                    </ul>
                </li>
                <li>
                    <ul class="help-on">
                        <li class="ontitle"><i class="icon-main icon-help-5 pull-left"></i>售后服务</li>
                        <li class="ontext"><a href="#">退换货政策</a></li>
                        <li class="ontext"><a href="#">退换货流程</a></li>
                        <li class="ontext"><a href="#">退换货申请</a></li>
                    </ul>
                </li>
                <li>
                    <ul class="help-on">
                        <li class="ontitle"><i class="icon-main icon-help-6 pull-left"></i>帮助信息</li>
                        <li class="ontext"><a href="#">常见问题</a></li>
                        <li class="ontext"><a href="#">投诉建议</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>
<footer>
    <div class="container">
        <p class="tc lh200">
            <a href="#">关于我们</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="">联系我们</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="">网络联盟</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="">商家入驻</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="">网络招聘</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="">广告服务</a>&nbsp;&nbsp;|
            <br />
        </p>
    </div>
</footer>
<%@include file="/WEB-INF/views/common/import-js.jspf"%>
<script>
    var titleTemplate = "<li><a href=\"#\"><i class=\"icon-main icon-3\"></i>{value}</a></li>";
    var subUlTemplate = "<ul class=\"sub-item\"></ul>";
    var subLiTemplate = "<li><a href=\"#\">{value}</a></li>";


    var types = [];
    $.get("${ctx}/shop/gs/type/ajax/load?async=true&asyncLoadAll=true&search.show_eq=true",function (data) {
        $(data).each(function (i,o) {
            if (o.id != 1) {
                if ( o.pId==1){
                    titleTemplate.replace("{value}", o.name);
                }
            }
            console.log(o.id, o.pId, o.name);
        })

    })
</script>
</body>
</html>
