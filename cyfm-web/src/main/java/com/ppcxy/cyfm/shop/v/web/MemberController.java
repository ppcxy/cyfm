package com.ppcxy.cyfm.shop.v.web;

import com.ppcxy.common.entity.search.SearchOperator;
import com.ppcxy.common.entity.search.Searchable;
import com.ppcxy.common.web.bind.annotation.CurrentUser;
import com.ppcxy.common.web.bind.annotation.PageableDefaults;
import com.ppcxy.cyfm.shop.goods.service.GoodsTypeService;
import com.ppcxy.cyfm.shop.order.entity.ShopOrder;
import com.ppcxy.cyfm.shop.order.service.ShopOrderService;
import com.ppcxy.cyfm.sys.entity.user.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 商城会员中心相关功能
 */
@Controller
@RequestMapping("/shop/member")
public class MemberController {
    @Autowired
    private ShopOrderService orderService;
    
    @Autowired
    private GoodsTypeService goodsTypeService;
    
    /**
     * 个人中心
     *
     * @param model
     * @return
     */
    @RequestMapping(value = {"", "center"})
    public String index(Model model) {
        return "shop/member/member_center";
    }
    
    /**
     * 订单管理
     *
     * @param user
     * @param searchable
     * @param model
     * @return
     */
    @RequestMapping(value = "order", method = RequestMethod.GET)
    @PageableDefaults(sort = "id=desc")
    public String list(@CurrentUser User user, Searchable searchable, Model model) {
        searchable.addSearchFilter("userId", SearchOperator.eq, user.getId());
        Page<ShopOrder> page = orderService.findAll(searchable);
        model.addAttribute("page", page);
        
        return "shop/member/member_order";
    }
    
    /**
     * 进入购物车
     *
     * @param user
     * @param model
     * @return
     */
    @RequestMapping(value = "cart", method = RequestMethod.GET)
    @PageableDefaults(sort = "id=desc")
    public String cart(@CurrentUser User user, Model model) {
        
        return "shop/member/member_cart";
    }
    
    /**
     * TODO 收藏商品列表
     *
     * @param user
     * @param model
     * @return
     */
    @RequestMapping(value = "favorites", method = RequestMethod.GET)
    @PageableDefaults(sort = "id=desc")
    public String favorites(@CurrentUser User user, Model model) {
        
        return "shop/member/member_favorites";
    }
    
}
