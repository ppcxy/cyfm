package com.ppcxy.cyfm.shop.goods.web;

import com.ppcxy.common.extend.web.controller.BaseTreeableController;
import com.ppcxy.cyfm.shop.goods.entity.GoodsType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/shop/gs/type")
public class GoodsTypeController extends BaseTreeableController<GoodsType, Long> {
    public GoodsTypeController() {
        setResourceIdentity("gs:type");
        //和资源一致可以不处理
        setModelName("gsType");
    }
}
