package com.ppcxy.cyfm.experi.service.info;

import com.ppcxy.common.exception.BaseException;
import com.ppcxy.common.service.BaseService;
import com.ppcxy.cyfm.experi.entity.info.Classes;
import com.ppcxy.cyfm.experi.entity.info.Grade;
import com.ppcxy.cyfm.experi.entity.info.Major;
import com.ppcxy.cyfm.experi.repository.jpa.info.ClassesDao;
import com.ppcxy.cyfm.experi.repository.jpa.info.GradeDao;
import com.ppcxy.cyfm.experi.repository.jpa.info.MajorDao;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;

/**
 * classes service
 */
@Service
@Transactional
public class ClassesService extends BaseService<Classes, Long> implements CreateObjForMap<Classes> {
    @Autowired
    private ClassesDao classesDao;
    @Autowired
    private MajorDao majorDao;
    @Autowired
    private GradeDao gradeDao;
    
    @Override
    public Classes createObj(Map<String, String> data) {
        String className = data.get("classesName");
        if (StringUtils.isBlank(className)) {
            return null;
        }
        String enrollment = data.get("enrollment");
        
        String majorName = data.get("major");
        
        Major major = majorDao.findByMajorName(majorName);
        if (StringUtils.isNotBlank(majorName) && major == null) {
            major = new Major();
            major.setMajorName(majorName);
            majorDao.save(major);
        }
        String gradeName = data.get("grade");
        Grade grade = gradeDao.findByGradeName(gradeName);
        if (StringUtils.isNotBlank(gradeName) && grade == null) {
            grade = new Grade();
            grade.setGradeName(gradeName);
            gradeDao.save(grade);
        }
        
        Classes classes = classesDao.findByClassesName(className);

        if (classes == null) {
            classes = new Classes();
        }
        
        classes.setClassesName(className);
        classes.setEnrollment(Integer.parseInt(enrollment.replaceAll(".0", "")));
        classes.setMajor(major);
        classes.setGrade(grade);
        
        return classes;
    }
    
    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Override
    public void delete(Long classesId) {
        Integer count = jdbcTemplate.queryForObject("select count(*) from experi_plan_classes where classes_id="+classesId,Integer.class);
        if (count > 0) {
            throw new BaseException("班级信息被计划使用中，无法删除。");
        }
        super.delete(classesId);
    }

}
