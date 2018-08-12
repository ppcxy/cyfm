<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<html>
<head>
    <%@include file="/WEB-INF/views/common/import-zTree-css.jspf"%>
    <style>
        ul.pics {
            width: 330px;
        }
        ul.pics li {
            float:left;
            width: 80px;
            margin: 5px;
        }
        img.preview {
            width: 80px;
            height: 60px;
        }

    </style>
  <title>商品详情</title>
</head>
<body>

<div class="portlet box editBox">
    <div class="portlet-title"><span>商品信息</span></div>
    <div class="portlet-body form">
        <form:form id="inputForm"  modelAttribute="entity" action="#" method="post">
        <div class="form-body">
            <input type="hidden" name="id" value="${entity.id}"/>
            <div id="messageBox" class="alert alert-error form-control controls" style="display:none">输入有误，请先更正。</div>
            <div class="form-group">
                <label for="goodsType" class="control-label">类型:</label>
                <div class="controls">
                    <div class="input-group" title="选择资源选择资源">
                        <input type="hidden" id="goodsType" name="goodsType" value="${entity.goodsType.id}">
                        <input type="text" id="goodsTypeName" class="form-control required" value="<gs:showTypeName id="${entity.goodsType.id}" />" readonly="readonly">
                        <div class="input-group-addon" >

                            <a id="selectGsType" href="javascript:;">
                                <span class="add-on"><i class="fa fa-chevron-down"></i></span>
                            </a>
                        </div>
                    </div>

                </div>
            </div>
            <div class="form-group">
                <label for="goodsBrand" class="control-label">品牌:</label>
                <div class="controls">
                    <select id="goodsBrand" name="goodsBrand"  class="form-control required">
                        <option>请选择</option>
                        <c:forEach items="${brands}" var="brand">
                            <option value="${brand.id}">${brand.brandName}</option>
                        </c:forEach>
                        <script>
                            $("#goodsBrand").val("${entity.goodsBrand.id}")
                        </script>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="title" class="control-label">商品名称:</label>
                <div class="controls">
                    <input type="text" id="title" name="title" value="${entity.title}" class="form-control required"/>
                </div>
            </div>
            <div class="form-group">
                <label for="unit" class="control-label">商品计量单位:</label>
                <div class="controls">
                    <input type="text" id="unit" name="unit" value="${entity.unit}" class="form-control required"/>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="form-group">
                <label for="basePrice" class="control-label">基础单价:</label>
                <div class="controls">
                    <input type="text" id="basePrice" name="basePrice" value="${entity.basePrice}" class="form-control required"/>
                </div>
            </div>

            <c:if test="${not empty entity.id}">
                <div class="form-group">
                    <label for="pics" class="control-label">商品图:</label>
                    <div class="controls">
                        <input type="hidden" id="pics" name="pics" value="${entity.pics}" class="form-control required"/>
                        <button class="btn blue" type="button" id="uploadGoodsPic">上传商品图片</button>
                        <ul class="pics">

                        </ul>
                    </div>
                </div>
               <div class="clearfix"></div>
                <div class="form-group">
                    <label for="basePrice" class="control-label">商品详情:</label>
                    <div class="controls">
                        <o id="editor" type="text/plain" style="width:1024px;"></o>
                        <textarea type="text" id="details" name="details" class="hidden">${entity.details}</textarea>
                    </div>
                </div>
                <div class="clearfix"></div>
            </c:if>
            <div class="form-actions">
                <input id="submit_btn" class="btn btn-primary" type="submit" value="提交"/>&nbsp;
                <p class="help-block">(点击提交保存信息.)</p>
            </div>
            </form:form>
        </div>
    </div>
</div>
<%@include file="/WEB-INF/views/common/import-zTree-js.jspf"%>
<%@include file="/WEB-INF/views/common/import-editor-js.jspf"%>
<script>
    $cy.handleUniform();
    $("#inputForm").validate({
        submitHandler: function(form) { //验证成功时调用
            preSubmitHandler();
            form.submit();
        }
    });

    var formEditor = UE.getEditor('editor', {
        designer: false,//是否显示，设计器的 toolbars
        textarea: 'design_content',
        //默认的编辑区域高度
        initialFrameHeight: 400,
        autoHeightEnabled: false
    });

    formEditor.ready(function () {
        var template = $("#details").text();
        if (template) {
            formEditor.setContent(template);
        }
    });

    var gsTypeTree = $.zTree.initSelectTree({
        zNodes : [],
        nodeType : "default",
        fullName:true,
        urlPrefix : "${ctx}/shop/gs/type",
        async : true,
        asyncLoadAll : true,
        onlyDisplayShow: true,
        lazy : true,
        select : {
            btn : $("#selectGsType,#gsType"),
            id : "goodsType",
            name : "goodsTypeName",
            includeRoot: false
        },
        autocomplete : {
            enable : true
        },
        setting :{
            check : {
                enable:true,
                chkStyle:"radio",
                radioType: "all",
                onlyCheckLeaf : true,
                onlySelectLeaf : true
            }
        }
    });



    function preSubmitHandler(){
        var fileArray = [];
        $(".pics li").each(function (i, o) {
            fileArray.push($(o).find("img").attr("src"));
        });
        $("#pics").val(fileArray.join(','));


        $("#details").val(formEditor.getContent())
    }

    var imgData = [];

    function removeImg(a) {
        $cy.confirm({
            message: '是否移除此商品描述图片?', yes: function () {
                $(a).parents("li").remove();
            }
        })
    }

    function  preViewImg(a){

        var previewJson = {
            "title": "商品图预览", //相册标题
            "start": $(a).parents("li").index(), //初始显示的图片序号，默认0
            "data": imgData
        };
        layer.photos({
            area: ['600px','400px'],
            photos: previewJson,
            anim: 0 //0-6的选择，指定弹出图片动画类型，默认随机（请注意，3.0之前的版本用shift参数）
        });
    }

    $(function () {

        var pics = $("#pics").val().split(",");
        $(pics).each(function (i, o) {
            imgData.push({
                "alt": '',
                "pid": '', //图片id
                "src": o, //原图地址
                "thumb": o //缩略图地址
            })

            $(".pics").append("<li><div><img class='preview' src='" + o + "'></div><div><a onclick='preViewImg(this)' class='btn btn-xs blue pull-left'>预览</a><a onclick='removeImg(this)' class='btn btn-xs red pull-right'>移除</a></div></li>")
        });



        $("#uploadGoodsPic").click(function () {
            $cy.tools.uploadFile({
                identity: "goodsBaseInfo",
                secondIdentity: "${entity.id}",
                tag: "pics",
                callback: function (oper, data) {
                    if (oper == "add"){
                        var file = data.files[0];
                        $(".pics").append("<li><div><img class='preview' title='"+file.name+"' src='" + _ctx + "/" + file.url.replace("/filestore/upload/ajaxDownload","/shop/v/pic") + "'></div><div><a onclick='preViewImg(this)' class='btn btn-xs blue pull-left'>预览</a><a onclick='removeImg(this)' class='btn btn-xs red pull-right'>移除</a></div></li>")

                        imgData.push({
                            "alt": '',
                            "pid": '', //图片id
                            "src":  _ctx + "/" + file.url, //原图地址
                            "thumb":  _ctx + "/" + file.url //缩略图地址
                        })
                    }
                }
            });

        })

    })
</script>
</body>
</html>
