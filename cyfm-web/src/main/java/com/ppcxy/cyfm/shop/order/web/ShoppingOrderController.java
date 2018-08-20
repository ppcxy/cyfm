package com.ppcxy.cyfm.shop.order.web;

import com.ppcxy.common.web.controller.BaseCRUDController;
import com.ppcxy.cyfm.shop.order.entity.ShoppingOrder;
import com.ppcxy.cyfm.shop.order.service.ShoppingOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/shop/order")
public class ShoppingOrderController extends BaseCRUDController<ShoppingOrder, Long> {
    @Autowired
    private ShoppingOrderService shoppingOrderService;
    
    public ShoppingOrderController() {
        setResourceIdentity("shop:order");
        setModelName("shopOrder");
    }
    
    @RequestMapping("deliver")
    @ResponseBody
    public String deliver(String orderNum, String trackNum) {
        return shoppingOrderService.deliver(orderNum, trackNum).toString();
    }
    
}
