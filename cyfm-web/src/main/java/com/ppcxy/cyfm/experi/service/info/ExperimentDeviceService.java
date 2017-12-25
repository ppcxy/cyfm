package com.ppcxy.cyfm.experi.service.info;

import com.ppcxy.common.exception.BaseException;
import com.ppcxy.common.service.BaseService;
import com.ppcxy.cyfm.experi.entity.info.Classes;
import com.ppcxy.cyfm.experi.entity.info.ExperimentDevice;
import com.ppcxy.cyfm.experi.repository.jpa.experi.ExperimentPlanDao;
import com.ppcxy.cyfm.experi.repository.jpa.info.ExperimentDeviceDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * ExperimentPlace service
 */
@Service
@Transactional
public class ExperimentDeviceService extends BaseService<ExperimentDevice, Long> implements CreateObjForMap<ExperimentDevice> {
    @Autowired
    private ExperimentDeviceDao experimentDeviceDao;
    
    @Override
    public ExperimentDevice createObj(Map<String, String> data) {
        
        String deviceName = data.get("deviceName");
        String deviceType = data.get("deviceType");
        String deviceState = data.get("deviceState");
        
        ExperimentDevice device = experimentDeviceDao.findByDeviceName(deviceName);
       
        if (device == null) {
            device = new ExperimentDevice();
        }
        device.setDeviceName(deviceName);
        device.setDeviceType(deviceType);
        device.setDeviceState(deviceState);
        
        return device;
    }
    
    @Autowired
    private ExperimentPlanDao experimentPlanDao;
    
    @Override
    public void delete(Long deviceId) {
        //班级引用就无法删除
        List<Classes> classes = experimentPlanDao.findByDevice(deviceId);
        if (classes.size() > 0) {
            throw new BaseException("设备信息被计划信息使用中，无法删除。");
        }
        super.delete(deviceId);
    }
}
