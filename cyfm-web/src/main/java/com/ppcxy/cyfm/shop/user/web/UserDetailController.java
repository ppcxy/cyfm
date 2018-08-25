package com.ppcxy.cyfm.shop.user.web;

import com.ppcxy.common.web.controller.BaseCRUDController;
import com.ppcxy.cyfm.shop.user.entity.UserDetail;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/shop/user/detail")
public class UserDetailController extends BaseCRUDController<UserDetail,Long> {
}
