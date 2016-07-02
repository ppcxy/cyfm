package com.ppcxy.common.web.controller;

import com.ppcxy.common.Constants;
import com.ppcxy.common.entity.AbstractEntity;
import com.ppcxy.common.entity.search.Searchable;
import com.ppcxy.common.service.BaseService;
import com.ppcxy.common.web.bind.annotation.PageableDefaults;
import com.ppcxy.common.web.controller.permission.PermissionList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.io.Serializable;
import java.util.Date;

/**
 * 基础CRUD 控制器
 */
public abstract class BaseCRUDController<T extends AbstractEntity, ID extends Serializable>
        extends BaseController<T, ID> {

    protected BaseService<T, ID> baseService;

    private boolean listAlsoSetCommonData = true;

    protected PermissionList permissionList = null;

    /**
     * 设置基础service
     *
     * @param baseService
     */
    @Autowired
    public void setBaseService(BaseService<T, ID> baseService) {
        this.baseService = baseService;
    }

    /**
     * 列表也设置common data
     */
    public void setListAlsoSetCommonData(boolean listAlsoSetCommonData) {
        this.listAlsoSetCommonData = listAlsoSetCommonData;
    }

    /**
     * 权限前缀：如sys:user
     * 则生成的新增权限为 sys:user:create
     */
    public void setResourceIdentity(String resourceIdentity) {
        if (!StringUtils.isEmpty(resourceIdentity)) {
            permissionList = PermissionList.newPermissionList(resourceIdentity);
        }
    }

    @RequestMapping(method = RequestMethod.GET)
    @PageableDefaults(sort = "id=desc")
    public String list(Searchable searchable, Model model) {

        if (permissionList != null) {
            this.permissionList.assertHasViewPermission();
        }

        model.addAttribute("page", baseService.findAll(searchable));
        if (listAlsoSetCommonData) {
            preResponse(model);
        }
        return viewName("list");
    }

    /**
     * 仅返回表格数据
     *
     * @param searchable
     * @param model
     * @return
     */
    @RequestMapping(method = RequestMethod.GET, headers = "table=true")
    @PageableDefaults(sort = "createDate=desc")
    public String listTable(Searchable searchable, Model model) {
        list(searchable, model);
        return viewName("listTable");
    }


    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String view(Model model, @PathVariable("id") T entity) {

        if (permissionList != null) {
            this.permissionList.assertHasViewPermission();
        }

        preResponse(model);
        model.addAttribute("entity", entity);
        model.addAttribute(Constants.OPTION_NAME, "查看");
        return viewName("form");
    }

    @RequestMapping(value = "create", method = RequestMethod.GET)
    public String createForm(Model model) {

        if (permissionList != null) {
            this.permissionList.assertHasCreatePermission();
        }

        preResponse(model);
        model.addAttribute(Constants.OPTION_NAME, "create");
        if (!model.containsAttribute("entity")) {
            model.addAttribute("entity", newEntity());
        }
        return viewName("form");
    }


    @RequestMapping(value = "create", method = RequestMethod.POST)
    public String create(
            Model model, @Valid @ModelAttribute("entity") T entity, BindingResult result,
            RedirectAttributes redirectAttributes) {

        if (permissionList != null) {
            this.permissionList.assertHasCreatePermission();
        }

        if (hasError(entity, result)) {
            return createForm(model);
        }
        baseService.save(entity);
        redirectAttributes.addFlashAttribute(Constants.MESSAGE, "新增成功");
        return redirectToUrl(null);
    }


    @RequestMapping(value = "update/{id}", method = RequestMethod.GET)
    public String updateForm(@PathVariable("id") T entity, Model model) {

        if (permissionList != null) {
            this.permissionList.assertHasUpdatePermission();
        }

        preResponse(model);
        model.addAttribute(Constants.OPTION_NAME, "update");
        model.addAttribute("entity", entity);
        return viewName("form");
    }

    @RequestMapping(value = "update", method = RequestMethod.POST)
    public String update(
            Model model, @Valid @ModelAttribute("entity") T entity, BindingResult result,
            @RequestParam(value = Constants.BACK_URL, required = false) String backURL,
            RedirectAttributes redirectAttributes) {

        if (permissionList != null) {
            this.permissionList.assertHasUpdatePermission();
        }

        if (hasError(entity, result)) {
            return updateForm(entity, model);
        }
        baseService.update(entity);
        redirectAttributes.addFlashAttribute(Constants.MESSAGE, "修改成功");
        return redirectToUrl(backURL);
    }

    @RequestMapping(value = "delete/{id}")
    public String delete(
            @PathVariable("id") ID id,
            @RequestParam(value = Constants.BACK_URL, required = false) String backURL,
            RedirectAttributes redirectAttributes) {

        if (permissionList != null) {
            this.permissionList.assertHasDeletePermission();
        }

        baseService.delete(id);

        redirectAttributes.addFlashAttribute(Constants.MESSAGE, "删除成功");
        return redirectToUrl(backURL);
    }

    @RequestMapping(value = "batch/delete", method = {RequestMethod.GET, RequestMethod.POST})
    public String deleteInBatch(
            @RequestParam(value = "ids", required = false) ID[] ids,
            @RequestParam(value = Constants.BACK_URL, required = false) String backURL,
            RedirectAttributes redirectAttributes) {


        if (permissionList != null) {
            this.permissionList.assertHasDeletePermission();
        }

        baseService.delete(ids);

        redirectAttributes.addFlashAttribute(Constants.MESSAGE, "删除成功");
        return redirectToUrl(backURL);
    }

    /**
     * 所有RequestMapping方法调用前的Model准备方法, 实现Struts2 Preparable二次部分绑定的效果,先根据form的id从数据库查出Task对象,再把Form提交的内容绑定到该对象上。
     * 因为仅update()方法的form中有id属性，因此仅在update时实际执行.
     */
    @ModelAttribute
    public void getEntity(@RequestParam(value = "id", defaultValue = "-1") ID id, Model model) {
        if (!id.toString().equals("-1")) {
            model.addAttribute("entity", baseService.findOne(id));
        }
    }

    @InitBinder
    protected void initBinder(HttpServletRequest request,
                              ServletRequestDataBinder binder) throws Exception {
        //对于需要转换为Date类型的属性，使用DateEditor进行处理
        binder.registerCustomEditor(Date.class, new DateEditor());
    }
}
