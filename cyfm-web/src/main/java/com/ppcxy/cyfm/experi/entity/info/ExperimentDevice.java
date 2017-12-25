package com.ppcxy.cyfm.experi.entity.info;

import com.ppcxy.common.entity.IdEntity;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 实验设备
 */
@Entity
@Table(name = "experi_device")
public class ExperimentDevice extends IdEntity {
    /**
     * 设备名称
     */
    private String deviceName;
    /**
     * 设备类型
     */
    private String deviceType;
    /**
     * 设备状态
     */
    private String deviceState;

    public String getDeviceName() {
        return deviceName;
    }

    public void setDeviceName(String deviceName) {
        this.deviceName = deviceName;
    }

    public String getDeviceType() {
        return deviceType;
    }

    public void setDeviceType(String deviceType) {
        this.deviceType = deviceType;
    }

    public String getDeviceState() {
        return deviceState;
    }

    public void setDeviceState(String deviceState) {
        this.deviceState = deviceState;
    }
    
}
