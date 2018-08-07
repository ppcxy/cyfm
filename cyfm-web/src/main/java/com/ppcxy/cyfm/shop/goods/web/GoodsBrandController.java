package com.ppcxy.cyfm.shop.goods.web;

import com.ppcxy.common.web.controller.BaseCRUDController;
import com.ppcxy.cyfm.shop.goods.entity.GoodsBrand;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/shop/gs/brand")
public class GoodsBrandController extends BaseCRUDController<GoodsBrand, Long> {
    public GoodsBrandController() {
        setResourceIdentity("gs:brand");
        //和资源一致可以不处理
        setModelName("gsBrand");
    }
}
