package com.ppcxy.cyfm.sys.service.team;

import com.ppcxy.common.entity.search.Searchable;
import com.ppcxy.common.service.BaseService;
import com.ppcxy.cyfm.sys.entity.team.Team;
import com.ppcxy.cyfm.sys.repository.jpa.team.TeamDao;
import org.javasimon.aop.Monitored;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by weep on 2016-5-16.
 */
@Component
@Transactional
@Monitored
public class TeamService extends BaseService<Team, Long> {
    @Autowired
    private TeamDao teamDao;

    public Page<Team> test(Searchable searchable) {
        return teamDao.findAll(searchable);
    }

    public void deleteOne(Long id) {
        teamDao.deleteById(id);
    }
}
