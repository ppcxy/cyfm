package com.ppcxy.cyfm.experi.repository.jpa.info;

import com.ppcxy.common.repository.jpa.BaseRepository;
import com.ppcxy.cyfm.experi.entity.info.ExperimentDevice;

/**
 * ExperimentPlace dao
 */
public interface ExperimentDeviceDao extends BaseRepository<ExperimentDevice, Long> {
    ExperimentDevice findByDeviceName(String deviceName);
}
