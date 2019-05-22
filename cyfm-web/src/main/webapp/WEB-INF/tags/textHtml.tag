<%@ tag import="com.ppcxy.common.utils.HtmlUtils" %>
<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ attribute name="content" type="java.lang.String" required="true" description="内容" %>
<%=HtmlUtils.text(content)%>
