package com.ppcxy.cyfm.shop.order.web;

import com.ppcxy.common.web.controller.BaseCRUDController;
import com.ppcxy.cyfm.shop.order.entity.ShopOrder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/shop/order")
public class ShopOrderController extends BaseCRUDController<ShopOrder, Long> {
    
    public ShopOrderController() {
        setResourceIdentity("shop:order");
        setModelName("shopOrder");
    }
    
}
