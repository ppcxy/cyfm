package com.ppcxy.cyfm.experi.web.excel;

import com.ppcxy.common.web.bind.annotation.CurrentUser;
import com.ppcxy.common.web.controller.BaseController;
import com.ppcxy.cyfm.experi.entity.excel.ExcelDataType;
import com.ppcxy.cyfm.experi.service.xlsie.ExcelImportService;
import com.ppcxy.cyfm.sys.entity.user.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.io.InputStream;

/**
 * 基础信息导入
 */
@Controller
@RequestMapping(value = "/excel/infoImport")
public class ExcelImportController extends BaseController {
    @Autowired
    private ExcelImportService excelImportService;
    
    public ExcelImportController() {
        //和资源一致可以不处理
        setModelName("excelImport");
    }
    
    
    /**
     * 进入导入页面，默认只支持excel2007文件格式 即xlsx
     * @param type
     * @param model
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    public String showImportExcelForm(@RequestParam(value = "type", defaultValue = "excel2007") ExcelDataType type, Model model) {
        model.addAttribute("type", type);
        return viewName("form");
    }
    
    @RequestMapping(method = RequestMethod.POST)
    public String importExcel(
            @CurrentUser User user,
            @RequestParam(value = "type", defaultValue = "excel2007") ExcelDataType type,
            @RequestParam("file") MultipartFile file, String infoType,
            Model model,
            RedirectAttributes redirectAttributes) throws IOException {
        
        if (!canImport(file, model)) {
            return showImportExcelForm(type, model);
        }
        
        InputStream is = file.getInputStream();
        
        switch (type) {
            case csv:
                excelImportService.importCvs(user, infoType, is);
                break;
            case excel2007:
                excelImportService.importExcel2007(user, infoType, is);
                break;
            default:
                //none
        }
        
        redirectAttributes.addFlashAttribute("message", "导入任务已提交，如果数据量大需要稍后显示。");
        return redirectToUrl("/excel/infoImport");
    }
    
    private boolean canImport(final MultipartFile file, final Model model) {
        if (file == null || file.isEmpty()) {
            model.addAttribute("error", "请选择要导入的文件");
            return false;
        }
        
        String filename = file.getOriginalFilename().toLowerCase();
        if (!(filename.endsWith("xlsx"))) {
            model.addAttribute("error", "导入的文件格式错误，允许的格式为：xlsx");
            return false;
        }
        
        return true;
    }
    
    
}
