<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="${ctx}/static/shop/assets/lib/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="${ctx}/static/shop/assets/css/style.css" rel="stylesheet" />
    <style>
        .tab-pane{
            display: none;
        }
        .tab-pane.active{
            display: block;
        }
    </style>
</head>
<body>
<jsp:include page="../common/vHeader.jsp?open= hover-toggle"/>
    <div class="container">
        <!-- 内容部分开始 -->

        <!-- 详细页开始 -->
        <div class="row">
            <div class="col-lg-12">
                <ol class="breadcrumb bg-none">
                    <li><a href="${ctx}/">首页</a></li>
                    <li><a href="${ctx}/shop/v/list">全部</a></li>
                    <li><a href="${ctx}/shop/v/list?typeId=${typeId}"><gs:showTypeName id="${typeId}"/></a></li>
                </ol>
            </div>
        </div>
        <div class="row">
            <!-- 左边栏开始 -->
            <div id="sidebar" class="col-lg-2">
                <div class="widget mb10">
                    <h5 class="widget-tit pl10 fb">热门商品推荐</h5>
                    <ul class="widget-list-3">
                        <li>
                            <a href="">
                                <img class="center-block" alt="" src="${ctx}/static/shop/assets/img/advertise/ad-2.jpg"></a>
                            <div class="summary"><a href="">美的（Midea） MRO102C-4 反渗透 净水机</a></div>
                            <div class="price"><b class="f18">￥799</b> <span class="f12 ml10 red-font"><i class="icon-lower mr10">直降</i>已优惠 ￥481</span></div>
                        </li>
                        <li>
                            <a href="">
                                <img class="center-block" alt="" src="${ctx}/static/shop/assets/img/advertise/ad-2.jpg"></a>
                            <div class="summary"><a href="">美的（Midea） MRO102C-4 反渗透 净水机</a></div>
                            <div class="price"><b class="f18">￥799</b> <span class="f12 ml10 red-font"><i class="icon-lower mr10">直降</i>已优惠 ￥481</span></div>
                        </li>
                        <li>
                            <a href="">
                                <img class="center-block" alt="" src="${ctx}/static/shop/assets/img/advertise/ad-2.jpg"></a>
                            <div class="summary"><a href="">美的（Midea） MRO102C-4 反渗透 净水机</a></div>
                            <div class="price"><b class="f18">￥799</b> <span class="f12 ml10 red-font"><i class="icon-lower mr10">直降</i>已优惠 ￥481</span></div>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- 左边栏结束 -->
            <!-- 右边内容 -->
            <div id="content" class="col-lg-10">
                <div class="item-meta">
                    <h1 class="meta-tit" data-id="title"></h1>
                    <div class="meta-situ">
                        <div class="meta-magnifier pull-left">
                            <style>

                                .nav-img div {
                                    display: inline;
                                    float: left;
                                    margin-left: 18px;
                                }
                                .nav-img div img{
                                    width: 50px;
                                    height: 45px;
                                    box-sizing:border-box;
                                    border: 4px solid #ffffff;
                                }

                                .nav-img div.active img{
                                    border: 2px solid red;
                                }

                            </style>
                            <ul class="goods-pics-content">
                                <div class="big-img"><img width="320" height="320" src="#"></div>
                                <ol class="nav-img">
                                </ol>
                            </ul>
                        </div>
                        <div class="meta-show pull-right">
                            <h2 class="meta-maintit" data-id="title"></h2>
                            <div class="meta-subtitle" data-id="sub-title"></div>
                            <div class="meta-reveal mb10">
                                <ul>
                                    <li class="reveal-tit">价格信息</li>
                                    <li class="reveal-sow">&nbsp;</li>
                                    <li class="reveal-tit">市场价：</li>
                                    <li class="reveal-sow rev-text-1" data-id="price-g">￥000.00</li>
                                    <li class="reveal-tit">商城价：</li>
                                    <li class="reveal-sow rev-text-2" data-id="price">￥000.00</li>
                                    <li class="reveal-tit">服    务：</li>
                                    <li class="reveal-sow">由<b class="rev-text-3">商城</b>发货并提供帮助</li>
                                    <li class="reveal-tit">商品评分：</li>
                                    <li class="reveal-sow">
                                        <i class="icon-main icon-eva-6"></i>(已有<b class="tjrs"></b>人推荐)
                                    </li>
                                </ul>
                            </div>
                            <div style="border-bottom: 1px dotted #ccc;"></div>
                            <div class="meta-btn">
                                <div class="quantity mb10">购买数量：<span class="ui-spinner"><input type="text" class="input" id="amount" value="1" aria-valuenow="1" autocomplete="off"><a class="ui-spinner-button ui-spinner-up" tabindex="-1"><span class="ui-icon">▲</span></a><a class="ui-spinner-button ui-spinner-down" tabindex="-1"><span class="ui-icon">▼</span></a></span>(库存充足)</div>
                                <div class="button-group">
                                    <button type="button" class="btn btn-danger btn-lg mr20" onclick="addCartsAndJump()">立即购买</button>
                                    <button type="button" class="btn btn-addcart btn-lg mr20" onclick="addCarts()"><i class="icon-main icon-addcart"></i>加入购物车</button>
                                    <button type="button" class="btn btn-collect btn-lg" onclick="addFavorite()"><i class="icon-main icon-like"></i>收藏</button>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>

                </div>
                <div class="item-detail">
                    <ul class="nav nav-tabs detail-tabs" id="detail-tabs">
                        <li class="active"><a href="#intro" data-toggle="tab">商品介绍</a></li>
                        <%--<li><a href="#review" data-toggle="tab">商品评价</a></li>--%>
                        <li><a href="#after" data-toggle="tab">售后保障</a></li>
                    </ul>
                </div>
                <div class="tab-pane active" id="intro" data-id="intro">
                </div>

                <div class="item-after tab-pane" id="after">
                    <div class="p15">
                        <p class="lh200">
                            <b>服务承诺： </b>
                            <br />
                            商城向您保证所售商品均为正品行货，自营商品自带机打发票，与商品一起寄送。凭质保证书及商城发票，可享受全国联保服务（奢侈品、钟表除外；奢侈品、钟表由联系保修，享受法定三包售后服务），与您亲临商场选购的商品享受相同的质量保证。商城还为您提供具有竞争力的商品价格和运费政策，请您放心购买！<br />
                            <br />

                            注：因厂家会在没有任何提前通知的情况下更改产品包装、产地或者一些附件，本司不能确保客户收到的货物与商城图片、产地、附件说明完全一致。只能确保为原厂正货！并且保证与当时市场上同样主流新品一致。若本商城没有及时更新，请大家谅解！
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <!-- 详细页结束 -->



        <!-- 内容部分结束 -->
    <%@include file="../common/vFooter.jsp"%>
    <script type="text/javascript" src="${ctx}/static/shop/assets/js/modernizr.js"></script>
    <script type="text/javascript">
        var goodsId = undefined;

        function addCartsAndJump(goodsId,amount){
            var amount = $("#amount").val();
            window.open("${ctx}/shop/member/addCarts?goodsBaseInfo.id="+goodsId+"&amount="+amount);
        }
        
        function addCarts(g) {
            if (!g){
                g = goodsId;
            }
            if (g){
                var amount = $("#amount").val();
                if (!amount) {
                    amount = 1;
                }

                <shiro:notAuthenticated>
                addCartsAndJump(g,amount);
                return;
                </shiro:notAuthenticated>

                $.post("${ctx}/shop/member/addCarts", {"goodsBaseInfo.id": g, "amount": amount}, function (data) {
                    if (data.msg == 'success') {
                        $cy.confirm({
                            'title': '消息',
                            'message': '已成功加入购物车，是非去购物车结算?',
                            async: false,
                            btn: ['去结算', '继续购物'],
                            yes: function(){
                                window.location.href = ctx+"/shop/member/carts"
                            },
                            no: $.noop})
                    }else{
                        // alert(data);
                    }
                })
            }
        }



        function addFavoriteAndJump(goodsId){
            window.open("${ctx}/shop/member/addFavorite?goodsBaseInfo.id="+goodsId);
        }

        function addFavorite(g) {
            if (!g){
                g = goodsId;
            }
            if (g){
                <shiro:notAuthenticated>
                addFavoriteAndJump(g);
                return;
                </shiro:notAuthenticated>

                $.post("${ctx}/shop/member/addFavorite", {"goodsBaseInfo.id": g}, function (data) {
                    if (data.msg == 'success') {
                        $cy.confirm({
                            'title': '消息',
                            'message': '已收藏商品，后续可在我的收藏中查看！',
                            async: false,
                            btn: ['去我的收藏', '继续购物'],
                            yes: function(){
                                window.location.href = ctx+"/shop/member/favorites"
                            },
                            no: $.noop})
                    }
                })
            }
        }

        $(function(){
            var spinner = $( ".ui-spinner" );
            var v = $(spinner).find(".input");
            v.change(function () {
               if ($(this).val()<1) {
                   $(this).val(1);
               }
            });
            spinner.find("a.ui-spinner-up").click(function(){
                v.val(parseInt(v.val()) + 1).change();
            })
            spinner.find("a.ui-spinner-down").click(function(){
                v.val(parseInt(v.val()) - 1).change();

            })
            function initGoodsPics(){
                var $navimg=$('.nav-img>div');
                var $bigimg=$('.big-img>img');

                $navimg.click(function(){switchImg(this);});

                function switchImg(nav){
                    $(nav).addClass("active").siblings().removeClass("active");

                    $bigimg[0].src = nav.children[0].src;
                }

            }
            $('#vcode_img').click(function  () {
                $(this).attr('src',  $(this).data('src')+'?'+ Math.random());
            });


            $cy.waiting()
            //获取商品数据
            $.post("#", {}, function (data) {
                var info = data.info;

                goodsId = info.id;

                $("[data-id=title]").text(info.title)
                $("[data-id=sub-title]").text("双11限时特惠")
                $("[data-id=price-g]").text("￥"+(info.basePrice*1.2))
                $("[data-id=price]").text("￥"+info.basePrice)


                $("[data-id=intro]").html(info.details?info.details:"<div class=\"p15\">\n" +
                    "                        <p class=\"lh200\">\n" +
                    "                            <b>暂无介绍 </b>\n" +
                    "                    </div>")

                var imgs = info.pics.split(",");
                $(".big-img img").attr("src",imgs[0]);

                $(imgs).each(function(i,o){
                    $(".nav-img").append("<div><img src='"+o+"'></div>");
                })

                $(".tjrs").text(info.suggest);
                initGoodsPics();
                $cy.waitingOver();
            });
        })

    </script>
    <script type="text/javascript">

    </script>
</body>
</html>
