<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!-- ================================= Css 区域 ========================================== -->
    <link type="image/x-icon" href="${ctx}/static/images/favicon.ico" rel="shortcut icon">

    <!-- 插件扩展区 bengin-->
    <link href="${ctx}/static/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/plugins/bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link href="${ctx}/static/plugins/jquery-ui-bootstrap/css/font-wesome/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/plugins/jquery-ui-bootstrap/css/custom-theme/jquery-ui-1.10.3.custom.css" type="text/css" rel="stylesheet" />
    <link href="${ctx}/static/plugins/jquery-ui-bootstrap/css/layout-default-1.3.0.css" type="text/css" rel="stylesheet" />
    <%@include file="/WEB-INF/views/common/import-zTree-css.jspf"%>
    <!-- 插件扩展区 end-->

    <link href="${ctx}/static/styles/default.min.css" type="text/css" rel="stylesheet" />
    <link href="${ctx}/static/styles/components.css" type="text/css" rel="stylesheet" />

    <!-- ================================= JS 区域 ========================================== -->
    <!-- 插件扩展区 bengin-->
    <script src="${ctx}/static/plugins/jquery/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="${ctx}/static/plugins/jquery-ui-bootstrap/js/jquery-ui-1.10.3.custom.js"></script>
    <script src="${ctx}/static/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${ctx}/static/plugins/laydate/laydate.dev.js" type="text/javascript"></script>
    <script src="${ctx}/static/plugins/layer-dialog/layer-dialog.dev.js"></script>
    <!-- 插件扩展区 end-->

    <script src="${ctx}/static/js/common.js?3" type="text/javascript"></script>

<title>无标题文档</title>
<link href="${ctx}/static/manage/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
$(function(){
	//导航切换
	$(".menuson li").click(function(){
        parent.$cy.waiting();
		$(".menuson li.active").removeClass("active")
		$(this).addClass("active");
	});
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('ul').slideUp();
		if($ul.is(':visible')){
			$(this).next('ul').slideUp();
		}else{
			$(this).next('ul').slideDown();
		}
	});
})	
</script>
</head>

