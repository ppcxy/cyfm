package com.ppcxy.cyfm.experi.web.info;

import com.ppcxy.common.web.controller.BaseCRUDController;
import com.ppcxy.cyfm.experi.entity.info.Major;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * major web 层控制器
 */
@Controller
@RequestMapping(value = "/info/major")
public class MajorController extends BaseCRUDController<Major, Long> {
    public MajorController() {
        setResourceIdentity("info:major");
        //和资源一致可以不处理
        setModelName("major");
    }
}
