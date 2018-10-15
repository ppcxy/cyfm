<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<html>
<head>
  <title>系统通知管理</title>
</head>

<body>
<div class="tools">
    <div class="btn-group toolbar">
        <a class="btn btn-primary update" data-baseurl="${ctx}/${viewPrefix}/{id}"><i class="fa fa-eye"></i> 查看</a>
        <a class="btn btn-success custom batchMarkRead" data-baseurl="${ctx}/${viewPrefix}/markRead?ids={id}"><i class="fa fa-envelope-open-o"></i> 已读</a>
        <shiro:hasPermission name="${resourceIdentity}:delete">
        <a class="btn btn-warning delete batch" data-baseurl="${ctx}/${viewPrefix}/batch/delete?ids={id}"><i class="fa fa-trash-o"></i> 删除</a>
        </shiro:hasPermission>
        <div class="btn-group more hidden">
            <button type="button" class="btn  btn-default dropdown-toggle no-disabled" data-toggle="dropdown" aria-expanded="false">
                <i class="fa fa-bars"></i> 更多 <i class="fa fa-angle-down"></i>
            </button>
            <ul class="dropdown-menu">
                <li class="more_list">
                </li>
            </ul>
        </div>
    </div>
    <shiro:hasPermission name="${resourceIdentity}:config">
        <ul class="toolbar-right">
            <li>
                <div class="btn-group config">
                    <button type="button" class="btn btn-default dropdown-toggle no-disabled" data-toggle="dropdown" aria-expanded="false">
                        <i class="fa fa-cog"></i> 设置 <i class="fa fa-angle-down"></i>
                    </button>
                    <ul class="dropdown-menu pull-right">
                        <li class="more_list">
                            <a href="javascript:$cy.urlTools.resetSortUrl()">重置排序</a>
                            <a href="javascript:$cy.urlTools.resetSearchParamUrl()">重置查询</a>
                            <a href="javascript:$('.search-toolbar').toggle()">显示/隐藏查询</a>
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
            <label>通知标题：</label> <input type="text" name="search.title_like"   class="form-control input-small"  value="${param['search.title_like']}">
        </div>
        <div class="form-group">
            <label>所属系统：</label>
            <select name="search.system_eq" class="form-control input-small">
                <option value="">请选择</option>
                <c:forEach items="${systemList}" var="system">
                 <option value="${system}">${system.info}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label>阅读状态：</label>
            <select name="search.read_eq" class="form-control input-small">
                <option value="">全部</option>
                <c:forEach items="${readList}" var="read">
                    <option value="${read}">${read.info}</option>
                </c:forEach>
            </select>
            <script>
                $("[name='search.read_eq']").val("${param['search.read_eq']}")
                $("[name='search.system_eq']").val("${param['search.system_eq']}")
            </script>
        </div>
        <div class="form-group">
            <label>通知时间：</label>
            <div class="input-group">
                <input type="text" name="search.date_gte"   class="form-control"  value="${param['search.date_gte']}" data-format="date">
                <span class="input-group-addon">到</span>
                <input type="text" name="search.date_lte"   class="form-control"  value="${param['search.date_lte']}" data-format="date">
            </div>

        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-default" id="search_btn">查询</button>
        </div>
         </div>
       </form>
   </div>
 </div>
<div class="listTableWrap">

    <table id="contentTable" data-tid="notification" class="table table-list table-sort table-striped table-bordered table-hover table-condensed table-advance">
        <thead>
        <tr>
            <th class="check"><input type="checkbox"></th>
            <th data-sort="title">标题</th>
            <th data-sort="system">所属系统</th>
            <th>通知内容</th>
            <th data-sort="date">通知时间</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.content}" var="notification">
            <tr>
                <td class="check"><input name="ids" type="checkbox" value="${notification.id}"></td>
                <td style="text-indent:0px;"><i class="fa${not notification.read ? ' fa-envelope' : ' fa-envelope-open-o'}" style="color:${not notification.read ? '#FFA646' : '#D2D2D2'};"></i> <cy:digest content="${notification.title}" length="100"/></td>
                <td>${notification.system.info}</td>
                <td><cy:digest content="${notification.content}" length="100"/></td>
                <td nowrap="nowrap"><fmt:formatDate value="${notification.date}" type="both" pattern="yyyy-MM-dd HH:mm"/></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
 <cy:pagination page="${page}" paginationSize="5"/>
<script>
    $(".batchMarkRead").click(function () {
        var baseUrl = $(this).data("baseurl");

        $cy.confirm({
            message: "将要执行标记已读操作,标记后将不在显示未读状态,是否继续?", yes: function () {

                var checkItemVal = "";

                $("tr td.check input:checked").each(function () {
                    checkItemVal = checkItemVal + $(this).val() + ",";
                });
                checkItemVal = checkItemVal.substring(0, checkItemVal.length - 1);

                window.location.href = baseUrl.replace("{id}", checkItemVal) + (baseUrl.indexOf("?") > 0 ? "&" : "?") + "BackURL=" + $cy.urlTools.encodeBackURL();
            }
        });
    })
</script>
</body>
</html>
