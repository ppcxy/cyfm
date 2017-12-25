package com.ppcxy.cyfm.experi.web.excel;

import com.google.common.collect.Lists;
import com.ppcxy.cyfm.experi.entity.experi.ExperimentPlan;
import com.ppcxy.cyfm.experi.entity.experi.ExperimentProject;
import com.ppcxy.cyfm.experi.service.experi.ExperimentPlanService;
import com.ppcxy.cyfm.experi.service.experi.utils.XmlWord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springside.modules.utils.Collections3;
import org.w3c.dom.Document;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileNotFoundException;
import java.text.SimpleDateFormat;
import java.util.List;

/**
 * 导出计划word
 */
@Controller
@RequestMapping(value = "/excel/planExport")
public class PlanExportController {
    
    @Autowired
    private ExperimentPlanService experimentPlanService;
    
    public PlanExportController() throws FileNotFoundException {
    }
    
    @RequestMapping
    public void exportPlan(Long planId, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
        ExperimentPlan plan = experimentPlanService.findOne(planId);
        
        
        String agent = request.getHeader("USER-AGENT").toLowerCase();
        //根据浏览器类型处理文件名称
        String exportfileName = "《"+plan.getCourse().getCourseName()+"》实验教学实施计划表-"+plan.getPrincipalTeacher()+".doc";
        if (agent.indexOf("msie") > -1) {
            exportfileName = java.net.URLEncoder.encode(exportfileName, "UTF-8");
        } else {  //firefox/safari不转码
            exportfileName = new String(exportfileName.getBytes("UTF-8"), "ISO8859-1");
        }
        //处理下载类型为word
        response.setContentType("application/vnd.ms-word");
        response.setHeader("Content-disposition", "attachment;filename=" + exportfileName);
        
       
        //查询数据转换为导出数据格式
        List<ExperimentProject> projects = plan.getProjects();
        
        List<Integer> coursePeriodCounts = Collections3.extractToList(projects, "coursePeriodCount");
        
        Integer experiPeriodCountSum = 0;
        
        for (Integer count : coursePeriodCounts) {
            if (count == null) {
                count = 0;
            }
            experiPeriodCountSum += count;
        }
        
        //key value集合，保持顺序一致，按照index对应key和value
        List<String> tagList = Lists.newArrayList();
        List<String> dataList = Lists.newArrayList();
        
        
        tagList.add("${plan.createUser}");
        dataList.add(plan.getCreateUser().getName());
        
        tagList.add("${plan.createDate}");
        dataList.add(" " + new SimpleDateFormat("yyyy年MM月dd日").format(plan.getCreateDate()));
        
        tagList.add("${paln.schoolYear}");
        dataList.add(plan.getSchoolYear().replace("/"," -- "));
        tagList.add("${plan.semester}");
        dataList.add(plan.getSemester());
        
        
        tagList.add("${plan.courseName}");
        dataList.add(plan.getCourse().getCourseName());
        
        tagList.add("${plan.coursePeriodCount}");
        dataList.add(String.valueOf(plan.getCourse().getCoursePeriodCount()));
        
        tagList.add("${plan.courseNumber}");
        dataList.add(String.valueOf(plan.getCourse().getCourseNumber()));
        
        tagList.add("${plan.principalTeacher}");
        dataList.add(String.valueOf(plan.getPrincipalTeacher()));
        
        tagList.add("${plan.projectCount}");
        dataList.add(String.valueOf(projects.size()));
        
        tagList.add("${plan.classes}");
        dataList.add(String.valueOf(Collections3.extractToString(plan.getClasses(), "classesName", "+")));
        
        tagList.add("${plan.experiDate}");
        dataList.add(plan.getExperiDate());
        
        tagList.add("${plan.experiPersonCount}");
        dataList.add(String.valueOf(Collections3.extractToString(plan.getClasses(), "enrollment", "+")));
        
        tagList.add("${plan.experiPeriodCount}");
        dataList.add(String.valueOf(experiPeriodCountSum));
        
        
        //设置计划中的项目
        for (int i = 0; i < 7; i++) {
            
            int xh = i + 1;
            tagList.add("项目名称" + xh);
            tagList.add("学时" + xh);
            tagList.add("组数" + xh);
            tagList.add("组人数" + xh);
            tagList.add("消耗" + xh);
            tagList.add("实施日" + xh);
            tagList.add("辅导员" + xh);
            
            if (i < projects.size()) {
                ExperimentProject project = projects.get(i);
                
                dataList.add(String.valueOf(project.getProjectName()));
                dataList.add(String.valueOf(project.getCoursePeriodCount()));
                dataList.add(String.valueOf(project.getGroupCount()));
                dataList.add(String.valueOf(project.getGroupPersonCount()));
                dataList.add(String.valueOf(project.getConsume()));
                dataList.add(String.valueOf(project.getBeginTime()));
                dataList.add(String.valueOf(project.getCounsellor()));
            } else {
                dataList.add("");
                dataList.add("");
                dataList.add("");
                dataList.add("");
                dataList.add("");
                dataList.add("");
                dataList.add("");
            }
            
            
        }
        
        
        XmlWord test = new XmlWord();
        
        String dir = "classpath:exportTemplate/";
        
        File temapleFile = ResourceUtils.getFile(dir + "plan.xml");
        //1、载入模板
        
        Document doc = test.loadXml(temapleFile);
        
        
        //4、将标记和标记值存入dataMap
        
        test.setData(tagList, dataList);
        
        
        test.replaceTagContext(doc.getDocumentElement());
        
        //6、写入文档
        
        ServletOutputStream outputStream = response.getOutputStream();
        test.doc2XmlOutputstream(doc, outputStream);
        outputStream.flush();
        outputStream.close();
        
    }
    
    
}

