<%@ page import="org.hibernate.stat.Statistics" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf" %>
<html>
<head>
    <title>缓存控制</title>
</head>
<body>
<div data-table="table" class="tabbable-line">
    <c:set var="type" value="invalidate"/>
    <%@include file="nav.jspf" %>
    <div class="tab-content">
    <div class="muted">注意：如果想失效所有，只要不输入编号即可</div><br/>

    <a class="btn btn-evict-all">失效整个二级缓存</a>

    <a class="btn btn-clear-all">清空二级缓存，重新计算</a>


    <%
        Statistics statistics = (Statistics) request.getAttribute("statistics");
        String[] entityNames = statistics.getEntityNames();
        String[] collectionRoleNames = statistics.getCollectionRoleNames();
        String[] queries = statistics.getQueries();
        pageContext.setAttribute("entityNames", entityNames);
        pageContext.setAttribute("collectionRoleNames", collectionRoleNames);
        pageContext.setAttribute("queries", queries);

    %>
    <div class="form-inline">
        <h4>失效实体缓存：</h4>

        <form class="span7">

            <select id="entityNames" name="entityNames" multiple="true">
                <c:forEach items="${entityNames}" var="e">
                     <option value="${e}" title="${e}">${e}</option>
                </c:forEach>
            </select>
            &nbsp;&nbsp;
            <cyform:label path="entityIds">实体编号：</cyform:label>
            <cyform:input path="entityIds" cssClass="input-medium" placeholder="多个之间，逗号分隔"/>
        </form>
        <div style="line-height: 70px;">
            <a class="btn btn-evict-entity">确定</a>
            &nbsp;&nbsp;
            <a class="btn btn-evict-entity-all">失效所有实体缓存</a>
        </div>
        <br/><br/><br/>
        <h4>失效集合缓存：</h4>

        <form class="span7">
            <select id="collectionRoleNames" name="collectionRoleNames" multiple="true">
                <c:forEach items="${collectionRoleNames}" var="e">
                    <option value="${e}" title="${e}">${e}</option>
                </c:forEach>
            </select>
            &nbsp;&nbsp;
            <cyform:label path="collectionEntityIds">集合所属实体编号：</cyform:label>
            <cyform:input path="collectionEntityIds" cssClass="input-medium" placeholder="多个之间，逗号分隔"/>
        </form>
        <div style="line-height: 70px;">
            <a class="btn btn-evict-collection">确定</a>
            &nbsp;
            <a class="btn btn-evict-collection-all">失效所有集合缓存</a>
        </div>

        <br/><br/><br/>
        <h4>失效查询缓存：</h4>

        <form class="span7">
            <select id="queries" name="queries" multiple="true">
                <c:forEach items="${queries}" var="e">
                    <option value="${e}" title="${e}">${e}</option>
                </c:forEach>
            </select>
        </form>
        <div style="line-height: 70px;">
            <a class="btn btn-evict-query">确定</a>
            &nbsp;
            <a class="btn btn-evict-query-all">失效所有查询缓存</a>
        </div>

    </div>
    <br/><br/>
    </div>
</div>
<script type="text/javascript">
    $(function() {
        $(".btn-evict-all").click(function() {
            $cy.confirm({
                title: "失效整个二级缓存",
                message: "确认失效整个二级缓存吗？",
                yes: function () {
                    var url = "${ctx}/manage/monitor/hibernate/evictAll";
                    $cy.waiting("正在执行..");
                    $.ajax({
                        url: url,
                        type: "GET",
                        dataType: "text",
                        success: function (data) {
                            $cy.waitingOver();
                            $cy.success(data)
                        }
                    });
                }
            });
        });
        $(".btn-clear-all").click(function() {
            $cy.confirm({
                title: "清空整个二级缓存",
                message: "确认清空整个二级缓存,重新计算吗？",
                yes: function () {
                    var url = "${ctx}/manage/monitor/hibernate/clearAll";
                    $cy.waiting("正在执行..");
                    $.ajax({
                        url: url,
                        type: "GET",
                        dataType: "text",
                        success: function (data) {
                            $cy.waitingOver();
                            $cy.success(data)
                        }
                    });
                }
            });
        });

        $(".btn-evict-entity-all").click(function() {
            $cy.confirm({
                title: "失效所有实体缓存",
                message: "确认失效所有实体缓存吗？",
                yes: function () {
                    var url = "${ctx}/manage/monitor/hibernate/evictEntity";
                    $cy.waiting("正在执行..");
                    $.ajax({
                        url: url,
                        type: "GET",
                        dataType: "text",
                        success: function (data) {
                           $cy.waitingOver();
                            $cy.success(data)
                        }
                    });
                }
            });
        });
        $(".btn-evict-entity").click(function() {
            if(!$("#entityNames").val()) {
                $(".btn-evict-entity-all").click();
                return;
            }
            var form = $("#entityNames").closest("form");
            var url = "${ctx}/manage/monitor/hibernate/evictEntity?" + form.serialize();
            $cy.waiting("正在执行..");
            $.ajax({
                url: url,
                type: "GET",
                dataType: "text",
                success: function (data) {
                    $cy.success(data, function () {
                        $cy.waitingOver();
                    })
                }
            });
        });

        $(".btn-evict-collection-all").click(function() {
            $cy.confirm({
                title: "失效所有实体的集合缓存",
                message: "确认失效所有实体的集合缓存吗？",
                yes: function () {
                    var url = "${ctx}/manage/monitor/hibernate/evictCollection";
                    $cy.waiting("正在执行..");
                    $.ajax({
                        url: url,
                        type: "GET",
                        dataType: "text",
                        success: function (data) {
                            $cy.success(data, function () {
                                $cy.waitingOver();
                            })
                        }
                    });
                }
            });
        });
        $(".btn-evict-collection").click(function() {
            if(!$("#collectionRoleNames").val()) {
                $(".btn-evict-collection-all").click();
                return;
            }
            var form = $("#collectionRoleNames").closest("form");
            var url = "${ctx}/manage/monitor/hibernate/evictCollection?" + form.serialize();
            $cy.waiting("正在执行..");
            $.ajax({
                url: url,
                type: "GET",
                dataType: "text",
                success: function (data) {
                    $cy.success(data, function () {
                        $cy.waitingOver();
                    })
                }
            });
        });

        $(".btn-evict-query-all").click(function() {
            $cy.confirm({
                title: "失效所有查询缓存",
                message: "确认失效所有查询缓存吗？",
                yes: function () {
                    var url = "${ctx}/manage/monitor/hibernate/evictQuery";
                    $cy.waiting("正在执行..");
                    $.ajax({
                        url: url,
                        type: "GET",
                        dataType: "text",
                        success: function (data) {
                            $cy.success(data, function () {
                                $cy.waitingOver();
                            })
                        }
                    });
                }
            });
        });
        $(".btn-evict-query").click(function() {
            if(!$("#queries").val()) {
                $(".btn-evict-query-all").click();
                return;
            }
            var form = $("#quries").closest("form");
            var url = "${ctx}/manage/monitor/hibernate/evictQuery?" + form.serialize();
            $cy.waiting("正在执行..");
            $.ajax({
                url: url,
                type: "GET",
                dataType: "text",
                success: function (data) {
                    $cy.success(data, function () {
                        $cy.waitingOver();
                    })
                }
            });
        });
    });
</script>
</body>
</html>
