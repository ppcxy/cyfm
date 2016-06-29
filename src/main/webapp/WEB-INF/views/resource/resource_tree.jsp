<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<html>
<head></head>
<body>
<div id="treeMain">
    <div class="ui-layout-west tree" style="overflow-y: hidden">
        <iframe name="treeFrame" width="100%" height="100%"  frameborder="0" scrolling="auto" src="${ctx}/resource/tree?async=true"></iframe>
    </div>
    <div class="ui-layout-center tree" style="overflow-y: hidden">
        <iframe name="listFrame" width="100%" height="100%"  frameborder="0" scrolling="auto"></iframe>
    </div>
</div>
</body>
</html>
