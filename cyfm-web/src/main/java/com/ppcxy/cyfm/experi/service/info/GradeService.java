package com.ppcxy.cyfm.experi.service.info;

import com.ppcxy.common.exception.BaseException;
import com.ppcxy.common.service.BaseService;
import com.ppcxy.cyfm.experi.entity.info.Classes;
import com.ppcxy.cyfm.experi.entity.info.Grade;
import com.ppcxy.cyfm.experi.repository.jpa.info.ClassesDao;
import com.ppcxy.cyfm.experi.repository.jpa.info.GradeDao;
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
public class GradeService extends BaseService<Grade, Long>  implements CreateObjForMap<Grade>{
    @Autowired
    private GradeDao gradeDao;
    
    @Override
    public Grade createObj(Map<String,String> data) {
        String gradeName = data.get("gradeName");
        String enrolYears = data.get("enrolYears");
        String weight = data.get("weight");
    
    
        Grade grade = gradeDao.findByGradeName(gradeName);
        if (grade == null) {
            grade = new Grade();
        }
        
        grade.setGradeName(gradeName);
        grade.setEnrolYears(enrolYears);
        grade.setWeight(Integer.parseInt(weight.replaceAll(".0","")));
        
        return grade;
    }
    
    @Autowired
    private ClassesDao classesDao;
    @Override
    public void delete(Long gradeId) {
        //班级引用就无法删除
        List<Classes> classes = classesDao.findByGrade(gradeId);
        if (classes.size() > 0) {
            throw new BaseException("年级被班级信息使用中，无法删除。");
        }
        super.delete(gradeId);
    }
}

