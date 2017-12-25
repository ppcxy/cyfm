package com.ppcxy.cyfm.experi.web.info;

import com.ppcxy.common.web.controller.BaseCRUDController;
import com.ppcxy.cyfm.experi.entity.info.Grade;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Grade web 层控制器
 */
@Controller
@RequestMapping(value = "/info/grade")
public class GradeController extends BaseCRUDController<Grade, Long> {
    public GradeController() {
        setResourceIdentity("info:grade");
        //和资源一致可以不处理
        setModelName("grade");
    }
}
