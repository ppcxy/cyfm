package com.ppcxy.common.repository;

import com.ppcxy.common.entity.search.Searchable;
import com.ppcxy.common.repository.entity.BaseInfo;
import com.ppcxy.common.repository.entity.SchoolInfo;
import com.ppcxy.common.repository.entity.User;
import com.ppcxy.common.repository.jpa.BaseRepository;
import org.springframework.data.domain.Page;

import java.util.List;


/**
 * <p>用户仓库</p>
 */
public interface UserRepository2 extends BaseRepository<User, Long> {


    ////////////////////////////////////////////////////
    /////////以下实现都委托给UserRepository2Impl///////
    ////////////////////////////////////////////////////

    public BaseInfo findBaseInfoByUserId(Long userId);

    public List<SchoolInfo> findAllSchoolTypeByUserId(Long userId);

    public Page<User> findAllByDefault(final Searchable searchable);

    public long countAllByDefault(final Searchable searchable);

    public long countAllByCustom(final Searchable searchable);

    public Page<User> findAllByCustom(final Searchable searchable);

}
