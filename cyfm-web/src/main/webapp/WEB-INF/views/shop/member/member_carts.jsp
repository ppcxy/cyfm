<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf" %>
<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="${ctx}/static/shop/assets/lib/bootstrap/css/bootstrap.css" rel="stylesheet"/>
    <link href="${ctx}/static/shop/assets/css/style.css" rel="stylesheet"/>
</head>
<body>
<jsp:include page="../common/vHeader.jsp?open= hover-toggle"/>
<div class="container">
    <!-- 内容部分开始 -->
    <c:if test="${not empty carts}">
        <!-- 购物车开始 -->
        <div class="row">
            <div class="col-lg-12">
                <div class="cart-title f16 tit-family pl10 mt10">我的购物车</div>
                <div class="cart-content">
                    <table width="100%" border="0">
                        <tbody>
                        <tr class="title">
                            <td width="5%" class="tr-title">
                                <form>
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" class="checkAll" checked/>全选</label>
                                    </div>
                                </form>
                            </td>
                            <td width="45%" class="tr-title" align="center">商品信息</td>
                            <td width="12%" class="tr-title"></td>
                            <td width="8%" class="tr-title">单价</td>
                            <td width="8%" class="tr-title">数量</td>
                            <td width="10%" class="tr-title">金额</td>
                            <td width="12%" class="tr-title" align="center">操作</td>
                        </tr>

                        <c:forEach items="${carts}" var="c">
                            <tr class="item">
                                <td width="5%" class="tr-list">
                                    <form>
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" checked value="${c.id}"/></label>
                                        </div>
                                    </form>
                                </td>
                                <td width="45%" class="tr-list">
                                    <a href="">
                                        <img class="pull-left" alt="" src="${c.pic}"/></a>
                                    <div class="summary blue-font"><a href="${ctx}/shop/v/detail/${c.goodsId}">${c.title}</a></div>
                                </td>
                                <td width="12%" class="tr-list"></td>
                                <td width="8%" class="tr-list unitPrice"><b class="orange-font">${c.unitPrice}</b></td>
                                <td width="8%" class="tr-list">
                                    <span class="ui-spinner">
                                        <input type="text" class="input amount"  value="${c.amount}" aria-valuenow="0"
                                               autocomplete="off">
                                        <a class="ui-spinner-button ui-spinner-up" tabindex="-1"><span
                                                class="ui-icon">▲</span></a>
                                        <a class="ui-spinner-button ui-spinner-down" tabindex="-1"><span
                                                class="ui-icon">▼</span></a>
                                    </span>
                                </td>
                                <td width="10%" class="tr-list sumPrice">${c.sumPrice}</td>
                                <td width="12%" class="tr-list bule-font" align="center"><a href="javascript:;" class="remove" data-id="${c.id}">删除</a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col-lg-12 main-show mb10">
                <div class="p10">
                    <div class="show-left pull-left">
                        <a href=""><i class="icon-main icon-fork"></i>删除选中的商品</a>
                    </div>
                    <div class="show-right pull-right tr totalPrice">
                        <div>已选中 <b class="orange-font totalAmount">0</b> 件商品 总计：<i></i></div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="total tr totalPrice"><b>总计（不含运费）：</b><i
                        class="orange-font f20 tit-family pr10"></i></div>
            </div>
            <div class="pull-right">
                <button type="button" class="btn btn-addcart btn-lg mr20" onclick="window.location.href='${ctx}/'">继续购物</button>
                <button type="button" class="btn btn-danger btn-lg mr20 placeOrder">去结算</button>
            </div>
        </div>
        <!-- 购物车结束 -->
    </c:if>
    <c:if test="${ empty carts}">
        <!-- 购物车为空开始 -->
        <div class="row">
            <div class="col-lg-12">
                <div class="cart-title f16 tit-family pl10 mt10">我的购物车</div>
                <div class="cart-content p30">
                    <div class="pull-left empty-img"><img alt="" src="${ctx}/static/shop/assets/img/empty-cart.jpg"/>
                    </div>
                    <div class="pull-right empty-text tit-family">
                        您的购物车中还没有商品，您现在可以<br/>
                        <b class="f14">马上去 <i><a href="${ctx}/shop/v/list">挑选商品</a></i>， 或者查查 <i><a
                                href="${ctx}/shop/member/order">我的订单</a></i></b>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <!-- 购物车为空结束 -->
    </c:if>

    <%@include file="../common/vFooter.jsp" %>
</div>
<script>
    $(function () {
        $(".placeOrder").click(function () {
            //组织要提交的订单，和对应的商品数量
            var submitPram = [];
            $("tr.item").each(function (i, o) {
                var ck = $(o).find("input[type=checkbox]");
                if (ck.is(":checked")){
                    submitPram.push({id:ck.val(), amount: $(o).find("input.amount").val()})
                }
            })

            $.post("${ctx}/shop/member/placeOrder",{orderInfo:JSON.stringify(submitPram)},function () {
                window.location.href = '${ctx}/shop/member/order';
            })

        })
        $("a.remove").click(function () {
            var cartId = $(this).data("id");
            $t = $(this).parents("tr");
            $cy.confirm({
                message:"确认要从购物车中移除此项？",
                yes:function () {
                    $.post("${ctx}/shop/member/carts/remove/"+cartId,{},function () {
                        $t.remove();
                        calcTotalPrice();
                    })
                }
            })
            return false;
        })

        //计算选中总价格和数量
        function calcTotalPrice() {
            //计算当前购物车总价
            var totalPrice = 0.00;
            var checkItems = $("tr.item input[type=checkbox]:checked").parents("tr");

            $(".totalPrice .totalAmount").text(checkItems.size())
            checkItems.find(".sumPrice").each(function (i, o) {
                totalPrice += parseFloat($(o).text())
            });
            $(".totalPrice i").text("￥"+totalPrice.toFixed(2));
        }

        $("tr.title input[type=checkbox]").click(function () {
            $("tr.item input[type=checkbox]").prop("checked", $(this).is(":checked"));
        })

        //当点击行的checkbox得时候重新计算
        $("tr input[type=checkbox]").click(function () {
            calcTotalPrice();
        });


        //进入初始计算
        calcTotalPrice();

        //计算当前购物车总价
        var totalPrice = 0.00;
        $(".sumPrice").each(function (i, o) {
            totalPrice += parseFloat($(o).text())
        });
        $(".totalPrice").text();

        
        var spinner = $(".ui-spinner");
        spinner.each(function (i, o) {
            var v = $(o).find(".input");
            v.change(function () {
                if ($(this).val() < 1) {
                    $(this).val(1);
                }
            });
            $(o).find("a.ui-spinner-up").click(function () {
                v.val(parseInt(v.val()) + 1).change();
            });
            $(o).find("a.ui-spinner-down").click(function () {
                v.val(parseInt(v.val()) - 1).change();

            });

            v.change(function () {
                var amount = parseFloat($(this).val());
                var unitPrice = parseFloat($(this).parents("tr").find(".unitPrice").text());
                //计算单个商品的合计价格
                $(this).parents("tr").find(".sumPrice").text((unitPrice * amount).toFixed(2));

                calcTotalPrice();
            })
        })
    })
    $cy.waitingOver();
</script>
</body>
</html>
