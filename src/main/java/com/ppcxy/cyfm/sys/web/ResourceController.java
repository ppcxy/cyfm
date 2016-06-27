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
//@RequestMapping(value = {"list", ""})
    //@PageableDefaults(sort = {"weight=desc", "id=asc"})
    //public String list(Searchable searchable, Model model) {
    //    model.addAttribute("page", resourceService.findAll(searchable));
    //    return "resource/resourceList";
    //}
    //
    //@RequestMapping(value = "create", method = RequestMethod.GET)
    //public String createForm(Model model) {
    //    model.addAttribute("resource", new Resource());
    //    model.addAttribute("action", "create");
    //    return "resource/resourceForm";
    //}
    //
    //@RequestMapping(value = "create", method = RequestMethod.POST)
    //public String create(@Valid Resource newResource, RedirectAttributes redirectAttributes) {
    //    resourceService.save(newResource);
    //    redirectAttributes.addFlashAttribute("message", "创建资源成功");
    //    return "redirect:/resource/";
    //}
    //
    ////
    //@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
    //public String updateForm(@PathVariable("id") Long id, Model model) {
    //    model.addAttribute("resource", resourceService.findOne(id));
    //    model.addAttribute("action", "update");
    //    return "resource/resourceForm";
    //}
    //
    //@RequestMapping(value = "update", method = RequestMethod.POST)
    //public String update(@Valid @ModelAttribute("task") Resource resource, RedirectAttributes redirectAttributes) {
    //    resourceService.save(resource);
    //    redirectAttributes.addFlashAttribute("message", "更新资源成功");
    //    return "redirect:/resource/";
    //}
    //
    ////
    //@RequestMapping(value = "delete/{id}")
    //public String delete(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
    //    resourceService.delete(id);
    //    redirectAttributes.addFlashAttribute("message", "删除任务成功");
    //    return "redirect:/resource/";
    //}
    //
    ///**
    // * 所有RequestMapping方法调用前的Model准备方法, 实现Struts2 Preparable二次部分绑定的效果,先根据form的id从数据库查出Task对象,再把Form提交的内容绑定到该对象上。
    // * 因为仅update()方法的form中有id属性，因此仅在update时实际执行.
    // */
    //@ModelAttribute
    //public void getTask(@RequestParam(value = "id", defaultValue = "-1") Long id, Model model) {
    //    if (id != -1) {
    //        model.addAttribute("task", resourceService.findOne(id));
    //    }
    //}

    @RequestMapping(value = "load")
    @ResponseBody

    public String loadResources(Model model) {
        return JsonMapper.nonEmptyMapper().toJson(resourceService.findAll());
    }
}
