<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springside.org.cn/tags/form" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>资源管理-新增</title>
	<script>
		$(document).ready(function() {
			$("#entity-tab").addClass("active");
		});
	</script>
</head>
<body>
<div class="portlet box editBox">
	<div class="portlet-title"><span>基本信息</span></div>
	<div class="portlet-body form">
		<form:form id="inputForm" action="${ctx}/resource/${action}" method="post">
			<div class="form-body">
				<input type="hidden" name="id" value="${entity.id}"/>
					<div id="messageBox" class="alert alert-error input-large controls" style="display:none">输入有误，请先更正。</div>
					<div class="form-group">
						<label for="name" class="control-label">名称:</label>
							<input type="text" id="name" name="name" value="${entity.name}" class="form-control required"/>
					</div>
					<div class="form-group">
						<label for="identity" class="control-label">标识:</label>
						<div class="controls">
							<input type="text" id="identity" name="identity" value="${entity.identity}" class="form-control required"/>
						</div>
					</div>
					<div class="form-group">
						<label for="url" class="control-label">url:</label>
						<input type="text" id="url" name="url" value="${entity.url}" class="form-control required"/>
					</div>
					<div class="form-group">
						<label for="parentId" class="control-label">parentId:</label>
						<input type="text" id="parentId" name="parentId" value="${entity.parentId}" class="form-control required"/>
					</div>
					<div class="form-group">
						<label for="parentIds" class="control-label">parentIds:</label>
						<input type="text" id="parentIds" name="parentIds" value="${entity.parentIds}" class="form-control required"/>
					</div>
					<div class="form-group">
						<label for="weight" class="control-label">weight:</label>
						<input type="text" id="weight" name="weight" value="${entity.weight}" class="form-control required"/>
					</div>
					<div class="form-group">
						<label for="icon" class="control-label">icon:</label>
						<input type="text" id="icon" name="icon" value="${entity.icon}" class="form-control required"/>
					</div>
					<div class="form-group">
						<label for="hasChildren" class="control-label">hasChildren:</label>
						<input type="text" id="hasChildren" name="hasChildren" value="${entity.hasChildren}" class="form-control required"/>
					</div>
					<div class="form-group">
						<label for="show" class="control-label">isShow:</label>
						<input type="text" id="show" name="show" data-format value="${entity.show}" class="form-control required"/>
					</div>
			</div>
			<div class="form-actions">
				<input id="submit_btn" class="btn btn-primary" type="submit" value="提交"/>&nbsp;
				<input id="cancel_btn" class="btn" type="button" value="返回" onclick="history.back()"/>
				<p class="help-block">(保存后将发送JMS消息通知改动，而消息接收者将发送提醒邮件)</p>
			</div>
		</form:form>
	</div>
</div>
</body>
</html>
