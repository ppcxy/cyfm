package com.ppcxy.cyfm.experi.web.experi;

import com.ppcxy.common.Constants;
import com.ppcxy.common.web.controller.BaseCRUDController;
import com.ppcxy.cyfm.experi.entity.experi.ExperimentProject;
import com.ppcxy.cyfm.experi.service.experi.ExperimentProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * 实验项目管理
 */
@Controller
@RequestMapping(value = "/experi/experimentProject")
public class ExperimentProjectController extends BaseCRUDController<ExperimentProject, Long> {
    
    @Autowired
    private ExperimentProjectService experimentProjectService;
    
    
    public ExperimentProjectController() {
        setResourceIdentity("experi:experimentProject");
        //和资源一致可以不处理
        setModelName("experimentProject");
    }
    
    @Override
    public String create(Model model, ExperimentProject entity, BindingResult result, RedirectAttributes redirectAttributes) {
        super.create(model, entity, result, redirectAttributes);
        return "redirect:/experi/experimentPlan/update/" + entity.getExperimentPlan().getId();
    }
    
    @Override
    public String update(Model model, ExperimentProject entity, BindingResult result, String backURL, RedirectAttributes redirectAttributes) {
        super.update(model, entity, result, backURL, redirectAttributes);
        return "redirect:/experi/experimentPlan/update/" + entity.getExperimentPlan().getId();
    }
    
    
    @Override
    @RequestMapping(value = "delete/{id}")
    public String delete(
            @PathVariable("id") Long id,
            @RequestParam(value = Constants.BACK_URL, required = false) String backURL,
            RedirectAttributes redirectAttributes) {
        ExperimentProject experimentProject = experimentProjectService.findOne(id);
        Long planId = experimentProject.getExperimentPlan().getId();
        super.delete(id, backURL, redirectAttributes);
        return "redirect:/experi/experimentPlan/update/" + planId;
    }
}
