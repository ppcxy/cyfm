<%@tag pageEncoding="UTF-8" %>
<%@ attribute name="page" type="org.springframework.data.domain.PageImpl" required="true" %>
<%@ attribute name="paginationSize" type="java.lang.Integer" required="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    int current = page.getNumber() + 1;
    int begin = Math.max(1, current - paginationSize / 2);
    int end = Math.min(begin + (paginationSize - 1), page.getTotalPages());

    request.setAttribute("current", current);
    request.setAttribute("begin", begin);
    request.setAttribute("end", end);
%>
<div class="pagin">
    <div class="message">共<i class="blue">${page.totalPages}</i>页，<i class="blue">${page.totalElements}</i>条记录，当前显示第&nbsp;<i
            class="blue">${current}&nbsp;</i>页
    </div>
    <ul class="paginList">
        <% if (page.hasPreviousPage()) {%>
        <li class="paginItem"><a href="?page.pn=${current-1}"><span class="pagepre"></span></a></li>
        <%--<li><a href="?page=1&sortType=${sortType}&${searchParams}">&lt;&lt;</a></li>--%>
        <%--<li><a href="?page=${current-1}&sortType=${sortType}&${searchParams}">&lt;</a></li>--%>
        <%} else {%>
        <li class="paginItem"><a href="javascript:;"><span class="pagepre"></span></a></li>
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
        <li class="paginItem"><a href="?page.pn=${current+1}"><span class="pagenxt"></span></a></li>
        <%--<li><a href="?page=${current+1}&sortType=${sortType}&${searchParams}">&gt;</a></li>--%>
        <%--<li><a href="?page=${page.totalPages}&sortType=${sortType}&${searchParams}">&gt;&gt;</a></li>--%>
        <%} else {%>
        <li class="paginItem"><a href="javascript:;"><span class="pagenxt"></span></a></li>
        <%} %>

    </ul>
</div>
<div class="clearfix"></div>
<script type="text/javascript">
$("div.pagin a").click(function(){
$(this).attr("href",$(this).attr("href")+"&"+$('form.form-search').serialize())
});
</script>

<%--

<div class="pagination">
    <ul>
        <% if (page.hasPreviousPage()){%>
        <li><a href="?page=1&sortType=${sortType}&${searchParams}">&lt;&lt;</a></li>
        <li><a href="?page=${current-1}&sortType=${sortType}&${searchParams}">&lt;</a></li>
        <%}else{%>
        <li class="disabled"><a href="#">&lt;&lt;</a></li>
        <li class="disabled"><a href="#">&lt;</a></li>
        <%} %>

        <c:forEach var="i" begin="${begin}" end="${end}">
            <c:choose>
                <c:when test="${i == current}">
                    <li class="active"><a href="?page=${i}&sortType=${sortType}&${searchParams}">${i}</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="?page=${i}&sortType=${sortType}&${searchParams}">${i}</a></li>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <% if (page.hasNextPage()){%>
        <li><a href="?page=${current+1}&sortType=${sortType}&${searchParams}">&gt;</a></li>
        <li><a href="?page=${page.totalPages}&sortType=${sortType}&${searchParams}">&gt;&gt;</a></li>
        <%}else{%>
        <li class="disabled"><a href="#">&gt;</a></li>
        <li class="disabled"><a href="#">&gt;&gt;</a></li>
        <%} %>

    </ul>
</div>--%>
