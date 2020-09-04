package com.ppcxy.cyfm.sys.service.group;

import com.google.common.collect.Lists;
import com.ppcxy.common.service.BaseService;
import com.ppcxy.cyfm.sys.entity.group.WorkGroup;
import com.ppcxy.cyfm.sys.repository.jpa.group.WorkGroupDao;
import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Element;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.PostConstruct;
import java.util.List;

/**
 * Created by weep on 2016-5-16.
 */
@Service
@Transactional
public class WorkGroupService extends BaseService<WorkGroup, Long> {
	
	@Autowired
	private WorkGroupDao workGroupDao;
	
	private static final String CACHE_NAME = "userGroupCache";
	
	@Autowired
	private CacheManager ehcacheManager;
	
	private Cache cache;
	
	
	@PostConstruct
	private void initCache() {
		if (cache == null) {
			cache = ehcacheManager.getCache(CACHE_NAME);
		}
	}
	
	private String genUserGroupKey(Long userId) {
		return String.format("USERGROUP_%d", userId);
	}
	
	private Object get(String key) {
		Element element = cache.get(key);
		if (element == null) {
			return null;
		}
		return element.getObjectValue();
	}
	
	private void put(String key, Object value) {
		Element element = new Element(key, value);
		cache.put(element);
	}
	
	public List<String> getUserWorkGroupsByString(Long userId) {
		List<String> uwgs = Lists.newArrayList();
		getUserWorkGroups(userId).forEach(x -> {
			uwgs.add(x.toString());
		});
		return uwgs;
	}
	
	public List<Long> getUserWorkGroups(Long userId) {
		
		Long[] workGroupIds;
		String userGroupCacheKey = genUserGroupKey(userId);
		Object cacheAuthList = get(userGroupCacheKey);
		if (cacheAuthList != null) {
			workGroupIds = (Long[]) cacheAuthList;
		} else {
			workGroupIds = workGroupDao.loadGroupIdsByUserId(userId).toArray(new Long[]{});
			put(userGroupCacheKey, workGroupIds);
		}
		return Lists.newArrayList(workGroupIds);
	}
	
	
	public List<WorkGroup> getUserWorkGroupsMap(Long userId) {
		List<WorkGroup> workGroupIds = workGroupDao.loadGroupIdsByUserIdMap(userId);
		return workGroupIds;
	}
	
	
	@Override
	public WorkGroup save(WorkGroup entity) {
		WorkGroup wg = super.save(entity);
		cache.removeAll();
		return wg;
	}
	
	@Override
	public WorkGroup update(WorkGroup entity) {
		WorkGroup g = super.update(entity);
		cache.removeAll();
		return g;
	}
	
	@Override
	public void delete(Long aLong) {
		super.delete(aLong);
		cache.removeAll();
	}
	
	public WorkGroup findByName(String name) {
		return workGroupDao.findByName(name);
	}
	
	public WorkGroup findByNameAndTeamId(String groupName, Long teamId) {
		WorkGroup wg = workGroupDao.findByNameAndTeamId(groupName, teamId);
		if (wg == null || wg.getDeleted()) {
			return null;
		}
		return wg;
	}
	
	public WorkGroup checkTeamWorkGroup(String groupName, Long teamId) {
		return workGroupDao.findByNameAndTeamId(groupName, teamId);
	}
	
	
	public List<WorkGroup> findByTeamId(Long teamId) {
		return workGroupDao.findByTeamId(teamId);
	}
	
	public List<WorkGroup> getUserWorkGroupsByMaster(Long userId) {
		return workGroupDao.findWorkGrouByMaster(userId);
	}
}
