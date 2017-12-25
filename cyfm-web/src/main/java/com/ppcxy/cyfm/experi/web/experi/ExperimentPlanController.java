package com.ppcxy.cyfm.experi.web.experi;

import com.ppcxy.common.utils.ShiroUserInfoUtils;
import com.ppcxy.common.web.controller.BaseCRUDController;
import com.ppcxy.cyfm.experi.entity.experi.ExperimentPlan;
import com.ppcxy.cyfm.experi.service.info.ClassesService;
import com.ppcxy.cyfm.experi.service.info.CourseService;
import com.ppcxy.cyfm.experi.service.info.ExperimentDeviceService;
import com.ppcxy.cyfm.experi.service.info.ExperimentPlaceService;
import com.ppcxy.cyfm.sys.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Date;

/**
 * 实验计划管理
 */
@Controller
@RequestMapping(value = "/experi/experimentPlan")
public class ExperimentPlanController extends BaseCRUDController<ExperimentPlan, Long> {
    
    @Autowired
    private CourseService courseService;
    @Autowired
    private ClassesService classesService;
    @Autowired
    private ExperimentDeviceService experimentDeviceService;
    @Autowired
    private ExperimentPlaceService experimentPlaceService;
    @Autowired
    private UserService userService;
    
    public ExperimentPlanController() {
        setResourceIdentity("experi:experimentPlan");
        //和资源一致可以不处理
        setModelName("experimentPlan");
    }
    
    @Override
    protected void preResponse(Model model) {
        super.preResponse(model);
        //设置字典数据到页面，按权重排序
        model.addAttribute("courses", courseService.findAll());
        model.addAttribute("classes", classesService.findAll());
        model.addAttribute("devices", experimentDeviceService.findAll());
        model.addAttribute("places", experimentPlaceService.findAll());
    }
    
    @Override
    public void beforCreate(Model model, ExperimentPlan entity, BindingResult result, RedirectAttributes redirectAttributes) {
        super.beforCreate(model, entity, result, redirectAttributes);
        entity.setApproveStatus(0);
        entity.setCreateUser(userService.findByUsername(ShiroUserInfoUtils.getUsername()));
        
        entity.setCreateDate(new Date());
    }
    
    @Override
    public void beforUpdate(Model model, ExperimentPlan entity, BindingResult result, String backURL, RedirectAttributes redirectAttributes) {
        super.beforUpdate(model, entity, result, backURL, redirectAttributes);
        entity.setApproveStatus(0);
    }
}
