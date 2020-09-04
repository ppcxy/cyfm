<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf" %>
<html>
<head>
	<title><sys:showRtLevelName level='2' defaultName='工作组' suffix="详情"/></title>
	<style>
        .userList li{
            border-bottom: 1px solid #ccc;
            margin-top: 3px;
            height: 24px;
        }
	</style>
</head>
<body>

<div class="portlet box editBox">
	<div class="portlet-title"><span><sys:showRtLevelName level='2' defaultName='工作组' suffix="信息"/></span></div>
	<div class="portlet-body form">
		<form:form id="inputForm" modelAttribute="entity" action="#" method="post">
			<div class="form-body">
				<input type="hidden" name="id" value="${entity.id}"/>
				<div id="messageBox" class="alert alert-error form-control controls" style="display:none">输入有误，请先更正。
				</div>
				<div class="form-group">
					<label for="name" class="control-label">所属团队:</label>
					<div class="controls">
						<input value="${empty entity.id ? user.team.name : entity.team.name}" class="form-control" readonly/>
					</div>
				</div>
				<div class="form-group">
					<label for="name" class="control-label">名称:</label>
					<div class="controls">
						<input type="text" id="name" name="name" value="${entity.name}" class="form-control required"/>
					</div>
				</div>
				<div class="form-group">
					<label for="master" class="control-label">管理人员:</label>
					<div class="controls">
						<input type="text" ${not empty entity.id && user.username eq entity.master.username && user.username ne user.team.master.username ? '':'id="masterInfo"'} value="${entity.master.showName}" class="form-control required" readonly/>
						<input type="hidden" id="master" name="master" value="${entity.master.id}"/>
						<input type="hidden" id="oldMaster" name="oldMaster" value="${entity.master.id}"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label">成员(注: 点击成员可移除):</label>
					<div class="controls">
						<div class="col-xs-4">
							<ul class="userList">
								<c:forEach items="${entity.userList}" var="item">
									<li><input type="hidden" name="userList.id" value="${item.id}">${item.showName}</li>
								</c:forEach>
							</ul>
						</div>
						<div class="col-xs-2">
							<c:if test="${not empty entity.id && (user.username eq entity.master.username || user.username eq user.team.master.username)}">
								<button type="button" id="createMember" class="btn btn-sm green"><i
										class="fa fa-plus"></i>创建成员
								</button>
							</c:if>
							<button type="button" id="addMember" class="btn btn-sm blue"><i class="fa fa-plus"></i> 添加成员
							</button>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>

				<div class="form-actions">
					<input id="submit_btn" class="btn btn-primary" type="submit" value="提交"/>&nbsp;
					<p class="help-block">(点击提交保存信息.)</p>
				</div>
			</div>
		</form:form>
	</div>
</div>

