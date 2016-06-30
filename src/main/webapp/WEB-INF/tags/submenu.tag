<%@tag pageEncoding="UTF-8" description="构建子菜单" %>
<%@ attribute name="menu" type="com.tx.sys.resource.entity.tmp.Menu" required="true" description="当前菜单" %>
<%@ attribute name="parentName" type="java.lang.String" required="true" description="父菜单名" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="mm" tagdir="/WEB-INF/tags" %>
<c:choose>
    <c:when test="${!menu.hasChildren}">
        <li>
            <a href="javascript:;" nav-n="${parentName},${menu.name},<%=menuUrl(request, menu.getUrl())%>,${menu.menuType}">
                <i class="${menu.icon}"></i>
                <span class="title">${menu.name}</span>
            </a>
        </li>
    </c:when>
    <c:otherwise>
        <li>
            <a href="javascript:;">
                <i class="${menu.icon}"></i>
                <span class="title">${menu.name}</span><span class="arrow"></span>
            </a>
            <ul class="sub-menu">
                <c:forEach items="${menu.children}" var="menu2">
                    <mm:submenu menu="${menu2}" parentName="${parentName},${menu.name}"/>
                </c:forEach>
            </ul>
        </li>
    </c:otherwise>
</c:choose>

<%!
    private static String menuUrl(HttpServletRequest request, String url) {
        if(url.startsWith("http")) {
            return url;
        }
        String ctx = request.getContextPath();

        if(url.startsWith(ctx) || url.startsWith("/" + ctx  )) {
            return url;
        }

        if(!url.startsWith("/")) {
            url = url + "/";
        }
        return ctx + url;

    }
%>

