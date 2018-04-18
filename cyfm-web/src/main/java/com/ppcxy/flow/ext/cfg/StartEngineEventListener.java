package com.ppcxy.flow.ext.cfg;

import org.flowable.engine.ProcessEngine;
import org.flowable.engine.impl.cfg.ProcessEngineConfigurationImpl;

public interface StartEngineEventListener {
    
    void afterStartEngine(ProcessEngineConfigurationImpl conf, ProcessEngine processEngine) throws Exception;
    
    void beforeStartEngine(ProcessEngineConfigurationImpl conf) throws Exception;
    
}