<body style="background:#f0f9fd;">

	<div class="lefttop"><span></span>系统设置</div>
    
    <dl class="leftmenu">
        <c:forEach items="${menus}" var="m">
        <dd>
            <div class="title">
                <span><i class="${m.icon}"></i></span>${m.name}
            </div>
            <ul class="menuson">
                <c:forEach items="${m.children}" var="c">
                    <cy:submenu menu="${c}" parentName="${m.name}"/>
                </c:forEach>
            </ul>
        </dd>
        </c:forEach>
    <dd>
    <div class="title">
    <span><img src="${ctx}/static/manage/images/leftico01.png" /></span>管理信息
    </div>
    	<ul class="menuson">
        <li class="active"><cite></cite><a href="index.html" target="rightFrame">首页模版</a><i></i></li>
        <li><cite></cite><a href="${ctx}/sys/team" target="rightFrame">团队管理</a><i></i></li>
        <li><cite></cite><a href="${ctx}/sys/user" target="rightFrame">用户管理</a><i></i></li>
        <li><cite></cite><a href="${ctx}/sys/resource" target="rightFrame">资源管理</a><i></i></li>
        <li><cite></cite><a href="right.html" target="rightFrame">数据列表</a><i></i></li>
        <li><cite></cite><a href="imgtable.html" target="rightFrame">图片数据表</a><i></i></li>
        <li><cite></cite><a href="form.html" target="rightFrame">添加编辑</a><i></i></li>
        <li><cite></cite><a href="imglist.html" target="rightFrame">图片列表</a><i></i></li>
        <li><cite></cite><a href="imglist1.html" target="rightFrame">自定义</a><i></i></li>
        <li><cite></cite><a href="tools.html" target="rightFrame">常用工具</a><i></i></li>
        <li><cite></cite><a href="filelist.html" target="rightFrame">信息管理</a><i></i></li>
        <li><cite></cite><a href="tab.html" target="rightFrame">Tab页</a><i></i></li>
        <li><cite></cite><a href="error.html" target="rightFrame">404页面</a><i></i></li>
        </ul>    
    </dd>

    <dd>
        <div class="title">
            <span><img src="${ctx}/static/manage/images/leftico02.png" /></span>独立演示
        </div>
        <ul class="menuson">
           <li><cite></cite><a id="web-tab" href="${ctx}/story/web" target="rightFrame">Web演示</a><i></i></li>
           <li><cite></cite><a id="webservice-tab"href="${ctx}/story/webservice" target="rightFrame">WebService演示</a><i></i></li>
           <li><cite></cite><a id="hystrix-tab" href="${ctx}/hystrix" target="rightFrame">Hystrix演示</a><i></i></li>
           <li><cite></cite><a id="jmx-tab" href="${ctx}/story/jmx" target="rightFrame">JMX演示</a><i></i></li>
           <li><cite></cite><a id="log-tab" href="${ctx}/story/log" target="rightFrame">日志高级演示</a><i></i></li>
           <li><cite></cite><a id="monitor-tab" href="${ctx}/story/monitor" target="rightFrame">性能监控演示</a><i></i></li>
        </ul>
    </dd>
    <dd>
        <div class="title">
            <span><img src="${ctx}/static/manage/images/leftico02.png" /></span>演示说明
        </div>
        <ul class="menuson">
            <li><cite></cite><a id="persistence-tab" href="${ctx}/story/persistence" target="rightFrame">持久化高级演示</a><i></i></li>
            <li><cite></cite><a id="jms-tab" href="${ctx}/story/jms" target="rightFrame">JMS演示</a><i></i></li>
            <li><cite></cite><a id="reids-tab" href="${ctx}/story/redis" target="rightFrame">Redis演示</a><i></i></li>
            <li><cite></cite><a id="cache-tab" href="${ctx}/story/cache" target="rightFrame">Cache演示</a><i></i></li>
            <li><cite></cite><a id="schedule-tab" href="${ctx}/story/schedule" target="rightFrame">定时任务演示</a><i></i></li>
            <li><cite></cite><a id="security-tab" href="${ctx}/story/security" target="rightFrame">安全高级演示</a><i></i></li>
            <li><cite></cite><a id="utilizes-tab"href="${ctx}/story/utilizes" target="rightFrame">工具类演示</a><i></i></li>
            <li><cite></cite><a id="executablewar-tab"href="${ctx}/story/executablewar" target="rightFrame">可运行war包演示</a><i></i></li>
        </ul>
    </dd>

    <dd>
    <div class="title">
    <span><img src="${ctx}/static/manage/images/leftico02.png" /></span>其他设置
    </div>
    <ul class="menuson">
        <li><cite></cite><a href="#">编辑内容</a><i></i></li>
        <li><cite></cite><a href="#">发布信息</a><i></i></li>
        <li><cite></cite><a href="#">档案列表显示</a><i></i></li>
        </ul>     
    </dd> 
    
    
    <dd><div class="title"><span><img src="${ctx}/static/manage/images/leftico03.png" /></span>编辑器</div>
    <ul class="menuson">
        <li><cite></cite><a href="#">自定义</a><i></i></li>
        <li><cite></cite><a href="#">常用资料</a><i></i></li>
        <li><cite></cite><a href="#">信息列表</a><i></i></li>
        <li><cite></cite><a href="#">其他</a><i></i></li>
    </ul>    
    </dd>  
    
    
    <dd><div class="title"><span><img src="${ctx}/static/manage/images/leftico04.png" /></span>日期管理</div>
    <ul class="menuson">
        <li><cite></cite><a href="#">自定义</a><i></i></li>
        <li><cite></cite><a href="#">常用资料</a><i></i></li>
        <li><cite></cite><a href="#">信息列表</a><i></i></li>
        <li><cite></cite><a href="#">其他</a><i></i></li>
    </ul>
    
    </dd>   
    
    </dl>
</body>
</html>
