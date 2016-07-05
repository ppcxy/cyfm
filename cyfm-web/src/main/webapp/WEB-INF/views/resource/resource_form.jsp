<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<html>
<head>
	<style>
		th {
			border-bottom-width: 1px !important;
		}
	</style>
	<!-- ================================= Css 区域 ========================================== -->
	<link type="image/x-icon" href="${ctx}/static/images/favicon.ico" rel="shortcut icon">

	<!-- 插件扩展区 bengin-->
	<link href="${ctx}/static/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
	<link href="${ctx}/static/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css"/>
	<link href="${ctx}/static/plugins/bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
	<link href="${ctx}/static/plugins/jquery-ui-bootstrap/css/font-wesome/font-awesome.min.css" rel="stylesheet" type="text/css"/>
	<link href="${ctx}/static/plugins/jquery-ui-bootstrap/css/custom-theme/jquery-ui-1.10.3.custom.css" type="text/css" rel="stylesheet" />
	<link href="${ctx}/static/plugins/jquery-ui-bootstrap/css/layout-default-1.3.0.css" type="text/css" rel="stylesheet" />
	<link href="${ctx}/static/plugins/uniform/css/uniform.default.css" type="text/css" rel="stylesheet" />

	<%@include file="/WEB-INF/views/common/import-zTree-css.jspf"%>
	<!-- 插件扩展区 end-->

	<link href="${ctx}/static/styles/default.min.css" type="text/css" rel="stylesheet" />
	<link href="${ctx}/static/styles/components.css" type="text/css" rel="stylesheet" />

	<!-- ================================= JS 区域 ========================================== -->
	<!-- 插件扩展区 bengin-->
	<script src="${ctx}/static/plugins/jquery/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="${ctx}/static/plugins/jquery-ui-bootstrap/js/jquery-ui-1.10.3.custom.js"></script>
	<script src="${ctx}/static/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="${ctx}/static/plugins/laydate/laydate.dev.js" type="text/javascript"></script>
	<script src="${ctx}/static/plugins/layer-dialog/layer-dialog.dev.js"></script>
	<script src="${ctx}/static/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
	<!-- 插件扩展区 end-->

	<script src="${ctx}/static/js/common.js?4" type="text/javascript"></script>
	<title>资源管理-新增</title>
	<script>
		$(document).ready(function() {
			$("#entity-tab").addClass("active");
			$.app.handleUniform();
		});
	</script>
</head>
<body>
<div class="tabbable-line">
	<!-- form -->
	<div>
		<!-- BEGIN SAMPLE FORM PORTLET-->
		<div class="portlet-body form">
			<form:form id="editForm" method="post" commandName="m"  role="form" enctype="multipart/form-data">
				<cy:showGlobalError commandName="m"/>

				<form:hidden path="id"/>
				<form:hidden path="parentId"/>
				<form:hidden path="parentIds"/>
				<form:hidden path="weight"/>
				<div class="form-body">
					<div class="form-group">
						<form:label path="name">名称</form:label>
						<div class="controls">
							<form:input path="name" cssClass="form-control validate[required,custom[name]]" placeholder="小于50个字符"/>
						</div>
					</div>

					<div class="form-group">
						<form:label path="identity">资源标识</form:label>
						<div class="controls">
							<form:input path="identity" cssClass="form-control" placeholder="用于权限验证"/>
						</div>
					</div>

					<div class="form-group">
						<form:label path="url">URL地址</form:label>
						<div class="controls">
							<form:input path="url" cssClass="form-control" placeholder="菜单跳转地址"/>
						</div>
					</div>

					<div class="form-group">
						<form:label path="resourceType">打开方式</form:label>
						<div>
						<div class="radio-list">
							<cyform:radiobuttons
									path="resourceType" items="${resourceTypes}" itemLabel="info" itemValue="value" cssClass="validate[required]"/>
						</div>
						</div>
					</div>

					<div class="form-group">
						<form:label path="icon">图标</form:label>
						<div class="controls">
							<form:input path="icon" cssClass="form-control"/><maintain:showIcon iconIdentity="${m.icon}"/>
						</div>
					</div>

					<div class="form-group">
						<form:label path="show">是否显示</form:label>
						<div>
							<div class="radio-list">
								<cyform:radiobuttons
										path="show" items="${booleanList}" itemLabel="info" itemValue="value" cssClass="validate[required]"/>
							</div>
						</div>
					</div>
					<div class="form-actions">
						<c:if test="${action eq '新增'}">
							<c:set var="icon" value="icon-file-alt"/>
						</c:if>
						<c:if test="${action eq '修改'}">
							<c:set var="icon" value="icon-edit"/>
						</c:if>
						<c:if test="${action eq '删除'}">
							<c:set var="icon" value="icon-trash"/>
						</c:if>
						<button type="submit" class="btn btn-primary">
							<i class="${icon}"></i>
								${action}
						</button>
					</div>
				</div>
			</form:form>
		</div>
		<!-- END SAMPLE FORM PORTLET-->
	</div>
</div>
<script>

	//在这里面输入任何合法的js语句
//	layer.open({
//		type: 1, //page层
//		area: ['500px', '300px'],
//		title: '你好，layer。',
//		shade: 0.6, //遮罩透明度
//		moveType: 1, //拖拽风格，0是默认，1是传统拖动
//		shift: 1, //0-6的动画形式，-1不开启
//		content: $("#inputForm")
//	});
</script>
</body>
</html>
