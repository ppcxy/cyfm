<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
    <title>${cy_systemName}:<sitemesh:title/></title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <meta http-equiv="Cache-Control" content="no-store"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <!-- ================================= Css 区域 ========================================== -->
    <%@include file="/WEB-INF/views/common/import-css.jspf" %>
    <!-- ================================= JS 区域 ========================================== -->
    <script>
        var $cy = {};
    </script>
    <%@include file="/WEB-INF/views/common/import-js.jspf" %>
    <sitemesh:head/>
</head>
<body>
<c:if test="${not empty message or not empty error}">
    <cy:showMessage/>
</c:if>
<c:if test="${not empty page && not customToolbar}">
    <div class="tools">
        <cy:listToolBarActions/>
    </div>
</c:if>
<div>
<sitemesh:body/>
</div>
<script>
    var index = parent.layer.getFrameIndex(window.name);
    if (top == parent && !index){
        $cy.place.appendUrl(document.title.substring("${cy_systemName}".length+1), urlPrefix, urlSuffix);
    }
    <cy:showFieldError commandName="entity"/>
</script>
</body>
</html>
