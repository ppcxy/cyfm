package com.ppcxy.cyfm.experi.web.info;

import com.ppcxy.common.entity.search.Searchable;
import com.ppcxy.common.web.controller.BaseCRUDController;
import com.ppcxy.cyfm.experi.entity.info.Classes;
import com.ppcxy.cyfm.experi.service.info.GradeService;
import com.ppcxy.cyfm.experi.service.info.MajorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * classes web 层控制器
 */
@Controller
@RequestMapping(value = "/info/classes")
public class ClassesController extends BaseCRUDController<Classes, Long> {
    
    @Autowired
    private MajorService majorService;
    @Autowired
    private GradeService gradeService;
    
    public ClassesController() {
        setResourceIdentity("info:classes");
        //和资源一致可以不处理
        setModelName("classes");
    }
    
    @Override
    protected void preResponse(Model model) {
        super.preResponse(model);
        //设置字典数据到页面，按权重排序
        Searchable searchable = Searchable.newSearchable();
        searchable.addSort(Sort.Direction.ASC, "weight");
        model.addAttribute("majors", majorService.findAllWithSort(searchable));
        model.addAttribute("grades", gradeService.findAllWithSort(searchable));
    }
}
