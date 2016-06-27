package com.ppcxy.cyfm.sys.repository.jpa;

import com.ppcxy.cyfm.sys.entity.User;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * Created by weep on 2016-5-17.
 */
public interface AccountDao extends PagingAndSortingRepository<User, Long>, JpaSpecificationExecutor<User> {
    User findByName(String name);

    User findByLoginName(String loginName);

    User findByEmail(String email);

    User findByTel(String mobilePhoneNumber);
}
