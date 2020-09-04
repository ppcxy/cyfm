<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<html>
<head>
    <title>在线用户管理</title>
</head>
<body>
<div class="tools">
    <div class="btn-group toolbar">

        <shiro:hasPermission name="sys:userOnline or monitor:userOnline"><%-- 等价于sys:userOnline:* 所有权限 --%>
            <a class="btn btn-default btn-force-logout">
                <span class="icon-lightbulb"></span>
                强制退出
            </a>
        </shiro:hasPermission>
        <div class="btn-group">
            <button type="button" class="btn blue dropdown-toggle no-disabled" data-toggle="dropdown">
                <i class="fa fa-ellipsis-horizontal"></i> 更多 <i class="fa fa-angle-down"></i>
            </button>
            <ul class="dropdown-menu">
                <li>
                    <a href="javascript:;" onclick="refreshPage()">
                        <i class="fa fa-refresh"></i>
                        刷新页面
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <shiro:hasPermission name="${resourceIdentity}:config">
        <ul class="toolbar-right">
            <li>
                <div class="btn-group config">
                    <button type="button" class="btn btn-default dropdown-toggle no-disabled" data-toggle="dropdown" aria-expanded="false">
                        <i class="fa fa-cog"></i> <span class="hidden-xs">设置</span> <i class="fa fa-angle-down hidden-xs"></i>
                    </button>
                    <ul class="dropdown-menu pull-right">
                        <li class="more_list">
                            <a onclick="javascript:$cy.table.resetTableResize($('table')[0])">重置表格</a>
                            <a onclick="javascript:$cy.urlTools.resetSortUrl()">重置排序</a>
                            <a onclick="javascript:$cy.urlTools.resetSearchParamUrl()">重置查询</a>
                            <a onclick="javascript:$('.search-toolbar').toggle();updateTheadTop();">显示/隐藏查询</a>
                        </li>
                    </ul>
                </div>
            </li>
        </ul>
    </shiro:hasPermission>
</div>
<div class="tools search-toolbar">
    <div class="toolbar-right">
        <form class="form-search form-inline text-right" action="#">
            <div class="form-group">
                <label>用户名：<input type="text" name="search.username_like" class="form-control input-small"
                                   value="${param['search.username_like']}"></label>
                <label>状态：
                    <select name="search.status_eq" class="form-control input-small" value="${param['search.status_eq']}">
                        <c:forEach items="${statusList}" var="r">
                            <option value="${r}">${r.info}</option>
                        </c:forEach>
                    </select>
                </label>
                <script>
                    $("[name='search.status_eq']").val("${param['search.status_eq']}")
                </script>
            </div>
            <div class="form-group">
                <label><button type="submit" class="btn btn-default" id="search_btn">查询</button></label>
            </div>
        </form>
    </div>
</div>
<div class="listTableWrap">
    <table id="contentTable" data-tid="${modelName}" class="table table-list table-sort table-striped table-bordered table-hover table-condensed table-advance">
        <thead>
        <tr>
            <th class="check">
                <a class="check check-all" href="javascript:;" title="全选|取消"><i class="fa fa-square-o"></i></a>
                |
                <a class="check reverse-all" href="javascript:;" title="反选"><i class="fa fa-star-half-o"></i></a>
            </th>
            <th sort="username">用户</th>
            <th sort="host" style="width: 150px;">用户主机IP</th>
            <th sort="systemHost" style="width: 150px;">系统主机IP</th>
            <th sort="startTimestamp">登录时间</th>
            <th sort="lastAccessTime">最后访问时间</th>
            <th sort="status">状态</th>
            <th sort="userAgent" style="width: 150px;">User-Agent</th>
            <th>用户会话ID</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.content}" var="m">
            <tr>
                <td class="check">
                    <input type="checkbox" name="ids" value="${m.id}"/>
                </td>
                <td>
                    <c:if test="${m.userId eq 0}">游客</c:if>
                    <a class="nojump" href="${ctx}/admin/sys/user/${m.userId}">${m.username}</a>
                </td>
                <td>${m.host}</td>
                <td>${m.systemHost}</td>
                <td><pretty:prettyTime date="${m.startTimestamp}"/></td>
                <td title="${m.lastAccessTime}"><pretty:prettyTime date="${m.lastAccessTime}"/></td>
                <td>${m.status.info}</td>
                <td>${m.userAgent}</td>
                <td>${m.id}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<cy:pagination page="${page}" paginationSize="5"/>
<script type="text/javascript">
    $(function() {
        $(".btn-force-logout").click(function() {
            var checkbox = $cy.table.getAllSelectedCheckbox($(".table"));
            if(!checkbox.length) {
                return;
            }
            $cy.confirm({
                message : "确认强制退出吗？",
                yes : function() {
                    var url = ctx + "/sys/user/online/forceLogout?" + checkbox.serialize();
                    window.location.href = url;
                }
            });
        });
    });
</script>
</body>
</html>