<div id="userForm" style="display: none">
	<div class="portlet box editBox">
		<div class="portlet-title"><span>用户信息</span></div>
		<div class="portlet-body form">
			<form id="userInputForm" autocomplete="off">
				<div class="form-body">
					<input type="hidden" name="id" value=""/>
					<%--<div class="form-group">
						<label for="username" class="control-label">登录账号:</label>
						<div class="controls">
							<div class="input-group">
								<span class="input-group-btn">
									<button class="btn default" type="button"><i></i>${user.team.sign}_</button>
								</span>
								<input type="text" id="username" name="username" value="" class="form-control required"
								   placeholder="请填写用户登录账号" autocomplete="off"/>
							</div>
						</div>
					</div>--%>
					<div class="form-group">
						<label for="name" class="control-label">用户姓名:</label>
						<div class="controls">
							<input type="text" id="name" name="name" value="" class="form-control required"
							       autocomplete="off" placeholder="请填写真实姓名，用于显示和管理。" autocomplete="off"/>
						</div>
					</div>
					<div class="form-group">
						<label for="password" class="control-label">用户密码:</label>
						<div class="controls">
							<input type="password" id="password" name="password" class="form-control" minlength="6" maxlength="25"
							       placeholder="请填写密码" autocomplete="new-password"/>
						</div>
					</div>
					<div class="form-group">
						<label for="email" class="control-label">联系邮箱:</label>
						<div class="controls">
							<input type="text" id="email" name="email" value="" class="form-control required email"
							       placeholder="请填写电子邮箱地址，可用于登录。" autocomplete="off"/>
						</div>
					</div>
					<div class="form-group">
						<label for="tel" class="control-label">手机号码:</label>
						<div class="controls">
							<input type="text" id="tel" name="tel" value="" class="form-control required"
							       placeholder="请填写手机号码，可用于登录。"/>
						</div>
					</div>
					<div class="form-actions">
						<input id="submit_btn" class="btn btn-primary" type="button" value="提交"/>&nbsp;
						<p class="help-block">(点击提交保存信息,新用户可使用手机号或邮箱登录系统.)</p>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<script>
	$(function () {
		$("#inputForm").validate({
			rules: {
				name: {
					required: true
					,stringCheck: true
					, rangelength: [2, 20]
					, remote: {
						type: "POST",
						url: "${ctx}/sys/workGroup/checkGroupName",
						data: {
							'oldName': '${entity.name}',
							'name': function () {
								return $("#name").val();
							}
						}
					}
				}
			},
			messages: {
				name:{
					remote: "名称已被使用，请修改。"
				}
			}
		});

		$("#masterInfo").focus(function () {
			$cy.tools.chooseUser({
				callback: function (show, results) {
					$("#masterInfo").val(show);
					$("#master").val(results.data("id"));
				}
			})
		});


		var createLayer;

		$("#userInputForm").validate({
			rules: {
				password:{
					required: true,
					rangelength: [6, 25]
				},
				name: {
					required: true
					, stringCheck: true
					, rangelength: [2, 20]
				}
				, tel: {
					mobile: true,
					remote: {
						type: "POST",
						url: "${ctx}/sys/user/checkTel",
						data: {
							'oldTel': ''
							, 'tel': function () {
								return $("#tel").val();
							}
						}
					}
				}
				, email: {
					remote: {
						type: "POST",
						url: "${ctx}/sys/user/checkEmail",
						data: {
							'oldEmail': ''
							, 'email': function () {
								return $("#email").val();
							}
						}
					}
				}
			}
			, messages: {
				password:{
					rangelength: "密码需要设置为 6-25 位。"
				}
				, email: {
					remote: "邮箱已被其他用户使用."
				}
				, tel: {
					remote: "手机号码已经被其他用户使用."
				}
			}
		});

		$("#createMember").click(function () {
			createLayer = layer.open({
				title: '添加成员',
				type: 1,
				area: ['450px'],
				content: $('#userForm') //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
				, end: function () {
					layer.closeAll();
				}
			});
		});

		$("#userInputForm #submit_btn").click(function () {

			var isValid = $("#userInputForm").valid();
			if (isValid) {
				var formDatas = $("#userInputForm").serialize();
				formDatas+= "&workGroupId=${entity.id}";
				$.post("${ctx}/sys/workGroup/createMember", formDatas, function (data) {
					$("[name='userList.id'][value='" + data.id + "']").parent("li").remove();
					$(".userList").append('<li><input type="hidden" name="userList.id" value="' + data.id + '">' + data.showName + '</li>');
					layer.close(createLayer);
				});
			}
		})

		$("#addMember").click(function () {
			$cy.tools.chooseUser({
				multi: true,
				callback: function (show, results) {
					$(results).each(function (i, o) {
						var dataId = $(o).data("id");
						$("[name='userList.id'][value='" + dataId + "']").parent("li").remove();
						$(".userList").append('<li><input type="hidden" name="userList.id" value="' + dataId + '">' + $(o).data("show") + '</li>');
					});
				}
			})
		})


		$(".userList").on("click", "li", function () {
			let li = $(this);
			$cy.confirm({
				message: "是否移成员 "+li.text()+" ?",
				yes: function () {
					li.remove();
				}
			})
		})
	})
</script>
</body>
</html>
