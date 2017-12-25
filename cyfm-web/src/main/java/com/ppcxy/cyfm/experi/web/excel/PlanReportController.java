package com.ppcxy.cyfm.experi.web.excel;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.ppcxy.cyfm.experi.entity.experi.ExperimentPlan;
import com.ppcxy.cyfm.experi.entity.experi.Plan;
import com.ppcxy.cyfm.experi.service.experi.ExperimentPlanService;
import com.ppcxy.cyfm.experi.service.experi.utils.JxlsUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springside.modules.utils.Collections3;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;

/**
 * excel报表导出
 */
@Controller
@RequestMapping(value = "/excel/report")
public class PlanReportController {
    
    @Autowired
    private ExperimentPlanService experimentPlanService;
    
    
    /**
     * 报表导出中心，调用下面三个报表导出的方法。
     * @return
     */
    @RequestMapping
    public String form(){
        return "/excel/report/reportForm";
    }
    
    /**
     * 实验计划申请表
     *
     * @param schoolYear
     * @param request
     * @param response
     * @param model
     * @throws Exception
     */
    @RequestMapping(value = "expireAppove")
    public void expireAppove(String schoolYear, String semester, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
        String agent = request.getHeader("USER-AGENT").toLowerCase();
        //根据浏览器类型处理文件名称
        String exportfileName = "信息工程学院-" + schoolYear.replaceAll("/", "--") + "年第" + semester + "学期实验申请.xls";
        if (agent.indexOf("msie") > -1) {
            exportfileName = java.net.URLEncoder.encode(exportfileName, "UTF-8");
        } else {  //firefox/safari不转码
            exportfileName = new String(exportfileName.getBytes("UTF-8"), "ISO8859-1");
        }
        //设置下载文件格式
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-disposition", "attachment;filename=" + exportfileName);
        
        
        //获取模板文件
        String dir = "classpath:exportTemplate/";
        File temapleFile = ResourceUtils.getFile(dir + "expireAppove.xls");
        InputStream is = new FileInputStream(temapleFile);
        OutputStream os = response.getOutputStream();
        String semesterParam = "1";
        if (semester.equals("一")) {
            semesterParam = "1";
        } else if (semester.equals("二")) {
            semesterParam = "2";
        }
        
        //根据报表条件查询数据
        List<ExperimentPlan> plans = experimentPlanService.findBySchoolYearAndSemester(schoolYear, semesterParam);
        
        
        //将数据根据xls末班导出
        Map<String, Object> map = Maps.newHashMap();
        map.put("begin", schoolYear.split("/")[0]);
        map.put("end", schoolYear.split("/")[1]);
        map.put("semester", semester);
        map.put("planReport", plans);
        JxlsUtil.exportExcel(is, os, map);
        os.flush();
    }
    
    /**
     * 导出佐表1 实验场所实验教学统计表
     *
     * @param schoolYear
     * @param request
     * @param response
     * @param model
     * @throws Exception
     */
    @RequestMapping(value = "table1")
    public void exportTable1(String schoolYear, String semester, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
        String agent = request.getHeader("USER-AGENT").toLowerCase();
        //根据浏览器类型处理文件名称
        String exportfileName = "信息工程学院佐表1.xls";
        if (agent.indexOf("msie") > -1) {
            exportfileName = java.net.URLEncoder.encode(exportfileName, "UTF-8");
        } else {  //firefox/safari不转码
            exportfileName = new String(exportfileName.getBytes("UTF-8"), "ISO8859-1");
        }
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-disposition", "attachment;filename=" + exportfileName);
        
        
        String dir = "classpath:exportTemplate/";
        File temapleFile = ResourceUtils.getFile(dir + "table1.xls");
        InputStream is = new FileInputStream(temapleFile);
        OutputStream os = response.getOutputStream();
        
        
        List<ExperimentPlan> plans = experimentPlanService.findBySchoolYearAndSemester(schoolYear, semester);
        List<Plan> dataList = Lists.newArrayList();
        
        for (ExperimentPlan plan : plans) {
            Plan planDTO = new Plan();
            planDTO.setPlaceName(plan.getPlace().getPlaceName());
            planDTO.setCourseName(plan.getCourse().getCourseName());
            planDTO.setClasses(Collections3.extractToString(plan.getClasses(), "classesName", "+"));
            planDTO.setMajor(plan.getClasses().get(0).getMajor().getMajorName());
            planDTO.setProjects(plan.getProjects());
            planDTO.setPlanPersonCount(plan.getPlanPersonCount());
            dataList.add(planDTO);
        }
        
        
        Map<String, Object> map = Maps.newHashMap();
        map.put("schoolYear", schoolYear);
        map.put("semester", semester);
        map.put("planReport", dataList);
        JxlsUtil.exportExcel(is, os, map);
        os.flush();
    }
    
    /**
     * 导出佐表2 实验项目场所开设项目统计表
     *
     * @param schoolYear
     * @param request
     * @param response
     * @param model
     * @throws Exception
     */
    @RequestMapping(value = "table2")
    public void exportTable2(String schoolYear, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
        String agent = request.getHeader("USER-AGENT").toLowerCase();
        //根据浏览器类型处理文件名称
        String exportfileName = "信息工程学院佐表2.xls";
        if (agent.indexOf("msie") > -1) {
            exportfileName = java.net.URLEncoder.encode(exportfileName, "UTF-8");
        } else {  //firefox/safari不转码
            exportfileName = new String(exportfileName.getBytes("UTF-8"), "ISO8859-1");
        }
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-disposition", "attachment;filename=" + exportfileName);
        
        
        String dir = "classpath:exportTemplate/";
        File temapleFile = ResourceUtils.getFile(dir + "table2.xls");
        InputStream is = new FileInputStream(temapleFile);
        OutputStream os = response.getOutputStream();
        
        
        List<ExperimentPlan> plans = experimentPlanService.findBySchoolYear(schoolYear);
        List<Plan> dataList = Lists.newArrayList();
        
        for (ExperimentPlan plan : plans) {
            Plan planDTO = new Plan();
            planDTO.setPlaceName(plan.getPlace().getPlaceName());
            planDTO.setPlaceType(plan.getPlace().getPlaceInfo());
            planDTO.setProjects(plan.getProjects());
            dataList.add(planDTO);
        }
        
        
        Map<String, Object> map = Maps.newHashMap();
        map.put("schoolYear", schoolYear);
        map.put("planReport", dataList);
        JxlsUtil.exportExcel(is, os, map);
        os.flush();
    }
}

