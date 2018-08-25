package com.ppcxy.cyfm.shop.v.web;

import com.ppcxy.common.extend.web.controller.BaseTreeableController;
import com.ppcxy.cyfm.shop.goods.entity.GoodsType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * 前端分类获取的web控制器，给前端页面提供分类列表
 */
@Controller
@RequestMapping("/shop/v/type")
public class TypeController extends BaseTreeableController<GoodsType, Long> {

}
