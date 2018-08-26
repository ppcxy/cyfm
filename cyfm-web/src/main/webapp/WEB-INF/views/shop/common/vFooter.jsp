<%@ page contentType="text/html;charset=UTF-8" %>
<style>
    a.xxx {
        color: blue;
    }
</style>
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

        </p>
    </div>
</footer>
<%@include file="/WEB-INF/views/common/import-js.jspf"%>
<script>
    var titleTemplate = "<li><a href=\"#\" class='typeitem optional' data-type='{id}'><i class=\"icon-main icon-{icon}\"></i>{value}</a><ul class=\"sub-item\"></ul></li>";
    var subLiTemplate = "<li><a href=\"#\" class='typeitem optional' data-type='{id}'>{value}</a><ul class=\"sub-item\"></ul></li>";

    var types = [];

    $.get("${ctx}/shop/v/type/ajax/load?async=true&asyncLoadAll=true&search.show_eq=true", function (data) {
        $(data).each(function (i, o) {
            if (o.show){
                //便利获取的分类数据，组织成多级结构
                if (o.id != 1) {
                    if (o.pId == 1) {
                        $("#categories").append(titleTemplate.replace("{id}", o.id).replace("{value}", o.name).replace("{icon}", o.id));
                    } else {
                        $("[data-type='" + o.pId + "']+ul.sub-item").append(subLiTemplate.replace("{id}", o.id).replace("{value}", o.name));
                    }
                }
            }
        })

        $(".typeitem.optional").click(function () {    
            if ($(this).next().find("li").size() == 0) {
                $(this).addClass("xxx");
                window.location.href = '${ctx}/shop/v/list?typeId=' + $(this).data("type");
            }
        })

    })
    setTimeout(function () {
        $cy.waitingOver();
    }, 200);

</script>
