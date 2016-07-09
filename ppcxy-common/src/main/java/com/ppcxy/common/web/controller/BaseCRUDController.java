package com.ppcxy.common.web.controller;

import com.ppcxy.common.Constants;
import com.ppcxy.common.entity.AbstractEntity;
import com.ppcxy.common.entity.search.Searchable;
import com.ppcxy.common.service.BaseService;
import com.ppcxy.common.web.bind.annotation.PageableDefaults;
import com.ppcxy.common.web.controller.permission.PermissionList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
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
     * 用于设置通用数据,默认行为干预请覆盖 befor after,或者直接覆盖具体方法.
     *
     * @param model
     */
    @Override
    protected void preResponse(Model model) {
        super.preResponse(model);
        model.addAttribute("resourceIdentity", permissionList.getResourceIdentity());
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
            setModelName(resourceIdentity);
            permissionList = PermissionList.newPermissionList(resourceIdentity);
        }
    }

    /**
     * 进入 list 执行,默认验证权限.
     *
     * @param searchable
     * @param model
     */
    public void barorList(Searchable searchable, Model model) {
        if (permissionList != null) {
            this.permissionList.assertHasViewPermission();
        }
    }

    /**
     * list 逻辑执行完毕,返回页面之前执行.
     *
     * @param searchable
     * @param page
     * @param model
     */
    public void afterList(Searchable searchable, Page<T> page, Model model) {
    }

    @RequestMapping(method = RequestMethod.GET)
    @PageableDefaults(sort = "id=desc")
    public String list(Searchable searchable, Model model) {

        barorList(searchable, model);

        Page<T> page = baseService.findAll(searchable);
        model.addAttribute("page", page);

        if (listAlsoSetCommonData) {
            preResponse(model);
        }
        afterList(searchable, page, model);
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


    /**
     * 进入 view 执行,默认验证权限.
     *
     * @param model
     * @param entity
     */
    public void beforView(Model model, T entity) {
        if (permissionList != null) {
            this.permissionList.assertHasViewPermission();
        }
    }

    /**
     * view 逻辑执行完毕,返回页面之前执行.
     *
     * @param model
     * @param entity
     */
    public void afterView(Model model, T entity) {
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String view(Model model, @PathVariable("id") T entity) {

        beforView(model, entity);
        preResponse(model);

        model.addAttribute("entity", entity);
        model.addAttribute(Constants.OPTION_NAME, "查看");

        afterView(model, entity);
        return viewName("form");
    }

    /**
     * 进入 createForm 执行,默认验证权限.
     *
     * @param model
     */
    public void beforCreateForm(Model model) {
        if (permissionList != null) {
            this.permissionList.assertHasCreatePermission();
        }
    }

    /**
     * createForm 逻辑执行完毕,返回页面之前执行.
     *
     * @param entity
     * @param model
     */
    public void afterCreateForm(T entity, Model model) {
    }

    @RequestMapping(value = "create", method = RequestMethod.GET)
    public String createForm(Model model) {
        beforCreateForm(model);
        T entity = null;
        preResponse(model);
        model.addAttribute(Constants.OPTION_NAME, "create");
        if (!model.containsAttribute("entity")) {
            entity = newEntity();
            model.addAttribute("entity", entity);
        } else {
            entity = (T) model.asMap().get("entity");
        }

        afterCreateForm(entity, model);
        return viewName("form");
    }


    /**
     * 进入 create 执行,默认验证权限.
     *
     * @param model
     */
    public void beforCreate(Model model, @Valid @ModelAttribute("entity") T entity, BindingResult result,
                            RedirectAttributes redirectAttributes) {
        if (permissionList != null) {
            this.permissionList.assertHasCreatePermission();
        }
    }

    /**
     * create 逻辑执行完毕,返回页面之前执行.
     *
     * @param entity
     * @param model
     */
    public void afterCreate(Model model, @Valid @ModelAttribute("entity") T entity, BindingResult result,
                            RedirectAttributes redirectAttributes) {
    }

    @RequestMapping(value = "create", method = RequestMethod.POST)
    public String create(
            Model model, @Valid @ModelAttribute("entity") T entity, BindingResult result,
            RedirectAttributes redirectAttributes) {


        beforCreate(model, entity, result, redirectAttributes);

        if (hasError(entity, result)) {
            return createForm(model);
        }
        baseService.save(entity);
        redirectAttributes.addFlashAttribute(Constants.MESSAGE, "新增成功");
        afterCreate(model, entity, result, redirectAttributes);
        return redirectToUrl(null);
    }


    /**
     * 进入 updateForm 执行,默认验证权限.
     *
     * @param model
     */
    public void beforUpdateForm(T entity, Model model) {
        if (permissionList != null) {
            this.permissionList.assertHasUpdatePermission();
        }
    }

    /**
     * updateForm 逻辑执行完毕,返回页面之前执行.
     *
     * @param entity
     * @param model
     */
    public void afterUpdateForm(T entity, Model model) {
    }

    @RequestMapping(value = "update/{id}", method = RequestMethod.GET)
    public String updateForm(@PathVariable("id") T entity, Model model) {
        beforUpdateForm(entity, model);
        preResponse(model);
        model.addAttribute(Constants.OPTION_NAME, "update");
        model.addAttribute("entity", entity);

        afterUpdateForm(entity, model);
        return viewName("form");
    }

    /**
     * 进入 create 执行,默认验证权限.
     *
     * @param model
     */
    public void beforUpdate(Model model, @Valid @ModelAttribute("entity") T entity, BindingResult result, String backURL,
                            RedirectAttributes redirectAttributes) {
        if (permissionList != null) {
            this.permissionList.assertHasUpdatePermission();
        }
    }

    /**
     * create 逻辑执行完毕,返回页面之前执行.
     *
     * @param entity
     * @param model
     */
    public void afterUpdate(Model model, @Valid @ModelAttribute("entity") T entity, BindingResult result, String backURL,
                            RedirectAttributes redirectAttributes) {
    }

    @RequestMapping(value = "update/{id}", method = RequestMethod.POST)
    public String update(
            Model model, @Valid @ModelAttribute("entity") T entity, BindingResult result,
            @RequestParam(value = Constants.BACK_URL, required = false) String backURL,
            RedirectAttributes redirectAttributes) {


        beforUpdate(model, entity, result, backURL, redirectAttributes);

        if (hasError(entity, result)) {
            return updateForm(entity, model);
        }
        baseService.update(entity);
        redirectAttributes.addFlashAttribute(Constants.MESSAGE, "修改成功");
        afterUpdate(model, entity, result, backURL, redirectAttributes);
        return redirectToUrl(backURL);
    }

    /**
     * 进入 delete 执行,默认验证权限.
     */
    public void beforDelete(ID id, String backURL, RedirectAttributes redirectAttributes) {
        if (permissionList != null) {
            this.permissionList.assertHasDeletePermission();
        }
    }

    /**
     * create 逻辑执行完毕,返回页面之前执行.
     */
    public void afterDelete(ID id, String backURL, RedirectAttributes redirectAttributes) {
    }


    @RequestMapping(value = "delete/{id}")
    public String delete(
            @PathVariable("id") ID id,
            @RequestParam(value = Constants.BACK_URL, required = false) String backURL,
            RedirectAttributes redirectAttributes) {

        beforDelete(id, backURL, redirectAttributes);
        baseService.delete(id);

        redirectAttributes.addFlashAttribute(Constants.MESSAGE, "删除成功");
        afterDelete(id, backURL, redirectAttributes);
        return redirectToUrl(backURL);
    }

    /**
     * 进入 deleteInBatch 执行,默认验证权限.
     */
    public void beforDeleteInBatch(ID[] ids, String backURL, RedirectAttributes redirectAttributes) {
        if (permissionList != null) {
            this.permissionList.assertHasDeletePermission();
        }
    }

    /**
     * deleteInBatch 逻辑执行完毕,返回页面之前执行.
     */
    public void afterDeleteInBatch(ID[] ids, String backURL, RedirectAttributes redirectAttributes) {
    }

    @RequestMapping(value = "batch/delete", method = {RequestMethod.GET, RequestMethod.POST})
    public String deleteInBatch(
            @RequestParam(value = "ids", required = false) ID[] ids,
            @RequestParam(value = Constants.BACK_URL, required = false) String backURL,
            RedirectAttributes redirectAttributes) {

        beforDeleteInBatch(ids, backURL, redirectAttributes);
        baseService.delete(ids);

        redirectAttributes.addFlashAttribute(Constants.MESSAGE, "删除成功");
        afterDeleteInBatch(ids, backURL, redirectAttributes);
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
