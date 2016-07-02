package com.ppcxy.cyfm.sys.web;

import com.ppcxy.common.extend.web.controller.BaseTreeableController;
import com.ppcxy.cyfm.sys.entity.Resource;
import com.ppcxy.cyfm.sys.entity.dto.MenuType;
import com.ppcxy.cyfm.sys.service.ResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by weep on 2016-5-16.
 */
@Controller
@RequestMapping(value = "/resource")
public class ResourceController extends BaseTreeableController<Resource, Long> {
    @Autowired
    private ResourceService resourceService;

    public ResourceController() {
        setResourceIdentity("resource");
        setModelName("resource");
    }

    @Override
    protected void preResponse(Model model) {
        super.preResponse(model);
        model.addAttribute("resourceTypes", MenuType.values());
    }

    //@RequestMapping(value = "load")
    //@ResponseBody
    //public String loadResources(Model model) {
    //    return JsonMapper.nonEmptyMapper().toJson(resourceService.findAll());
    //}
}
