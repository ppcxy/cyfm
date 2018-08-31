<%@tag pageEncoding="UTF-8" %>
<%@ attribute name="page" type="org.springframework.data.domain.PageImpl" required="true" %>
<%@ attribute name="paginationSize" type="java.lang.Integer" required="true" %>
<%@ attribute name="showMeg" type="java.lang.Boolean" required="false" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    if (showMeg == null) {
        showMeg = true;
    }
    int current = page.getNumber() + 1;
    int begin = Math.max(1, current - paginationSize / 2);
    int end = Math.min(begin + (paginationSize - 1), page.getTotalPages());

    //当已经到尾页,开始到结束不足 paginationSize 时,重新计算开始页.

    if (page.getTotalPages() < paginationSize) {
        begin = 1;
    } else  if (end - begin < paginationSize) {
        begin = end - paginationSize + 1;
    }

    request.setAttribute("current", current);
    request.setAttribute("begin", begin);
    request.setAttribute("end", end);

%>
<div class="pagin">
    <% if (showMeg) {%>
    <div class="message">共<i class="blue">${page.totalPages}</i>页，<i class="blue">${page.totalElements}</i>条记录，当前显示第&nbsp;<i
            class="blue">${current}&nbsp;</i>页
    </div>
    <% } %>
    <ul class="paginList">
        <% if (page.hasPreviousPage()) {%>
        <li class="paginItem"><a href="?page.pn=${current-1}"><i class="fa fa-angle-left"></i></a></li>
        <%--<li><a href="?page=1&sortType=${sortType}&${searchParams}">&lt;&lt;</a></li>--%>
        <%--<li><a href="?page=${current-1}&sortType=${sortType}&${searchParams}">&lt;</a></li>--%>
        <%} else {%>
        <li class="paginItem"><a href="javascript:;" class="disabled"><i class="fa fa-angle-left"></i></a></li>
        <%} %>

        <c:forEach var="i" begin="${begin}" end="${end}">
            <c:choose>
                <c:when test="${i == current}">
                    <li class="paginItem current"><a href="?page.pn=${i}">${i}</a></li>
                    <%--<li class="active"><a href="?page=${i}&sortType=${sortType}&${searchParams}">${i}</a></li>--%>
                </c:when>
                <c:otherwise>
                    <li class="paginItem"><a href="?page.pn=${i}">${i}</a></li>
                    <%--<li><a href="?page=${i}&sortType=${sortType}&${searchParams}">${i}</a></li>--%>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <% if (page.hasNextPage()) {%>
        <li class="paginItem"><a href="?page.pn=${current+1}"><i class="fa fa-angle-right"></i></a></li>
        <%--<li><a href="?page=${current+1}&sortType=${sortType}&${searchParams}">&gt;</a></li>--%>
        <%--<li><a href="?page=${page.totalPages}&sortType=${sortType}&${searchParams}">&gt;&gt;</a></li>--%>
        <%} else {%>
        <li class="paginItem"><a href="javascript:;" class="disabled"><i class="fa fa-angle-right"></i></a></li>
        <%} %>

    </ul>
</div>
<div class="clearfix"></div>
<script type="text/javascript">
    $("div.pagin a:not(.disabled)").click(function () {
        $(this).attr("href", $(this).attr("href") + "&" + $('form.form-search').serialize() + "&" + $cy.urlTools.findSortParam(currentUrl))
    });
</script>
