<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<html>
<head>
    <title>个人中心</title>
    <style>
        .controls{
            font-size: 14px;
        }
    </style>
</head>
<body>
<div data-table="table" class="tabbable-line">
    <%@include file="nav.jspf"%>
    <div class="tab-content">
        <div class="portlet box editBox">
            <div class="portlet-title"><span>我的资料</span></div>
            <div class="portlet-body form">
                <form id="inputForm" method="post" action="#">
                    <div class="form-body">
                        <div class="col-md-6 col-xs-12">
                            <div class="control-group">
                                <label for="username">用户名</label>
                                <div id="username" class="controls">
                                    ${user.username} <c:if test="${fn:startsWith(user.username ,'RTUSER_')}"> <a class="btn btn-xs green eidtUsername">修改用户名</a></c:if>
                                </div>
                                <c:if test="${fn:startsWith(user.username ,'RTUSER_')}"><div>初始用户名仅有一次修改机会</div></c:if>
                            </div>
                        </div>
                        <div class="col-md-6 col-xs-12">
                            <div class="control-group">
                                <label for="createDate">创建时间</label>
                                <div id="createDate" class="controls input-append">
                                    <fmt:formatDate value="${user.createDate}" pattern="yyyy-MM-dd HH:mm:ss" type="both"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-xs-12">
                            <div class="control-group">
                                <label for="name">用户姓名</label>
                                <div class="controls">
                                    <input type="input" id="name" name="name" value="${user.name}" class="form-control" readonly placeholder="5到20个汉字、字母、数字或下划线"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-xs-12">
                            <div class="control-group">
                                <label for="email">邮箱</label>
                                <div class="controls">
                                    <input type="email" id="email" name="email" value="${user.email}" class="form-control" readonly placeholder="zzzzz@163.com"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-xs-12">
                            <div class="control-group">
                                <label for="tel">手机号</label>
                                <div class="controls">
                                    <input type="input" id="tel" name="tel" value="${user.tel}" class="form-control required" readonly placeholder="如15666666520"/>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </form>
            </div>
            <div class="portlet-title"><span><sys:showRtLevelName level='1' defaultName='团队' suffix="资料"/></span></div>
            <div class="portlet-body form">
                <form>
                    <div class="form-body">
                        <div class="col-md-6 col-xs-12">
                            <div class="control-group">
                                <label for="username">名称</label>
                                <div id="teamName" class="controls">
                                    ${user.team.name}
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-xs-12">
                            <div class="control-group">
                                <label for="username">管理员</label>
                                <div id="teamMaster" class="controls">
                                    ${user.team.master.name}
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </form>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<script>
    $(function () {
        $cy.handleUniform();
        $(".eidtUsername").click(function () {
            layer.prompt({
                title:"请输入新用户名"
            }, function(text, index){
                if(text == '${user.username}'){
                    layer.close(index);
                    return;
                }
                if(text.length<2 ||text.length>20 || !/^[\u4E00-\u9FA5\uF900-\uFA2Da-zA-Z_][\u4E00-\u9FA5\uF900-\uFA2Da-zA-Z0-9_]+$/.test(text)){
                    alert("格式不正确，请重新输入一个用户名 (请输入一个 2-20 位，且非数字开头的用户名)")
                    return;
                }


                $.post("${ctx}/personal/profile/changeUsername", {"newUsername": text}, function (result) {
                    if(result=="true"){
                        alert("用户名修改成功，下次请使用新用户名登录。");
                        window.location.reload();
                        layer.close(index);
                    } else if(result == "exists"){
                        alert("用户名已被占用，请重试。");
                    } else {
                        alert("用户名修改失败，请刷新后重试。");
                    }
                },"text");
            });
        });
    })
</script>
</body>
</html>
