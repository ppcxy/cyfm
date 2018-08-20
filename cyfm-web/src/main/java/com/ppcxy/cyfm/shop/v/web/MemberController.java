package com.ppcxy.cyfm.shop.v.web;

import com.ppcxy.common.entity.search.SearchOperator;
import com.ppcxy.common.entity.search.Searchable;
import com.ppcxy.common.web.bind.annotation.CurrentUser;
import com.ppcxy.common.web.bind.annotation.PageableDefaults;
import com.ppcxy.cyfm.shop.order.entity.ShoppingCarts;
import com.ppcxy.cyfm.shop.order.entity.ShoppingOrder;
import com.ppcxy.cyfm.shop.order.service.ShoppingCartsService;
import com.ppcxy.cyfm.shop.order.service.ShoppingOrderService;
import com.ppcxy.cyfm.shop.v.entity.Goodsfavorite;
import com.ppcxy.cyfm.shop.v.service.GoodsfavoriteService;
import com.ppcxy.cyfm.sys.entity.user.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

/**
 * 商城会员中心相关功能
 */
@Controller
@RequestMapping("/shop/member")
public class MemberController {
    @Autowired
    private ShoppingOrderService orderService;
    
    @Autowired
    private ShoppingCartsService shoppingCartsService;
    
    @Autowired
    private GoodsfavoriteService goodsfavoriteService;
    
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
    @PageableDefaults(sort = "id=desc", value = 5)
    public String list(@CurrentUser User user, Searchable searchable, Model model) {
        searchable.addSearchFilter("userId", SearchOperator.eq, user.getId());
        Page<ShoppingOrder> page = orderService.findAll(searchable);
        model.addAttribute("page", page);
        
        return "shop/member/member_order";
    }
    
    /**
     * 下单
     *
     * @param user
     * @param model
     * @return
     */
    @RequestMapping(value = "placeOrder", method = {RequestMethod.POST})
    public String placeOrder(String orderInfo, @CurrentUser User user, Model model) {
        
        orderService.placeOrder(orderInfo, user);
        return "redirect:/shop/member/carts";
    }
    
    /**
     * 进入购物车
     *
     * @param user
     * @param model
     * @return
     */
    @RequestMapping(value = "carts", method = RequestMethod.GET)
    public String carts(@CurrentUser User user, Model model) {
        
        model.addAttribute("carts", shoppingCartsService.loadUserCarts(user.getId()));
        return "shop/member/member_carts";
    }
    
    /**
     * 从购物车移除
     *
     * @param user
     * @param model
     * @return
     */
    @RequestMapping(value = "carts/remove/{id}", method = {RequestMethod.POST})
    @ResponseBody
    public String removeCarts(@PathVariable(value = "id") Long id, @CurrentUser User user, Model model) {
        
        ShoppingCarts carts = shoppingCartsService.findOne(id);
        // 验证如果是当前登录人的购物车则删除
        if (carts.getUserId().equals(user.getId())) {
            shoppingCartsService.delete(carts);
        }
        
        return "{\"msg\":\"success\"}";
    }
    
    /**
     * 加入购物车
     *
     * @param user
     * @param model
     * @return
     */
    @RequestMapping(value = "addCarts", method = {RequestMethod.POST})
    @ResponseBody
    public String addCarts(ShoppingCarts carts, @CurrentUser User user, Model model) {
        
        carts.setUserId(user.getId());
        carts.setCreateTime(new Date());
        
        shoppingCartsService.addCarts(carts);
        
        return "{\"msg\":\"success\"}";
    }
    
    
    /**
     * 加入购物车并跳转到购物车
     *
     * @param user
     * @param model
     * @return
     */
    @RequestMapping(value = "addCarts", method = {RequestMethod.GET})
    public String addCartsGet(ShoppingCarts carts, @CurrentUser User user, Model model) {
        
        carts.setUserId(user.getId());
        carts.setCreateTime(new Date());
        
        shoppingCartsService.addCarts(carts);
        
        return "redirect:/shop/member/carts";
    }
    
    
    /**
     * 收藏商品列表
     *
     * @param user
     * @param model
     * @return
     */
    @RequestMapping(value = "favorites", method = RequestMethod.GET)
    @PageableDefaults(sort = "id=desc")
    public String favorites(@CurrentUser User user, Model model) {
        
        model.addAttribute("favorites", goodsfavoriteService.findByUserId(user.getId()));
        return "shop/member/member_favorites";
    }
    
    /**
     * 加入商品收藏
     *
     * @param user
     * @param model
     * @return
     */
    @RequestMapping(value = "addFavorite", method = {RequestMethod.POST})
    @ResponseBody
    public String addFavorite(Goodsfavorite goodsfavorite, @CurrentUser User user, Model model) {
        
        goodsfavorite.setUserId(user.getId());
        goodsfavorite.setCreateDate(new Date());
        
        goodsfavoriteService.addFavorite(goodsfavorite);
        return "{\"msg\":\"success\"}";
    }
    
    /**
     * 加入商品收藏并跳转到收藏
     *
     * @param user
     * @param model
     * @return
     */
    @RequestMapping(value = "addFavorite", method = {RequestMethod.GET})
    public String addFavoriteGet(Goodsfavorite goodsfavorite, @CurrentUser User user, Model model) {
        goodsfavorite.setUserId(user.getId());
        goodsfavorite.setCreateDate(new Date());
        
        goodsfavoriteService.addFavorite(goodsfavorite);
        return "redirect:/shop/member/favorites";
    }
    
    
}
