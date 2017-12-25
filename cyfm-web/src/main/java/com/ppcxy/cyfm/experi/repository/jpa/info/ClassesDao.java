package com.ppcxy.cyfm.experi.repository.jpa.info;

import com.ppcxy.common.repository.jpa.BaseRepository;
import com.ppcxy.cyfm.experi.entity.info.Classes;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * Classes dao
 */
public interface ClassesDao extends BaseRepository<Classes, Long> {
    Classes findByClassesName(String className);
    
    @Query(value = "select o from Classes o where o.major.id=?1")
    List<Classes> findByMajor(Long majorId);
  
    @Query(value = "select o from Classes o where o.grade.id=?1")
    List<Classes> findByGrade(Long gradeId);
    
}
