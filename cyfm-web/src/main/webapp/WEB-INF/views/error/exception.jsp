<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<style>
    div.message{
        margin-bottom:0;
    }
</style>
<div class="tabbable-line">
    <cy:showMessage errorMessage="${error.message}"/>
    <c:set var="stackTrace" value="${error.stackTrace}"/>
    <shiro:hasRole name="dev_user">
        <%@include file="exception_details.jsp" %>
    </shiro:hasRole>
</div>
