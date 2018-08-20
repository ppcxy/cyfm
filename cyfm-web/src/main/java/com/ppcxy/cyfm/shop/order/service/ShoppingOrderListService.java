package com.ppcxy.cyfm.shop.order.service;

import com.ppcxy.common.service.BaseService;
import com.ppcxy.cyfm.shop.order.entity.ShoppingOrderList;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ShoppingOrderListService extends BaseService<ShoppingOrderList, Long> {
}
