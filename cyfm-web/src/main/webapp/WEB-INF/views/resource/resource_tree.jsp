<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
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
    <!-- 插件扩展区 end-->

    <script src="${ctx}/static/js/common.js?3" type="text/javascript"></script>
    <title></title>
</head>
<body>
<div data-table="table" class="tabbable-line">
    <ul class="nav nav-tabs">
        <li ${empty param['search.show_eq'] ? 'class="active"' : ''}>
            <a href="${ctx}/resource/tree?async=${not empty param.async and param.async eq true}">
                <i class="icon-table"></i>
                所有
                <i class="icon-refresh" title="点击刷新"></i>
            </a>
        </li>
        <li ${not empty param['search.show_eq'] ? 'class="active"' : ''}>
            <a href="${ctx}/resource/tree?search.show_eq=true&async=${not empty param.async and param.async eq true}">
                <i class="icon-table"></i>
                显示的
            </a>
        </li>
    </ul>
    <div class="tab-content">
        <div id="treeContainer"></div>
    </div>
</div>
<%@include file="/WEB-INF/views/common/import-zTree-js.jspf"%>
<script type="text/javascript">
    var async = ${not empty param.async and param.async eq true};
    $(function() {
        var zNodes =[
            <c:forEach items="${trees}" var="m">
            { id:${m.id}, pId:${m.pId}, name:"${m.name}", iconSkin:"${m.iconSkin}", open: true, root : ${m.root},isParent:${m.isParent}},
            </c:forEach>
        ];


        $.zTree.initMovableTree({
            zNodes : zNodes,
            urlPrefix : "${ctx}/resource",
            async : async,
            onlyDisplayShow:${param['search.show_eq'] eq true},
            permission: <cy:treePermission resourceIdentity="resource"/>,
            autocomplete : {
                enable : true
            },
            setting : {
                callback : {
                    onClick: function(event, treeId, treeNode, clickFlag) {
                        parent.frames['listFrame'].location.href='${ctx}/resource/' + treeNode.id + "/update?async=" + async ;
                    }
                }
            }
        });

    });
</script>
</body>
</html>
