package com.ppcxy.cyfm.experi.web.info;

import com.ppcxy.common.web.controller.BaseCRUDController;
import com.ppcxy.cyfm.experi.entity.info.ExperimentDevice;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * classes web 层控制器
 */
@Controller
@RequestMapping(value = "/info/experimentDevice")
public class ExperimentDeviceController extends BaseCRUDController<ExperimentDevice, Long> {
    public ExperimentDeviceController() {
        setResourceIdentity("info:experimentDevice");
        //和资源一致可以不处理
        setModelName("experimentDevice");
    }
}
