﻿﻿<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>信息管理系统界面</title>
    <script type="text/javascript" src="${ctx}/static/plugins/jquery/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="${ctx}/static/plugins/jquery.cokie.min.js"></script>
</head>
<frameset rows="88,*" cols="*" frameborder="no" border="0" framespacing="0">
    <frame src="${ctx}/manage/top/" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" title="topFrame"/>
    <frameset cols="187,*" frameborder="no" border="0" framespacing="0">
        <frame src="${ctx}/manage/left/" name="leftFrame" scrolling="No" noresize="noresize" id="leftFrame"
               title="leftFrame"/>
        <frameset rows="40,*" cols="*" frameborder="no" border="0" framespacing="0">
            <frame src="${ctx}/manage/place/" name="place" id="place" title="rightFrame"/>
            <frame src="${ctx}/manage/index/" name="rightFrame" id="rightFrame" title="rightFrame"/>
        </frameset>
    </frameset>
</frameset>
<noframes>
    <body>
    </body>
</noframes>
</html>
