package com.ppcxy.cyfm.sys.web.common;

import com.ppcxy.common.Constants;
import com.ppcxy.common.entity.search.SearchOperator;
import com.ppcxy.common.entity.search.Searchable;
import com.ppcxy.common.web.bind.annotation.PageableDefaults;
import com.ppcxy.common.web.bind.annotation.SearchableDefaults;
import com.ppcxy.cyfm.manage.entity.maintaion.datasource.SourceManage;
import com.ppcxy.cyfm.manage.service.maintaion.datasource.SourceManageService;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springside.modules.mapper.JsonMapper;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.UUID;


@RequiresRoles("admin")
@Controller
@RequestMapping(value = "/sys/common/datasourceChoose")
public class DatasourceShooseController {
    
    @Resource
    private SourceManageService sourceManageService;
    
    
    @RequestMapping
    @SearchableDefaults(merge = true)
    @PageableDefaults(value = 5)
    public String dialog(Searchable searchable, Model model) {
        
        if (StringUtils.isNotBlank(searchable.getValue("keyword_custom"))) {
            searchable.addSearchFilter("dsName", SearchOperator.like, searchable.getValue("keyword_custom"));
        }
        
        Page<SourceManage> choosePage = sourceManageService.findAll(searchable);
        model.addAttribute("choosePage", choosePage);
        return "sys/common/sourceManage_choose";
        
    }
    
    @RequestMapping(value = "create", method = RequestMethod.GET)
    public String createForm(SourceManage entity, Model model) {
        model.addAttribute(Constants.OPTION_NAME, "create");
        if (!model.containsAttribute("entity")) {
            entity = new SourceManage();
            model.addAttribute("entity", entity);
        } else {
            entity = (SourceManage) model.asMap().get("entity");
        }
    
        return "sys/common/sourceManage_create";
    }
    
    
    @RequestMapping(value = "create", method = RequestMethod.POST)
    public String create(
            Model model, @Valid @ModelAttribute("entity") SourceManage entity, BindingResult result,
            @RequestParam(value = Constants.BACK_URL, required = false) String backURL,
            RedirectAttributes redirectAttributes) {
        
        if (result.hasErrors()) {
            return createForm(entity, model);
        }
        sourceManageService.save(entity);
        redirectAttributes.addFlashAttribute(Constants.MESSAGE, "新增成功");
        return "redirect:/sys/common/datasourceChoose?search.id_eq=" + entity.getId();
    }
    
    @RequestMapping(value = "validate")
    @ResponseBody
    public String validateDsm(SourceManage sourceManage) {
        sourceManage.setDsName(UUID.randomUUID().toString());
        boolean connectionSuccess = sourceManageService.validateDatasource(sourceManage);
        
        return JsonMapper.nonDefaultMapper().toJson(connectionSuccess);
    }
    
    /**
     * 所有RequestMapping方法调用前的Model准备方法, 实现Struts2 Preparable二次部分绑定的效果,先根据form的id从数据库查出Task对象,再把Form提交的内容绑定到该对象上。
     * 因为仅update()方法的form中有id属性，因此仅在update时实际执行.
     */
    @ModelAttribute
    public void getEntity(@RequestParam(value = "id", defaultValue = "-1") Long id, Model model) {
        if (!id.toString().equals("-1")) {
            try {
                model.addAttribute("entity", BeanUtils.cloneBean(sourceManageService.findOne(id)));
            } catch (Exception e) {
            
            }
            
        }
    }
}
