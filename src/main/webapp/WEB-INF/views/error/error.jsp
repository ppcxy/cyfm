<%@ page session="false" %>
<%@ page import="com.ppcxy.common.entity.search.exception.SearchException" %>
<%@ page import="com.ppcxy.common.exception.ServiceException" %>
<%@ page import="com.ppcxy.common.utils.LogUtils" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.StringWriter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf" %>
<script>
    //错误页面将当前url地址切换回上一个地址
    currentURL = preHref;
</script>
<div class="tabbable-line">
    <%
        LogUtils.logPageError(request);

        Integer statusCode = (Integer) request.getAttribute("javax.servlet.error.status_code");
        pageContext.setAttribute("statusCode", statusCode);

        String uri = (String) request.getAttribute("javax.servlet.error.request_uri");
        String queryString = request.getQueryString();
        String url = uri + (queryString == null || queryString.length() == 0 ? "" : "?" + queryString);
        pageContext.setAttribute("url", url);

        Throwable exception = (Throwable) request.getAttribute("javax.servlet.error.exception");
        request.setAttribute("exception", exception);
        request.setAttribute("baseException", exception instanceof ServiceException);
        request.setAttribute("searchException",  exception instanceof SearchException);

        System.out.println(SecurityUtils.getSubject().hasRole("dev_user"));

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
