<%@tag pageEncoding="UTF-8"%>
<%@ attribute name="batchDelete" type="java.lang.Boolean" required="false"%>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<div class="btn-group toolbar">
<shiro:hasPermission name="${resourceIdentity}:create">
	<a class="btn btn-primary create" href="${ctx}/${viewPrefix}/create"><i class="fa fa-plus"></i> 添加</a>
</shiro:hasPermission>
<shiro:hasPermission name="${resourceIdentity}:update">
	<a class="btn btn-success update" data-baseurl="${ctx}/${viewPrefix}/update/{id}"><i class="fa fa-pencil"></i> 修改</a>
</shiro:hasPermission>
<shiro:hasPermission name="${resourceIdentity}:delete">
	<c:if test="${batchDelete}">
		<a class="btn btn-warning delete batch" data-baseurl="${ctx}/${viewPrefix}/batch/delete?ids={id}"><i class="fa fa-trash-o"></i> 批量删除</a>
	</c:if>
	<c:if test="${not batchDelete}">
		<a class="btn btn-warning delete" data-baseurl="${ctx}/${viewPrefix}/delete/{id}"><i class="fa fa-trash-o"></i> 删除</a>
	</c:if>
</shiro:hasPermission>
<shiro:hasPermission name="${resourceIdentity}:custom">
	<a class="btn btn-default more"><i class="fa fa-bars"></i> 更多</a>
</shiro:hasPermission>
</div>
<shiro:hasPermission name="${resourceIdentity}:config">
	<ul class="toolbar-right">
		<li><span><img src="${ctx}/static/manage/images/t05.png" /></span>设置</li>
	</ul>
</shiro:hasPermission>

