package com.ppcxy.cyfm.experi.repository.jpa.info;

import com.ppcxy.common.repository.jpa.BaseRepository;
import com.ppcxy.cyfm.experi.entity.info.Major;

/**
 * major dao
 */
public interface MajorDao extends BaseRepository<Major, Long> {
    Major findByMajorName(String majorName);
}
