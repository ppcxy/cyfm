package com.ppcxy.cyfm.experi.repository.jpa.experi;

import com.ppcxy.common.repository.jpa.BaseRepository;
import com.ppcxy.cyfm.experi.entity.experi.ExperimentPlan;
import com.ppcxy.cyfm.experi.entity.info.Classes;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * Experiment dao
 */
public interface ExperimentPlanDao extends BaseRepository<ExperimentPlan, Long> {
    List<ExperimentPlan> findBySchoolYear(String schoolYear);
    
    List<ExperimentPlan> findBySchoolYearAndSemester(String schoolYear, String semester);
    
    @Query(value = "select o from ExperimentPlan o where o.device.id=?1")
    List<Classes> findByDevice(Long deviceId);
    @Query(value = "select o from ExperimentPlan o where o.place.id=?1")
    List<Classes> findByPlace(Long placeId);
    @Query(value = "select o from ExperimentPlan o where o.course.id=?1")
    List<Classes> findByCourse(Long courseId);
}
