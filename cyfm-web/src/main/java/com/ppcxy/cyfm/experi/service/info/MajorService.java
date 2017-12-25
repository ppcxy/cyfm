package com.ppcxy.cyfm.experi.service.info;

import com.ppcxy.common.exception.BaseException;
import com.ppcxy.common.service.BaseService;
import com.ppcxy.cyfm.experi.entity.info.Classes;
import com.ppcxy.cyfm.experi.entity.info.Major;
import com.ppcxy.cyfm.experi.repository.jpa.info.ClassesDao;
import com.ppcxy.cyfm.experi.repository.jpa.info.MajorDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * classes service
 */
@Service
@Transactional
public class MajorService extends BaseService<Major, Long> implements CreateObjForMap<Major> {
    @Autowired
    private MajorDao majorDao;
    
    @Override
    public Major createObj(Map<String, String> data) {
        String majorName = data.get("majorName");
        String majorNumber = data.get("majorNumber");
        String majorType = data.get("majorType");
        String weight = data.get("weight");
        
        
        Major major = majorDao.findByMajorName(majorName);
        if (major == null) {
            major = new Major();
        }
        
        major.setMajorName(majorName);
        major.setMajorNumber(majorNumber);
        major.setMajorType(majorType);
        major.setWeight(Integer.parseInt(weight.replaceAll(".0","")));
        
        return major;
    }
    
    @Autowired
    private ClassesDao classesDao;
    @Override
    public void delete(Long majorId) {
        //班级引用就无法删除
        List<Classes> classes = classesDao.findByMajor(majorId);
        if (classes.size() > 0) {
            throw new BaseException("专业被班级信息使用中，无法删除。");
        }
        super.delete(majorId);
    }
}
