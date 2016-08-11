package com.ppcxy.cyfm.sys.web.authorize;

import com.ppcxy.common.web.controller.BaseCRUDController;
import com.ppcxy.cyfm.sys.entity.authorize.Authorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by weep on 2016-7-7.
 */
@Controller
@RequestMapping("/sys/authorize")
public class AuthorizeController extends BaseCRUDController<Authorize, Long> {

    public AuthorizeController() {
        setResourceIdentity("authorize");
    }
}
