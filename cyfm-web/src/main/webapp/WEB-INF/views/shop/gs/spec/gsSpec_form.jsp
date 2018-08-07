<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<html>
<head>
  <title>商品规格详情</title>
</head>
<body>

<div class="portlet box editBox">
    <div class="portlet-title"><span>商品规格信息</span></div>
    <div class="portlet-body form">
        <form:form id="inputForm"  modelAttribute="entity" action="?BackURL=${ctx}/shop/gs/spec?goodsBaseInfoId=${param['goodsBaseInfoId']}%26search.goodsBaseInfo.id_eq=${param['goodsBaseInfoId']}" method="post">
        <div class="form-body">
            <input type="hidden" name="id" value="${entity.id}"/>
            <div id="messageBox" class="alert alert-error form-control controls" style="display:none">输入有误，请先更正。</div>

            <div class="form-group">
                <label for="specGroup" class="control-label">所属商品:</label>
                <div class="controls">
                    <input type="hidden" id="goodsBaseInfo" name="goodsBaseInfo" value="${entity.goodsBaseInfo.id}"/>
                    <input type="text"  value="${entity.goodsBaseInfo.title}" class="form-control required" readonly/>
                </div>
            </div>
            
            <div class="form-group">
                <label for="specGroup" class="control-label">规格分组:</label>
                <div class="controls">
                    <input type="text" id="specGroup" name="specGroup" value="${entity.specGroup}" class="form-control required"/>
                </div>
            </div>

            <div class="form-group">
                <label for="specTitle" class="control-label">规格标题:</label>
                <div class="controls">
                    <input type="text" id="specTitle" name="specTitle" value="${entity.specTitle}" class="form-control required"/>
                </div>
            </div>

            <div class="form-group">
                <label for="specInfo" class="control-label">规格详情:</label>
                <div class="controls">
                    <input type="text" id="specInfo" name="specInfo" value="${entity.specInfo}" class="form-control required"/>
                </div>
            </div>

            <div class="form-group">
                <label for="price" class="control-label">基础价格调整:</label>
                <div class="controls">
                    <input type="text" id="price" name="price" value="${entity.price}" class="form-control required"/>
                </div>
            </div>

            <div class="form-actions">
                <input id="submit_btn" class="btn btn-primary" type="submit" value="提交"/>&nbsp;
                <p class="help-block">(点击提交保存信息.)</p>
            </div>
            </form:form>
        </div>
    </div>
</div>
<script>
    $cy.handleUniform();
    $("#inputForm").validate({

    });

</script>
</body>
</html>
