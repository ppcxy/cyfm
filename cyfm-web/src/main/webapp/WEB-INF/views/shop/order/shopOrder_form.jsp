<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<html>
<head>
  <title>订单详情</title>
</head>
<body>

<div class="portlet box editBox">
    <div class="portlet-title"><span>订单信息</span></div>
    <div class="portlet-body form">
        <form:form id="inputForm"  modelAttribute="entity" action="#" method="post">
        <div class="form-body">
            <input type="hidden" name="id" value="${entity.id}"/>
            <div class="form-group">
                <label class="control-label">买家信息:</label>
                <div class="controls">
                    <div class="col-xs-12">${shopUser.realName}</div>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="form-group">
                <label class="control-label">收货地址:</label>
                <div class="controls">
                    <div class="col-xs-12">${shopUser.address}</div>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="form-group">
                <label class="control-label">订单信息:</label>
            </div>
            <div class="form-group">
                <div class="col-xs-6">
                    <label class="control-label">订单号:</label>
                    <div class="controls">
                            ${entity.orderNum}
                    </div>
                </div>
                <div class="col-xs-6">
                    <label class="control-label">订单日期:</label>
                    <div class="controls">
                        <fmt:formatDate value="${entity.createDate}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
            <c:if test="${entity.orderState eq '2'}">
            <div class="form-group">
                <div class="col-xs-6">
                    <label class="control-label">发货日期:</label>
                    <div class="controls">
                        <fmt:formatDate value="${entity.deliverDate}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>
                    </div>
                </div>

                <div class="col-xs-6">
                    <label class="control-label">发货单号:</label>
                    <div class="controls">
                            ${entity.trackNum}
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
            </c:if>
            <c:if test="${entity.orderState eq '3'}">
            <div class="form-group">
                <div class="col-xs-12">
                    <label class="control-label">收货日期:</label>
                    <div class="controls">
                        <fmt:formatDate value="${entity.finishDate}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
            </c:if>
            <div class="form-group">
                <label class="control-label">商品信息:</label>
                <div class="controls">
                    <div class="col-xs-12">
                    <table>
                        <tbody>
                        <c:forEach var="g" items="${entity.orderLists}" varStatus="s">
                            <tr>
                                <td width="30%" align="left" class="hang"><a target="_blank" href="${ctx}/shop/v/detail/${g.goodsBaseInfoId}">${g.title}</a></td>
                                <td width="10%" align="left" class="hang">￥<fmt:formatNumber value="${g.price/g.goodsAmount}"/></td>
                                <td width="10%" align="left" class="hang">${g.goodsAmount}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>

            <c:if test="${entity.orderState eq '1'}">
                <div class="form-group">
                    <label class="control-label">填写发货单号:</label>
                    <div class="controls">
                        <input class="form-control" id="trackNum" value="${entity.trackNum}"/>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="form-actions">
                    <input id="submit_btn" class="btn btn-primary" type="button" value="发货"/>&nbsp;
                    <p class="help-block">(点击发货保存信息.)</p>
                </div>
            </c:if>
            </div>
        </div>
        </form:form>
    </div>
</div>
<script>
    $cy.handleUniform();
    $("#inputForm").validate({});

    $("#submit_btn").click(function () {
        $.post("${ctx}/shop/order/deliver", {orderNum: "${entity.orderNum}", trackNum: $("#trackNum").val()}, function (data) {
            $cy.info("发货完成。",function (index) {
                window.location.reload();
                layer.close(index)
            })
        })

    })
</script>
</body>
</html>
