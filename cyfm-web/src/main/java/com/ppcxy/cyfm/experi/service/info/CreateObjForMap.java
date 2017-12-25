package com.ppcxy.cyfm.experi.service.info;

import java.util.Map;

public interface CreateObjForMap<T> {
    T createObj(Map<String,String> data);
}
