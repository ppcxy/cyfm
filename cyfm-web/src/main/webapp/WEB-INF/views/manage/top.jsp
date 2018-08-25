<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="${ctx}/static/plugins/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
<link href="${ctx}/static/plugins/jquery-ui-bootstrap/css/font-wesome/font-awesome.css" rel="stylesheet" type="text/css"/>
<link href="${ctx}/static/manage/css/style.css?v2" rel="stylesheet" type="text/css" />
<style>
    body {
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
    }
</style>
<%@include file="/WEB-INF/views/common/import-js.jspf"%>
<script type="text/javascript">
$(function(){
	//顶部导航切换
	$(".nav li a").click(function(){
        $(".nav li a.selected").removeClass("selected");
		$(this).addClass("selected");
	})
    ctx = _ctx = "${ctx}"
    $cy.initNotice();

    $(".user").click(function () {
        //iframe窗
        top.layer.open({
            type: 2,
            title: '系统通知',
            shadeClose: true,
            shade: 0.3,
            maxmin: true, //开启最大化最小化按钮
            area: ['400px', '600px'],
            content: '${ctx}/manage/maintain/notification/list/unread'
        });
        /*top.layer.open({
            type: 2,
            title: false,
            closeBtn: 0, //不显示关闭按钮
            shade: [0],
            area: ['340px', '215px'],
            offset: 'rb', //右下角弹出
            time: 2000, //2秒后自动关闭
            anim: 2,
            content: ['test/guodu.html', 'no'], //iframe的url，no代表不显示滚动条
            end: function () { //此处用于演示

            }
        });*/
    });
})

</script>
</head>
<body style="background:url(${ctx}/static/manage/images/topbg.gif) repeat-x;">
<div class="top-container">
    <div class="topleft">
        <div class="top-title">CYFM快速开发平台</div>
    <%--<a href="${ctx}/manage" target="_parent"><img src="${ctx}/static/manage/images/logo.png" title="系统首页" /></a>--%>
    </div>

    <ul class="nav">
    <c:forEach items="${roots}" var="root" varStatus="s">
        <li><a href="${ctx}/manage/left/${root.id}/" target="leftFrame" onclick="parent.contentUrl('${ctx}${root.url}');" class="${s.index eq 1 ? 'selected' : ''}"><div class="root-icon"><i class="${root.icon}"></i></div><h2>${root.name}</h2></a></li>
    </c:forEach>
    <%--<li><a href="imgtable.html" target="rightFrame"><img src="${ctx}/static/manage/images/icon02.png" title="模型管理" /><h2>模型管理</h2></a></li>--%>
    <%--<li><a href="imglist.html"  target="rightFrame"><img src="${ctx}/static/manage/images/icon03.png" title="模块设计" /><h2>模块设计</h2></a></li>--%>
    <%--<li><a href="tools.html"  target="rightFrame"><img src="${ctx}/static/manage/images/icon04.png" title="常用工具" /><h2>常用工具</h2></a></li>--%>
    <%--<li><a href="computer.html" target="rightFrame"><img src="${ctx}/static/manage/images/icon05.png" title="文件管理" /><h2>文件管理</h2></a></li>--%>

    </ul>

    <div class="topright">
    <ul>
    <li><span><img src="${ctx}/static/manage/images/help.png" title="帮助"  class="helpimg"/></span><a href="#">帮助</a></li>
    <li><a href="#">关于</a></li>
    <li><a href="${ctx}/exitSystem" target="_parent">退出</a></li>
    </ul>

    <div class="user">
    <span><shiro:principal property="name"/> </span>
    <i>消息</i>
    <b id="notice_count">5</b>
    </div>

    </div>
</div>
</body>
</html>
