package com.ppcxy.cyfm.shop.goods.web;

import com.ppcxy.common.web.controller.BaseCRUDController;
import com.ppcxy.cyfm.shop.goods.entity.GoodsSpec;
import com.ppcxy.cyfm.shop.goods.service.GoodsBaseInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value = "/shop/gs/spec")
public class GoodsSpecController extends BaseCRUDController<GoodsSpec, Long> {
    @Autowired
    private GoodsBaseInfoService goodsBaseInfoService;
    
    public GoodsSpecController() {
        setResourceIdentity("gs:spec");
        //和资源一致可以不处理
        setModelName("gsSpec");
    }
    
    @Override
    public void afterCreateForm(GoodsSpec entity, Model model) {
        super.afterCreateForm(entity, model);
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        String goodsBaseInfoId = request.getParameter("goodsBaseInfoId");
        entity.setGoodsBaseInfo(goodsBaseInfoService.findOne(new Long(goodsBaseInfoId)));
    }
}
