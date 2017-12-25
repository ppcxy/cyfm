package com.ppcxy.cyfm.experi.repository.jpa.info;

import com.ppcxy.common.repository.jpa.BaseRepository;
import com.ppcxy.cyfm.experi.entity.info.Grade;

/**
 * grade dao
 */
public interface GradeDao extends BaseRepository<Grade, Long> {
    Grade findByGradeName(String gradeName);
}
