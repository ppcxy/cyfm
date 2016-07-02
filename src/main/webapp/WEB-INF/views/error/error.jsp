<%@ page session="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.ppcxy.common.entity.search.exception.SearchException" %>
<%@ page import="com.ppcxy.common.exception.BaseException" %>
<%@ page import="com.ppcxy.common.utils.LogUtils" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.StringWriter" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
    <style>
        th {
            border-bottom-width: 1px !important;
        }
    </style>
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
    <title></title>
</head>
<body>
<div class="tabbable-line">
    <%
        Integer status = (Integer) request.getAttribute("javax.servlet.error.status_code");
        String reason = (String) request.getAttribute("javax.servlet.error.message");


        LogUtils.logPageError(request);
        Integer statusCode = (Integer) request.getAttribute("javax.servlet.error.status_code");
        pageContext.setAttribute("statusCode", statusCode);

        String uri = (String) request.getAttribute("javax.servlet.error.request_uri");
        String queryString = request.getQueryString();
        String url = uri + (queryString == null || queryString.length() == 0 ? "" : "?" + queryString);
        pageContext.setAttribute("url", url);

        Throwable exception = (Throwable) request.getAttribute("javax.servlet.error.exception");
        request.setAttribute("exception", exception);
        request.setAttribute("baseException", exception instanceof BaseException);
        request.setAttribute("searchException", exception instanceof SearchException);

    %>

    <c:if test="${statusCode eq 404}">
        <cy:showMessage
                errorMessage="<h3 style='display:inline;'>页面没有找到！</h3><br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;对不起，暂时没有找到您所访问的页面地址,请联系管理员解决此问题！&nbsp;&nbsp;&nbsp;&nbsp;<refresh><a href='${url}' class='btn btn-danger'>刷新页面</a></refresh>"/>
    </c:if>

    <c:if test="${statusCode ne 404}">
        <c:if test="${baseException}">
            <cy:showMessage
                    errorMessage="<h4 style='display:inline;'>系统异常！</h4><br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;${exception.message}</a>"/>
        </c:if>
        <c:if test="${searchException}">
            <cy:showMessage
                    errorMessage="<h4 style='display:inline;'>查询参数错误！</h4><br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;${exception.message}</a>"/>
        </c:if>
        <c:if test="${not baseException && not searchException}">
            <cy:showMessage
                    errorMessage="<h3 style='display:inline;'>网络服务出现问题！</h3><br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;请刷新后尝试重新访问。如果仍然无法解决，者联系管理员解决此问题！&nbsp;&nbsp;&nbsp;&nbsp;<refresh><a href='${url}' class='btn btn-danger'>刷新页面</a></refresh>"/>
        </c:if>
        <shiro:hasRole name="dev_user">
            <c:if test="${not empty exception}">
                <%
                    StringWriter stringWriter = new StringWriter();
                    PrintWriter printWriter = new PrintWriter(stringWriter);
                    exception.printStackTrace(printWriter);
                    pageContext.setAttribute("stackTrace", stringWriter.toString());
                %>
                <%@include file="exceptionDetails.jsp" %>
            </c:if>
        </shiro:hasRole>
    </c:if>
</div>
</body>
</html>
