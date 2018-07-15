package com.ppcxy.cyfm.manage.service.maintaion.dynamictask;

import com.ppcxy.common.service.BaseService;
import com.ppcxy.cyfm.manage.entity.maintaion.dynamictask.TaskDefinition;
import com.ppcxy.cyfm.manage.repository.jpa.maintaion.dynamictask.TaskDefinitionDao;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>Date: 13-2-4 下午3:01
 * <p>Version: 1.0
 */
@Service
@Transactional
public class TaskDefinitionService extends BaseService<TaskDefinition, Long> {
    
    public TaskDefinition findByName(String name) {
        return ((TaskDefinitionDao) baseRepository).findByName(name);
    }
}
