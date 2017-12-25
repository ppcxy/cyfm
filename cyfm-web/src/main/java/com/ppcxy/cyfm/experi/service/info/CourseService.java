package com.ppcxy.cyfm.experi.service.info;

import com.ppcxy.common.exception.BaseException;
import com.ppcxy.common.service.BaseService;
import com.ppcxy.cyfm.experi.entity.info.Classes;
import com.ppcxy.cyfm.experi.entity.info.Course;
import com.ppcxy.cyfm.experi.repository.jpa.experi.ExperimentPlanDao;
import com.ppcxy.cyfm.experi.repository.jpa.info.CourseDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * classes service
 */
@Service
@Transactional
public class CourseService extends BaseService<Course, Long> implements CreateObjForMap<Course> {
    @Autowired
    private CourseDao courseDao;
    
    @Override
    public Course createObj(Map<String, String> data) {
        String courseNumber = data.get("courseNumber");
        String courseName = data.get("courseName");
        if (courseName == null && courseNumber == null) {
            return null;
        }
        String courseType = data.get("courseType");
        String coursePeriodCount = data.get("coursePeriodCount");
        
        Course course = courseDao.findByCourseNameAndCourseNumber(courseName, courseNumber);
        if (course == null) {
            course = new Course();
        }
    
        course.setCourseNumber(courseNumber);
        course.setCourseName(courseName);
        course.setCourseType(courseType);
        course.setCoursePeriodCount(Integer.parseInt(coursePeriodCount.replaceAll(".0","")));
        
        return course;
    }
    
    @Autowired
    private ExperimentPlanDao experimentPlanDao;
    
    @Override
    public void delete(Long courseId) {
        //班级引用就无法删除
        List<Classes> classes = experimentPlanDao.findByCourse(courseId);
        if (classes.size() > 0) {
            throw new BaseException("课程信息被计划信息使用中，无法删除。");
        }
        super.delete(courseId);
    }
}
