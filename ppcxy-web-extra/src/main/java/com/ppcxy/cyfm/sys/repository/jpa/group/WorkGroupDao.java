package com.ppcxy.cyfm.sys.repository.jpa.group;

import com.ppcxy.common.repository.jpa.BaseRepository;
import com.ppcxy.cyfm.sys.entity.group.WorkGroup;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * Created by weep on 2016-5-16.
 */
public interface WorkGroupDao extends BaseRepository<WorkGroup, Long> {
	
	@Modifying
	@Query(value = "delete from WorkGroup where id=?1")
	void deleteById(Long id);
	
	@Query(value = "select distinct o.id from WorkGroup o left join o.userList u where (u.id = ?1 or o.master.id=?1) and o.deleted=false")
	List<Long> loadGroupIdsByUserId(Long userId);
	
	
	@Query(value = "select distinct sg.* from cy_sys_work_group_user o right join cy_sys_work_group sg ON o.work_group_id = sg.id WHERE (o.user_id=?1 or sg.master_id=?1) and deleted=false", nativeQuery = true)
	List<WorkGroup> loadGroupIdsByUserIdMap(Long userId);
	
	@Query(value = "select o.* from cy_sys_work_group o  WHERE o.master_id=?1 and o.deleted=false", nativeQuery = true)
	List<WorkGroup> findWorkGrouByMaster(Long userId);
	
	@Query("select wg from WorkGroup wg where wg.name=?1  and wg.team.id=?2")
	WorkGroup findByNameAndTeamId(String groupName, Long teamId);
	
	@Query("select wg from WorkGroup wg where wg.name=?1 and wg.deleted=false ")
	WorkGroup findByName(String name);
	
	@Query("select wg from WorkGroup wg where wg.team.id=?1 and wg.deleted=false")
	List<WorkGroup> findByTeamId(Long teamId);
}
