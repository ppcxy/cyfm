package com.ppcxy.cyfm.shop.goods.web;

import com.ppcxy.common.web.controller.BaseCRUDController;
import com.ppcxy.cyfm.shop.goods.entity.GoodsBaseInfo;
import com.ppcxy.cyfm.shop.goods.service.GoodsBrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/shop/gs/info")
public class GoodsBaseInfoController extends BaseCRUDController<GoodsBaseInfo, Long> {
    
    @Autowired
    private GoodsBrandService goodsBrandService;
    
    public GoodsBaseInfoController() {
        setResourceIdentity("gs:info");
        //和资源一致可以不处理
        setModelName("gsInfo");
    }
    
    @Override
    protected void preResponse(Model model) {
        super.preResponse(model);
        model.addAttribute("brands", goodsBrandService.findAll(new Sort(Sort.Direction.DESC, "weight")));
    }
}
