package com.ppcxy.cyfm.experi.entity.info;

import com.ppcxy.common.entity.IdEntity;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 实验场地，地点
 */
@Entity
@Table(name = "experi_place")
public class ExperimentPlace extends IdEntity {

    /**
     * 试验场地名称
     */
    private String placeName;
    /**
     * 实验场地信息
     */
    private String placeInfo;

    public String getPlaceName() {
        return placeName;
    }

    public void setPlaceName(String placeName) {
        this.placeName = placeName;
    }

    public String getPlaceInfo() {
        return placeInfo;
    }

    public void setPlaceInfo(String placeInfo) {
        this.placeInfo = placeInfo;
    }
}
