package com.ppcxy.cyfm.experi.repository.jpa.info;

import com.ppcxy.common.repository.jpa.BaseRepository;
import com.ppcxy.cyfm.experi.entity.info.ExperimentPlace;

/**
 * ExperimentPlace dao
 */
public interface ExperimentPlaceDao extends BaseRepository<ExperimentPlace, Long> {
    ExperimentPlace findByPlaceName(String placeName);
}
