package com.ppcxy.cyfm.experi.service.experi;

import com.ppcxy.common.service.BaseService;
import com.ppcxy.cyfm.experi.entity.experi.ExperimentPlan;
import com.ppcxy.cyfm.experi.repository.jpa.experi.ExperimentPlanDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * ExperimentProject service
 */
@Service
@Transactional
public class ExperimentPlanService extends BaseService<ExperimentPlan, Long> {
    @Autowired
    private ExperimentPlanDao experimentPlanDao;
    
    public List<ExperimentPlan> findBySchoolYear(String schoolYear) {
        return experimentPlanDao.findBySchoolYear(schoolYear);
    }
    
    public List<ExperimentPlan> findBySchoolYearAndSemester(String schoolYear, String semester) {
         return experimentPlanDao.findBySchoolYearAndSemester(schoolYear,semester);
    }
}
