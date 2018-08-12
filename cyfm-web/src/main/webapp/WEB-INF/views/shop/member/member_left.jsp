<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<!-- 左边栏 -->
<div id="sidebar" class="col-lg-2">
    <div class="widget mb10">
        <div class="panel-group" id="accordion">
            <div class="panel">
                <div class="panel-title">
                    <h5 class="fb pl10">
                        <i class="pull-right m10 icon-main icon-up"></i><a data-toggle="collapse" data-toggle="collapse" data-parent="#accordion" href="#collapse-1">相关分类</a>
                    </h5>
                </div>
                <div id="collapse-1" class="panel-collapse collapse in">
                    <div class="meb-left-list">
                        <ul>
                            <li><a href="${ctx}/shop/member/order">我的订单</a></li>
                            <li><a href="${ctx}/shop/member/cart">我的购物车</a></li>
                            <li><a href="${ctx}/shop/member/favorites">我的收藏</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="panel">
                <div class="panel-title">
                    <h5 class="fb pl10">
                        <i class="pull-right m10 icon-main icon-down"></i><a data-toggle="collapse" data-toggle="collapse" data-parent="#accordion" href="#collapse-2">账户中心</a>
                    </h5>
                </div>
                <div id="collapse-2" class="panel-collapse collapse in">
                    <div class="meb-left-list">
                        <ul>
                            <li><a href="${ctx}/shop/member/info">编辑个人信息</a></li>
                            <li><a href="${ctx}/shop/member/changePassword">修改密码</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="panel">
                <div class="panel-title">
                    <h5 class="fb pl10">
                        <i class="pull-right m10 icon-main icon-down"></i><a data-toggle="collapse" data-toggle="collapse" data-parent="#accordion" href="#collapse-3">售后服务</a>
                    </h5>
                </div>
                <div id="collapse-3" class="panel-collapse collapse in">
                    <div class="meb-left-list">
                        <ul>
                            <li><a href="">退换货申请</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
