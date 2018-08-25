<%@ page import="org.springframework.data.domain.PageImpl" %>
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
        a.red,div.red{
            text-decoration: none; background: #e04f4f; color: #fff;
        }
    </style>
</head>
<body>
<jsp:include page="../common/vHeader.jsp?open= hover-toggle"/>
    <div class="container">
        <!-- 内容部分开始 -->

        <!-- 列表页部分开始 -->
        <div class="row">
            <!-- 面包屑导航开始 -->
            <div class="col-lg-12">
                <ol class="breadcrumb bg-none">
                    <li><a href="${ctx}/">首页</a></li>
                    <li><a href="${ctx}/shop/v/list">全部</a></li>
                    <li><a href="${ctx}/shop/v/list?typeId=${param['typeId']}"><gs:showTypeName id="${param['typeId']}"/></a></li>
                </ol>
            </div>
            <!-- 面包屑导航结束 -->
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
            <!-- 内容区域开始 -->
            <div id="content" class="col-lg-10">
                <div class="item-filter">
                    <div class="list-item-title pl10 f14 tit-family "><b class="red-font f16"><c:if test="${empty param['typeId']}">全部</c:if><gs:showTypeName showParents="false" id="${param['typeId']}"/></b>---商品筛选</div>
                    <div class="filter-list">
                        <div class="list-body">
                            <div class="pull-left filter-left">品牌：</div>
                            <div class="pull-right filter-right">
                                <c:forEach items="${brands}" var="b">
                                <div  class="alert-sm fade in pull-left<c:if test="${param['brandId'] eq b.id}"> red</c:if>" onclick="$('#pn').val(0);$('#brandId').val(${b.id});$('#searchForm').submit();">
                                    品牌：${b.brandName}
                                </div>
                                </c:forEach>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
                <div class="item-pro-list mt10">
                    <div class="list-item-title">
                        <div class="sort-left pull-left pl10">
                            <span>排序：</span>
                            <a href="javascript:;" class="<c:if test="${param['sort'] eq 'xl'}">red</c:if>" onclick="sort('xl');">销量 <span class="glyphicon glyphicon-arrow-down"></span></a>
                            <a href="javascript:;" class="<c:if test="${param['sort'] eq 'price'}">red</c:if>" onclick="sort('price');">价格 <span class="glyphicon glyphicon-arrow-down"></span></a>
                            <a href="javascript:;" class="<c:if test="${param['sort'] eq 'suggest'}">red</c:if>" onclick="sort('suggest');">推荐数 <span class="glyphicon glyphicon-arrow-down"></span></a>
                            <a href="javascript:;" class="<c:if test="${param['sort'] eq 'date'}">red</c:if>" onclick="sort('date');">上架时间 <span class="glyphicon glyphicon-arrow-down"></span></a>
                        </div>
                        <div class="sort-right pull-right">
                            <span><b class="red-font mr10">共${page.totalElements}件商品</b><c:if test="${page.totalPages ne 0}"> <b class="red-font">${page.number + 1}</b>/${page.totalPages}</c:if></span>
                            <%
                                PageImpl pageable = (PageImpl) request.getAttribute("page");
                                if (pageable.hasPreviousPage()) {%>
                            <a class="btn btn-default btn-xs" onclick="$('#pn').val(parseInt($('#pn').val())-1);$('#searchForm').submit();"><i class="glyphicon glyphicon-chevron-left"></i>上一页</a>
                            <% } %>
                            <% if (pageable.hasNextPage()) {%>
                            <a class="btn btn-default btn-xs" onclick="$('#pn').val(parseInt($('#pn').val())+1);$('#searchForm').submit();">下一页<i class="glyphicon glyphicon-chevron-right"></i></a>
                            <% } %>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="pro-list-show">
                        <ul>
                            <c:forEach items="${page.content}" var="g">
                                <li>
                                    <a href="${ctx}/shop/v/detail/${g.id}">
                                        <img class="center-block" alt="" src="${g.firstPic}" /></a>
                                    <div class="summary"><a href="">${g.title}</a></div>
                                    <div class="price"><span class="pull-right red-font"></span><b>${g.basePrice}</b></div>
                                    <div class="list-show-eva"><a href="">推荐指数</a>：<i class="icon-main icon-eva-6"></i>（${g.suggest}）</div>
                                    <button type="button" class="btn btn-default btn-xs" onclick="addCarts('${g.id}')">加入购物车</button>
                                    <button type="button" class="btn btn-default btn-xs" onclick="addFavorite('${g.id}')">收藏</button>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- 内容区域结束 -->
        </div>
        <!-- 列表页部分结束 -->
        


        <!-- 内容部分结束 -->
        <%@include file="../common/vFooter.jsp"%>
    </div>

<script>
    /**
     * 商品排序事件，需要将筛选参数带入
     * @param sortFiled
     */
    function sort(sortFiled) {
        var url = "${ctx}/shop/v/list?typeId=${param['typeId']}&brandId=${param['brandId']}&searchParam=${param['searchParam']}&sort=" + sortFiled;
        window.location.href = url;
    }

    /**
     * 添加到购物车并跳转到购物车页面
     * @param goodsId
     * @param amount
     */
    function addCartsAndJump(gid,amount){
        window.open("${ctx}/shop/member/addCarts?goodsBaseInfo.id="+gid+"&amount="+amount);
    }

    /**
     * 添加商品到购物车
     * @param gid
     */
    function addCarts(gid) {
        if (!gid){
            gid = goodsId;
        }
        if (gid){
            var amount = $("#amount").val();
            if (!amount) {
                amount = 1;
            }

            //如果当前没有登录则调用添加并跳转到购物车
            <shiro:notAuthenticated>
            addCartsAndJump(gid,amount);
            return;
            </shiro:notAuthenticated>

            //如果当前是登录状态，ajax添加到购物车并提示是否继续购物或者去购物车
            $.post("${ctx}/shop/member/addCarts", {"goodsBaseInfo.id": gid, "amount": amount}, function (data) {
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

    /**
     * 添加商品到收藏并跳转到收藏
     * @param goodsId
     */
    function addFavoriteAndJump(goodsId){
        window.open("${ctx}/shop/member/addFavorite?goodsBaseInfo.id="+goodsId);
    }

    /**
     * 同添加商品到购物车
     * @param gid
     */
    function addFavorite(gid) {
        if (!gid){
            gid = goodsId;
        }
        if (gid){
            <shiro:notAuthenticated>
            addFavoriteAndJump(gid);
            return;
            </shiro:notAuthenticated>

            $.post("${ctx}/shop/member/addFavorite", {"goodsBaseInfo.id": gid}, function (data) {
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

</script>
</body>
</html>
