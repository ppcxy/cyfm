<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<div id="sitebar">
    <div class="container">
        <div class="row h30 lh30 f12">
            <div class="col-lg-6">
                <a href="javascript:;" class="bootmark" rel="nofollow"><i class="icon-main icon-collect mt8 mr5"></i>收藏商城</a>
                <span>您好，欢迎您光临商城网！</span>
                <span class="bar-link">
                    <shiro:notAuthenticated>
                        <a href="${ctx}/shop/v/login">登录</a>
                        <a href="${ctx}/shop/v/register">注册</a>
                    </shiro:notAuthenticated>

                    <shiro:authenticated>
                        <a href="${ctx}/shop/member/center"><shiro:principal property="username"/></a>
                        <shiro:hasRole name="Admin">
                            <a href="${ctx}/manage/">进入管理后台</a>
                        </shiro:hasRole>
                        <a href="${ctx}/shop/v/logout">退出</a>
                    </shiro:authenticated>
                    </span>
            </div>
            <div class="col-lg-6">
                <ul class="pull-right bar-link">
                    <li><a href="${ctx}/shop/member/order">我的订单</a> | </li>
                    <li><a href="http://wpa.qq.com/msgrd?v=3&amp;uin=27102514&amp;site=qq&amp;menu=yes">客服服务</a> | </li>
                    <li class="tel-num"><i class="icon-main icon-tel mt8 mr5"></i>800-1234-5678</li>
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
                <h1 class="logo"><a href="${ctx}/">
                    <img src="${ctx}/static/shop/assets/img/logo/logo.png" alt="商城" /></a><img src="${ctx}/static/shop/assets/img/logo/logo-text.png" alt="让每个人都满意！" /></h1>
            </div>
            <div class="col-lg-5">
                <form action="${ctx}/shop/v/list" method="get" id="searchForm">
                    <input type="hidden" id="sort" name="sort" value="${param['sort']}"/>
                    <input type="hidden" id="typeId" name="typeId" value="${param['typeId']}"/>
                    <input type="hidden" id="brandId" name="brandId" value="${param['brandId']}"/>
                    <input type="hidden" id="pn" name="pn" value="${empty page?0:page.number}"/>
                    <label for="txt_search" class="hidden">搜索商城 商品</label>
                    <input id="txt_search" type="text" name="searchParam" value="${param['searchParam']}" accesskey="s" autocomplete="off" autofocus="true" x-webkit-speech="" x-webkit-grammar="builtin:translate" class="s-combobox-input" role="combobox" aria-haspopup="true" title="请输入搜索文字" aria-label="请输入搜索文字">
                    <button id="btn_search" type="submit" onclick="$('#pn').val(0);">搜索</button>
                </form>
            </div>
            <div class="col-lg-3">
                <div id="my_account" class="btn-group mt30 ml50 ">
                    <button type="button" class="btn btn-radius-none btn-default dropdown-toggle f12" data-toggle="dropdown">我的账户 <span class="caret"></span></button>
                    <shiro:notAuthenticated>
                    <!--登录之前-->
                    <ul class="dropdown-menu p10 f12" role="menu">
                        <li><a href="${ctx}/shop/v/login" class="btn btn-warning btn-block">立即登录</a>新客户？<a class="blue-font" href="${ctx}/shop/v/register">免费注册</a></li>
                        <li class="divider"></li>
                        <li><a href="${ctx}/shop/member/">我的账户</a></li>
                        <li><a href="${ctx}/shop/member/order">我的订单</a></li>
                    </ul>
                    </shiro:notAuthenticated>
                   <shiro:authenticated>
                   <!--登录之后-->
                    <ul class="dropdown-menu p10 f12" style="width: 240px;" role="menu">
                        <li>
                            <div class="box-title fb"><span class="pull-right"><a href="${ctx}/shop/member/" class="blue-font">去我的个人中心</a></span><shiro:principal property="username"/></div>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <div class="box-title">最新订单状态：<span><a href="${ctx}/shop/member/order">查看所有订单</a></span></div>
                        </li>
                        <li class="divider"></li>
                    </ul>
                   </shiro:authenticated>
                </div>
                <div id="mini_cart" class="btn-group mt30 ml15">
                    <a href="${ctx}/shop/member/carts" class="btn btn-radius-none btn-default dropdown-toggle f12" --data-toggle="dropdown">
                        <i class="icon-main icon-cart ilb"></i>去购物车结算 </span>
                    </a>
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
                <div id="menu" class="dropdown${param['open']}">
                    <a class="navbar-brand dropdown-toggle" href="${ctx}/shop/v/list">全部商品分类 <b class="caret"></b></a>
                    <!--data-toggle="dropdown"-->
                    <div class="clearfix"></div>
                    <ul id="categories" class="dropdown-menu">

                    </ul>
                </div>
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav f14">
                    <li class="active"><a href="${ctx}/">首页</a></li>
                </ul>

            </div>
        </div>
    </div>
</div>
<!--/#header-->
