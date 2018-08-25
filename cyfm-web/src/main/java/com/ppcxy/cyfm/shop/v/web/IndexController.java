package com.ppcxy.cyfm.shop.v.web;

import com.ppcxy.cyfm.shop.goods.service.GoodsTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 前端首页web控制器，进入首页
 */
@Controller
@RequestMapping("/shop/v")
public class IndexController {
    
    @Autowired
    private GoodsTypeService goodsTypeService;
    
    @RequestMapping
    public String index(Model model) {
        return "shop/v/index";
    }
    
}
