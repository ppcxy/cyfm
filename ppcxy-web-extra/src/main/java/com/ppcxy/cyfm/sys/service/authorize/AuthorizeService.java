package com.ppcxy.cyfm.sys.service.authorize;

import com.ppcxy.common.service.BaseService;
import com.ppcxy.cyfm.sys.entity.authorize.Authorize;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

/**
 * Created by weep on 2016-8-11.
 */
@Service
@Transactional
public class AuthorizeService extends BaseService<Authorize, Long> {
}
