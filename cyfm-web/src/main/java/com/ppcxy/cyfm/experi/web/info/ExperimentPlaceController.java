package com.ppcxy.cyfm.experi.web.info;

import com.ppcxy.common.web.controller.BaseCRUDController;
import com.ppcxy.cyfm.experi.entity.info.ExperimentPlace;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * classes web 层控制器
 */
@Controller
@RequestMapping(value = "/info/experimentPlace")
public class ExperimentPlaceController extends BaseCRUDController<ExperimentPlace, Long> {
    public ExperimentPlaceController() {
        setResourceIdentity("info:experimentPlace");
        //和资源一致可以不处理
        setModelName("experimentPlace");
    }
}
