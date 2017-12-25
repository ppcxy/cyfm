package com.ppcxy.cyfm.experi.web.info;

import com.ppcxy.common.web.controller.BaseCRUDController;
import com.ppcxy.cyfm.experi.entity.info.Course;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Course web 层控制器
 */
@Controller
@RequestMapping(value = "/info/course")
public class CourseController extends BaseCRUDController<Course, Long> {
    public CourseController() {
        setResourceIdentity("info:course");
        //和资源一致可以不处理
        setModelName("course");
    }
}
