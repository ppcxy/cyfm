package com.ppcxy.cyfm.sys.repository.jpa.team;

import com.ppcxy.common.repository.jpa.BaseRepository;
import com.ppcxy.cyfm.sys.entity.team.Team;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

/**
 * Created by weep on 2016-5-16.
 */
public interface TeamDao extends BaseRepository<Team,Long> {
    @Modifying
    @Query(value = "delete Team where id=?1")
    void deleteById(Long id);
}
