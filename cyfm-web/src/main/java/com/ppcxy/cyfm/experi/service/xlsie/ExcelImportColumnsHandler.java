package com.ppcxy.cyfm.experi.service.xlsie;

import com.google.common.collect.Lists;
import com.ppcxy.common.service.BaseService;
import com.ppcxy.common.spring.SpringContextHolder;
import com.ppcxy.cyfm.experi.entity.info.*;
import com.ppcxy.cyfm.experi.service.info.*;
import org.xml.sax.helpers.DefaultHandler;

import java.util.List;
import java.util.Map;

/**
 * <p>Date: 13-7-12 下午9:50
 * <p>Version: 1.0
 */
public class ExcelImportColumnsHandler extends DefaultHandler {
    
    private static final String[] majorColumns = new String[]{"majorType", "majorNumber", "majorName", "weight"};
    private static final String[] gradeColumns = new String[]{"gradeName", "enrolYears", "weight"};
    private static final String[] classesColumns = new String[]{"classesName", "major", "grade", "enrollment"};
    private static final String[] courseColumns = new String[]{"courseNumber", "courseName", "courseType", "coursePeriodCount"};
    private static final String[] experimentPlaceColumns = new String[]{"placeName", "placeInfo"};
    private static final String[] experimentDeviceColumns = new String[]{"deviceName", "deviceType", "deviceState"};
    
    
    
   
    private String[] columns = null;
    private Class c = null;
    private BaseService baseService = null;
    
    
    ExcelImportColumnsHandler(String infoType) {
        
        switch (infoType) {
            case "major":
                columns = majorColumns;
                c = Major.class;
                baseService = SpringContextHolder.getBean(MajorService.class);
                break;
            case "course":
                columns = courseColumns;
                c = Course.class;
                baseService = SpringContextHolder.getBean(CourseService.class);
                break;
            case "experimentDevice":
                columns = experimentDeviceColumns;
                c = ExperimentDevice.class;
                baseService = SpringContextHolder.getBean(ExperimentDeviceService.class);
                break;
            case "experimentPlace":
                columns = experimentPlaceColumns;
                c = ExperimentPlace.class;
                baseService = SpringContextHolder.getBean(ExperimentPlaceService.class);
                break;
            case "grade":
                columns = gradeColumns;
                c = Grade.class;
                baseService = SpringContextHolder.getBean(GradeService.class);
                break;
            case "classes":
                columns = classesColumns;
                c = Classes.class;
                baseService = SpringContextHolder.getBean(ClassesService.class);
                break;
        }
        
    }
    
    public Class getC() {
        return c;
    }
    
    public String[] getColumns() {
        return columns;
    }
    
    
    public void saveDatas(List<Map<String, Object>> dataList) {
    
        List list = Lists.newArrayList();
    
        for (int i = 0; i < dataList.size(); i++) {
            Map<String, Object> data = dataList.get(i);
            Object obj = ((CreateObjForMap) baseService).createObj(data);
            if (obj != null) {
                list.add(obj);
            }
        }
        
        baseService.save(list);
    
    }
}
