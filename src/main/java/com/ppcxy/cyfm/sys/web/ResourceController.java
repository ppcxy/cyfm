package com.ppcxy.cyfm.sys.web;

import com.ppcxy.common.web.controller.BaseCRUDController;
import com.ppcxy.cyfm.sys.entity.Resource;
import com.ppcxy.cyfm.sys.service.ResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springside.modules.mapper.JsonMapper;

/**
 * Created by weep on 2016-5-16.
 */
@Controller
@RequestMapping(value = "/resource")
public class ResourceController extends BaseCRUDController<Resource, Long> {
    @Autowired
    private ResourceService resourceService;

    public ResourceController() {
        setResourceIdentity("resource");
        setModelName("resource");
    }

    @RequestMapping(value = "load")
    @ResponseBody

    public String loadResources(Model model) {
        return JsonMapper.nonEmptyMapper().toJson(resourceService.findAll());
    }
}
