<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springside.org.cn/tags/form" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>资源管理-新增</title>
	<script src="${ctx}/static/jquery-validation/1.11.1/jquery.validate.min.js" type="text/javascript"></script>
	<script src="${ctx}/static/jquery-validation/1.11.1/messages_bs_zh.js" type="text/javascript"></script>
	<link href="${ctx}/static/jquery-validation/1.11.1/validate.css" type="text/css" rel="stylesheet" />
	<script>
		$(document).ready(function() {
			$("#entity-tab").addClass("active");
		});
	</script>
</head>

<body>
	<h1>资源管理-新增</h1>
	<form:form id="inputForm" modelAttribute="user" action="${ctx}/resource/${action}" method="post" class="form-horizontal">
		<input type="hidden" name="id" value="${entity.id}"/>
		<fieldset>
			<legend><small>资源管理</small></legend>
			<div id="messageBox" class="alert alert-error input-large controls" style="display:none">输入有误，请先更正。</div>
			<div class="control-group">
				<label for="name" class="control-label">名称:</label>
				<div class="controls">
					<input type="text" id="name" name="name" value="${entity.name}" class="input-large required"/>
				</div>
			</div>
			<div class="control-group">
				<label for="identity" class="control-label">标识:</label>
				<div class="controls">
					<input type="text" id="identity" name="identity" value="${entity.identity}" class="input-large required"/>
				</div>
			</div>
			<div class="control-group">
				<label for="url" class="control-label">url:</label>
				<div class="controls">
					<input type="text" id="url" name="url" value="${entity.url}" class="input-large required"/>
				</div>
			</div>
			<div class="control-group">
				<label for="parentId" class="control-label">parentId:</label>
				<div class="controls">
					<input type="text" id="parentId" name="parentId" value="${entity.parentId}" class="input-large required"/>
				</div>
			</div>
			<div class="control-group">
				<label for="parentIds" class="control-label">parentIds:</label>
				<div class="controls">
					<input type="text" id="parentIds" name="parentIds" value="${entity.parentIds}" class="input-large required"/>
				</div>
			</div>
			<div class="control-group">
				<label for="weight" class="control-label">weight:</label>
				<div class="controls">
					<input type="text" id="weight" name="weight" value="${entity.weight}" class="input-large required"/>
				</div>
			</div>
			<div class="control-group">
				<label for="icon" class="control-label">icon:</label>
				<div class="controls">
					<input type="text" id="icon" name="icon" value="${entity.icon}" class="input-large required"/>
				</div>
			</div>
			<div class="control-group">
				<label for="hasChildren" class="control-label">hasChildren:</label>
				<div class="controls">
					<input type="text" id="hasChildren" name="hasChildren" value="${entity.hasChildren}" class="input-large required"/>
				</div>
			</div>
			<div class="control-group">
				<label for="show" class="control-label">isShow:</label>
				<div class="controls">
					<input type="text" id="show" name="show" value="${entity.show}" class="input-large required"/>
				</div>
			</div>
			<div class="form-actions">
				<input id="submit_btn" class="btn btn-primary" type="submit" value="提交"/>&nbsp;	
				<input id="cancel_btn" class="btn" type="button" value="返回" onclick="history.back()"/>
				<p class="help-block">(保存后将发送JMS消息通知改动，而消息接收者将发送提醒邮件)</p>			
			</div>
		</fieldset>
	</form:form>
</body>
</html>
