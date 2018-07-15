<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>默认工作台</title>
<link href="${ctx}/static/manage/css/style.css?2" rel="stylesheet" type="text/css" />
<%@include file="/WEB-INF/views/common/import-js.jspf"%>
    <script>
        function formatDate(date) {
            var d = date,
                month = '' + (d.getMonth() + 1),
                day = '' + d.getDate(),
                year = d.getFullYear(),
                hours = d.getHours(),
                minutes = d.getMinutes(),
                seconds = d.getSeconds();

            console.log(seconds.length)

            //这就是判断当前如果是1位的话前面补个0 比如 01 02
            if (month.length < 2) month = '0' + month;
            if (day.length < 2) day = '0' + day;
            if (hours < 10) hours = '0' + hours;
            if (minutes < 10) minutes = '0' + minutes;
            if (seconds < 10) seconds = '0' + seconds;

            //返回拼的字符串 [xx,xx,xx].join('-') 就是用-连接 前面[]里的东西
            return [year, month, day].join('-') + " " + [hours, minutes, seconds].join(':');
        }

        function showTime() {
            //先显示当前时间 new Date()  是获取当前时间对象
            
            $(".clock").text(formatDate(new Date()))
            //隔一秒在次调用自己,达到每秒刷新一次显示的效果
            setTimeout(function () {
                //再次调用自己
                showTime();
            }, 1000);
        }

        //页面加载完成后执行上面的自定义函数
        $(function () {
            // showTime()
        })
    </script>
</head>
<body>
<div class="rightinfo">
    <div class="mainindex">

        <div class="welinfo">
            <span><img src="${ctx}/static/manage/images/sun.png" alt="天气"/></span>
            <b style="color:blue;font-weight: 900">[<shiro:principal property="name"/>](<shiro:principal property="username"/>)</b> <b>早上好，欢迎使用${cy_systemName}</b>
            <a href="#">帐号设置</a>
        </div>

        <div class="welinfo">
            <span><img src="${ctx}/static/manage/images/time.png" alt="时间"/></span>
            <i>您上次登录的时间：2013-10-09 15:22</i> （不是您登录的？<a href="#">请点这里</a>）
        </div>

        <div class="xline"></div>

        <%--
        <ul class="iconlist">

            <li><img src="${ctx}/static/manage/images/ico01.png"/>
                <p><a href="#">管理设置</a></p></li>
            <li><img src="${ctx}/static/manage/images/ico02.png"/>
                <p><a href="#">发布文章</a></p></li>
            <li><img src="${ctx}/static/manage/images/ico03.png"/>
                <p><a href="#">数据统计</a></p></li>
            <li><img src="${ctx}/static/manage/images/ico04.png"/>
                <p><a href="#">文件上传</a></p></li>
            <li><img src="${ctx}/static/manage/images/ico05.png"/>
                <p><a href="#">目录管理</a></p></li>
            <li><img src="${ctx}/static/manage/images/ico06.png"/>
                <p><a href="#">查询</a></p></li>

        </ul>

        <div class="ibox"><a class="ibtn"><img src="${ctx}/static/manage/images/iadd.png"/>添加新的快捷功能</a></div>

        <div class="xline"></div>
        <div class="box"></div>

        <div class="welinfo">
            <span><img src="${ctx}/static/manage/images/dp.png" alt="提醒"/></span>
            <b>ppcxy信息管理系统使用指南</b>
        </div>

        <ul class="infolist">
            <li><span>您可以快速进行文章发布管理操作</span><a class="ibtn">发布或管理文章</a></li>
            <li><span>您可以快速发布产品</span><a class="ibtn">发布或管理产品</a></li>
            <li><span>您可以进行密码修改、账户设置等操作</span><a class="ibtn">账户管理</a></li>
        </ul>

        <div class="xline"></div>

        <div class="ppcxyinfo"><b>查看ppcxy网站使用指南，您可以了解到多种风格的B/S后台管理界面,软件界面设计，图标设计，手机界面等相关信息</b>(<a
                href="http://www.ppcxy.com" target="_blank">www.ppcxy.com</a>)
        </div>

        <ul class="umlist">
            <li><a href="#">如何发布文章</a></li>
            <li><a href="#">如何访问网站</a></li>
            <li><a href="#">如何管理广告</a></li>
            <li><a href="#">后台用户设置(权限)</a></li>
            <li><a href="#">系统设置</a></li>
        </ul>
    </div>
    --%>
    </div>
</div>
</body>
</html>
