<%@ tag import="com.google.common.collect.Lists" %>
<%@ tag import="com.ppcxy.common.spring.SpringContextHolder" %>
<%@ tag import="com.ppcxy.cyfm.shop.goods.entity.GoodsType" %>
<%@ tag import="com.ppcxy.cyfm.shop.goods.service.GoodsTypeService" %>
<%@ tag import="java.util.List" %>
<%@ tag pageEncoding="UTF-8" %>
<%@ attribute name="id" type="java.lang.Long" required="true"  description="当前要展示的资源的名字" %>
<%@ attribute name="showParents" type="java.lang.Boolean" required="false" description="是否显示父亲" %>
<%@ attribute name="includeRoot" type="java.lang.Boolean" required="false" description="是否包含根" %>
<%@ attribute name="isText" type="java.lang.Boolean"  required="false" description="是否文字模式" %>
<%!private GoodsTypeService goodsTypeService;%>
<%

    if (showParents == null) {
        showParents = true;
    }
    if (includeRoot == null) {
        includeRoot = false;
    }
    if (isText == null) {
        isText = true;
    }

    if (goodsTypeService == null) {
        goodsTypeService = SpringContextHolder.getBean(GoodsTypeService.class);
    }

    GoodsType goodsType = goodsTypeService.findOne(id);

    if (goodsType == null) {
        //未找到对应的数据
        return;
    }

    List<String> names = Lists.newArrayList();

    names.add(goodsType.getName());

    if (showParents) {
        List<GoodsType> parents = goodsTypeService.findAncestor(goodsType.getParentIds());
        for (GoodsType o : parents) {
            if (!includeRoot && o.isRoot()) {
                continue;
            }
            names.add(o.getName());
        }
    }

    StringBuilder s = new StringBuilder();
    if (!isText) {
        s.append("<a class='btn btn-default btn-link no-padding'>");
    }

    for (int l = names.size() - 1, i = l; i >= 0; i--) {
        if (i != l) {
            s.append(" &gt; ");
        }
        s.append(names.get(i));
    }

    if (!isText) {
        s.append("</a>");
    }
    out.write(s.toString());
%>
