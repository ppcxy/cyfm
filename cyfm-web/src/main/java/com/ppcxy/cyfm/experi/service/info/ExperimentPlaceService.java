package com.ppcxy.cyfm.experi.service.info;

import com.ppcxy.common.exception.BaseException;
import com.ppcxy.common.service.BaseService;
import com.ppcxy.cyfm.experi.entity.info.Classes;
import com.ppcxy.cyfm.experi.entity.info.ExperimentPlace;
import com.ppcxy.cyfm.experi.repository.jpa.experi.ExperimentPlanDao;
import com.ppcxy.cyfm.experi.repository.jpa.info.ExperimentPlaceDao;
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
public class ExperimentPlaceService extends BaseService<ExperimentPlace, Long>  implements CreateObjForMap<ExperimentPlace>{
    @Autowired
    private ExperimentPlaceDao experimentPlaceDao;
    
    @Override
    public ExperimentPlace createObj(Map<String,String> data) {
        String placeName = data.get("placeName");
        String placeInfo = data.get("placeInfo");
    
        ExperimentPlace place = experimentPlaceDao.findByPlaceName(placeName);
        if (place == null) {
            place = new ExperimentPlace();
        }
        place.setPlaceName(placeName);
        place.setPlaceInfo(placeInfo);
    
        return place;
    }
    
    
    @Autowired
    private ExperimentPlanDao experimentPlanDao;
    
    @Override
    public void delete(Long placeId) {
        //班级引用就无法删除
        List<Classes> classes = experimentPlanDao.findByPlace(placeId);
        if (classes.size() > 0) {
            throw new BaseException("场地信息被计划信息使用中，无法删除。");
        }
        super.delete(placeId);
    }
}
