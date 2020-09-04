<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf" %>
<html>
<head>
	<title><sys:showRtLevelName level='1' defaultName='团队' suffix="管理"/></title>
	<style>
        ul.list {
            overflow: auto;
        }

        ul.list li {
            width: 50%;
            overflow: auto;
            float: left;
            padding: 8px;
            border-right: 1px solid #ccc;
            border-bottom: 1px solid #ccc;
        }

        ul.list li:nth-of-type(odd) {
            border-left: 1px solid #ccc;
        }

        ul.list li:first-child, li:nth-child(2) {
            border-top: 1px solid #ccc;
        }

        .user-state span{
            vertical-align: -webkit-baseline-middle;
            font-size: 14px;
        }
        .user-state.normal {
            color: blue;
        }
        .user-state.disabled {
            color: #ccc;
        }
	</style>
</head>
<body>
<div data-table="table" class="tabbable-line">
	<div class="tab-content">
		<div class="portlet box editBox">
			<div class="portlet-title"><span><sys:showRtLevelName level='1' defaultName='团队' suffix="管理"/></span></div>
			<div class="portlet-body form">
				<form>
					<div class="form-body">
						<div class="col-md-6 col-xs-12">
							<div class="control-group">
								<label for="teamName">名称</label>
								<div id="teamName" class="controls">
									${user.team.name}
								</div>
							</div>
						</div>
						<div class="col-md-6 col-xs-12">
							<div class="control-group">
								<label for="teamMaster">管理员</label>
								<div id="teamMaster" class="controls">
									${user.team.master.name}
								</div>
							</div>
						</div>
						<div class="col-md-12 col-xs-12 hidden">
							<div class="control-group">
								<label for="teamMaster">详细信息</label>
								<div id="teamRemark" class="controls">
									详细信息
								</div>
							</div>
						</div>
						<div class="col-md-12 col-xs-12">
							<div class="control-group">
								<label for="teamMember">成员信息
									<c:if test="${user.username eq user.team.master.username}">
										<button type="button" id="addTeamMember" class="btn btn-xs blue"><i
												class="fa fa-plus"></i>添加成员
										</button>
									</c:if>
								</label>
								<div id="teamMember" class="controls">
									<ul class="list">
										<c:forEach items="${users}" var="r">
											<li class="user-state ${r.status}"><span>${r.showName}</span><c:if test="${user.username eq user.team.master.username}"><span style="float: right"><button type="button" class="btn btn-sm ${r.status == 'normal' ? 'red' : 'green'} changeMemberStatue text-right" data-memberid="${r.id}" data-enable="${r.status eq 'normal'}">${r.status == 'normal' ? '禁用' : '启用'}</button></span></c:if></li>
										</c:forEach>
									</ul>
									<div class="clearfix"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="clearfix"></div>
				</form>
			</div>
		</div>
		<div class="clearfix"></div>
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
		$cy.handleUniform();

		var userFormValidate = $("#userInputForm").validate({
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

		$("#addTeamMember").click(function () {
			layer.open({
				title: '添加成员',
				type: 1,
				area: ['450px'],
				content: $('#userForm') //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
				, end: function () {
					layer.closeAll();
				}
			});
		});

		$(".changeMemberStatue").click(function () {
			var btn = $(this);
			var memberId = $(this).data("memberid");
			var enable = $(this).data("enable");

			$.post("${ctx}/sys/myteam/changeMemberState", {"memberId":memberId,"enable": !enable}, function (data) {
				if (data == 'success') {
					btn.data("enable", !enable).text(enable ? "启用" : "禁用").removeClass(!enable ? "green" : "red").addClass(enable ? "green" : "red").parents("li").removeClass(!enable ? "blocked" : "normal").addClass(enable ? "blocked" : "normal");
				} else if (data == 'error') {
					$cy.error("禁用用户失败，请联系管理员。")
				} else {
					$cy.warn(data);
				}
			}, "text");


		});



		$("#userInputForm #submit_btn").click(function () {

			var isValid = $("#userInputForm").valid();
			if (isValid) {
				var formDatas = $("#userInputForm").serialize();

				$.post("${ctx}/sys/myteam/addMember", formDatas, function (data) {
					alert("添加成功");
					window.location.reload();
				}, "text");
			}
		})
	})
</script>
</body>
</html>
