package com.ppcxy.cyfm.shop.goods.service;

import com.ppcxy.common.service.BaseService;
import com.ppcxy.cyfm.shop.goods.entity.GoodsInventory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class GoodsInventoryService extends BaseService<GoodsInventory,Long> {
}
