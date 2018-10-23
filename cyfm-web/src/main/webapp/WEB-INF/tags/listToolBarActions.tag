<%@tag pageEncoding="UTF-8" %>
<%@ attribute name="batchDelete" type="java.lang.Boolean" required="false" description="是否批量删除,默认为是." %>
<%@include file="/WEB-INF/views/common/taglibs.jspf" %>
<%
    if (batchDelete == null) {
        batchDelete = true;
        request.setAttribute("batchDelete", batchDelete);
    }
%>
<div class="btn-group toolbar">
    <shiro:hasPermission name="${resourceIdentity}:create">
        <a class="btn btn-primary create" href="${ctx}/${viewPrefix}/create"><i class="fa fa-plus"></i> 添加</a>
    </shiro:hasPermission>
    <shiro:hasPermission name="${resourceIdentity}:update">
        <a class="btn btn-success update" data-baseurl="${ctx}/${viewPrefix}/update/{id}"><i class="fa fa-pencil"></i>
            修改</a>
    </shiro:hasPermission>
    <shiro:hasPermission name="${resourceIdentity}:delete">
        <c:if test="${batchDelete}">
            <a class="btn btn-warning delete batch" data-baseurl="${ctx}/${viewPrefix}/batch/delete?ids={id}"><i
                    class="fa fa-trash-o"></i> 批量删除</a>
        </c:if>
        <c:if test="${not batchDelete}">
            <a class="btn btn-warning delete" data-baseurl="${ctx}/${viewPrefix}/delete/{id}"><i
                    class="fa fa-trash-o"></i> 删除</a>
        </c:if>
    </shiro:hasPermission>
    <shiro:hasPermission name="${resourceIdentity}:custom">
        <div class="btn-group more hidden">
            <button type="button" class="btn  btn-default dropdown-toggle no-disabled" data-toggle="dropdown"
                    aria-expanded="false">
                <i class="fa fa-bars"></i> 更多 <i class="fa fa-angle-down"></i>
            </button>
            <ul class="dropdown-menu">
                <shiro:hasPermission name="${resourceIdentity}:export">
                    <li title="当前查询条件本页数据"><a class="data-ajax" href="javascript:;" data-ajax-href="${ctx}/${viewPrefix}/exportExcel?exportModel=current" data-ajax-callback="$cy.info('导出执行成功,请关注系统消息.')"><i class="fa fa-file-excel-o"></i>导出当前数据</a></li>
                </shiro:hasPermission>
                <shiro:hasPermission name="${resourceIdentity}:export">
                    <li title="当前查询条件全部数据"><a class="data-ajax" href="javascript:;" data-ajax-href="${ctx}/${viewPrefix}/exportExcel?exportModel=all" data-ajax-callback="$cy.info('导出执行成功,请关注系统消息.')"><i class="fa fa-file-excel-o"></i>导出全部数据</a></li>
                    <li class="divider"></li>
                </shiro:hasPermission>
                <shiro:hasPermission name="${resourceIdentity}:import">
                    <li><a href="javascript:;"><i class="fa fa-file-excel-o"></i>导入数据</a></li>
                </shiro:hasPermission>
                <li class="divider"></li>
                <li class="more_list">
                </li>
            </ul>
        </div>
    </shiro:hasPermission>
</div>
<shiro:hasPermission name="${resourceIdentity}:config">
    <ul class="toolbar-right">
        <li>
            <div class="btn-group config">
                <button type="button" class="btn btn-default dropdown-toggle no-disabled" data-toggle="dropdown"
                        aria-expanded="false">
                    <i class="fa fa-cog"></i> 设置 <i class="fa fa-angle-down"></i>
                </button>
                <ul class="dropdown-menu pull-right">
                    <li class="more_list">
                        <a onclick="javascript:$cy.urlTools.resetSortUrl()">重置排序</a>
                        <a onclick="javascript:$cy.urlTools.resetSearchParamUrl()">重置查询</a>
                        <a onclick="javascript:$('.search-toolbar').toggle()">显示/隐藏查询</a>
                    </li>
                </ul>
            </div>
        </li>
    </ul>
</shiro:hasPermission>
