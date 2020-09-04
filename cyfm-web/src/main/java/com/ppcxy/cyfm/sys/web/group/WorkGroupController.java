package com.ppcxy.cyfm.sys.web.group;

import com.ppcxy.common.entity.search.SearchOperator;
import com.ppcxy.common.entity.search.Searchable;
import com.ppcxy.common.exception.BaseException;
import com.ppcxy.common.utils.LogUtils;
import com.ppcxy.common.utils.ShiroUserInfoUtils;
import com.ppcxy.common.web.bind.annotation.CurrentUser;
import com.ppcxy.common.web.controller.BaseCRUDController;
import com.ppcxy.cyfm.sys.entity.group.WorkGroup;
import com.ppcxy.cyfm.sys.entity.permission.Role;
import com.ppcxy.cyfm.sys.entity.team.Team;
import com.ppcxy.cyfm.sys.entity.user.User;
import com.ppcxy.cyfm.sys.entity.user.UserStatus;
import com.ppcxy.cyfm.sys.service.authorize.AuthorizeService;
import com.ppcxy.cyfm.sys.service.group.WorkGroupService;
import com.ppcxy.cyfm.sys.service.permission.RoleService;
import com.ppcxy.cyfm.sys.service.team.TeamService;
import com.ppcxy.cyfm.sys.service.user.UserService;
import com.ppcxy.cyfm.sys.web.team.dto.TeamUserDTO;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springside.modules.mapper.JsonMapper;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Objects;
import java.util.UUID;

/**
 * Created by weep on 2016-5-16.
 */
@Controller
@RequestMapping(value = "/sys/workGroup")
public class WorkGroupController extends BaseCRUDController<WorkGroup, Long> {
	
	@Autowired
	private RoleService roleService;
	@Autowired
	private UserService userService;
	@Autowired
	private WorkGroupService workGroupService;
	
	public WorkGroupController() {
		setResourceIdentity("sys:workGroup");
		//和资源一致可以不处理
		setModelName("workGroup");
	}
	
	@Override
	public void beforList(Searchable searchable, Model model) {
		super.beforList(searchable, model);
		
		searchable.addSearchFilter("deleted", SearchOperator.eq, false);
		//设置仅允许查看本团队的用户组信息
		if (ShiroUserInfoUtils.getTeamId() != 1 && !SecurityUtils.getSubject().hasRole("Admin")) {
			searchable.addSearchFilter("team.id", SearchOperator.eq, ShiroUserInfoUtils.getTeamId());
			
			User user = userService.findOne(ShiroUserInfoUtils.getUserId());
			if (!Objects.equals(user.getTeam().getMaster().getId(), user.getId())) {
				searchable.addSearchFilter("master.id", SearchOperator.eq, user.getId());
			}
			
		}
	}
	
	@Override
	public void beforCreate(Model model, WorkGroup entity, BindingResult result, RedirectAttributes redirectAttributes) {
		super.beforCreate(model, entity, result, redirectAttributes);
		bindNewUserList(entity);
	}
	
	
	@Override
	public void afterCreate(Model model, WorkGroup entity, BindingResult result, RedirectAttributes redirectAttributes) {
		super.afterCreate(model, entity, result, redirectAttributes);
		addWorkGroupAdminRoleToUser(entity);
	}
	
	public void addWorkGroupAdminRoleToUser(WorkGroup entity) {
		
		if (entity.getMaster() != null) {
			Role role = roleService.findByValue("WORK_GROUP_ADMIN");
			
			if (role != null) {
				HttpServletRequest request = ((ServletRequestAttributes) (RequestContextHolder.currentRequestAttributes())).getRequest();
				String oldMaster = request.getParameter("oldMaster");
				
				if (StringUtils.isNotBlank(oldMaster)) {
					if (!Objects.equals(entity.getMaster().getId(), Long.parseLong(oldMaster))) {
						roleService.removeRoleAllot(role.getId(), Long.parseLong(oldMaster));
					}
				}
				
				List<User> users = roleService.findUsers(role);
				if (!users.contains(entity.getMaster())) {
					roleService.allotRole2User(role.getId(), new Long[]{entity.getMaster().getId()});
				}
			}
			
		}
	}
	
	@Override
	public void beforUpdateForm(WorkGroup entity, Model model) {
		if (!SecurityUtils.getSubject().hasRole("TEAM_ADMIN") && !SecurityUtils.getSubject().hasRole("Admin")) {
			if (!SecurityUtils.getSubject().hasRole("WORK_GROUP_ADMIN") || !Objects.equals(entity.getMaster().getId(), ShiroUserInfoUtils.getUserId())) {
				throw new BaseException("无数据访问权限，请联系管理员。");
			}
			
		}
		super.beforUpdateForm(entity, model);
	}
	
	@Override
	public void afterUpdateForm(WorkGroup entity, Model model) {
		super.afterUpdateForm(entity, model);
		//修改的用户组默认属于当前用户所在团队
		validate(entity);
	}
	
	private void validate(WorkGroup entity) {
		if (!Objects.equals(ShiroUserInfoUtils.getTeamId(), entity.getTeam().getId()) && !SecurityUtils.getSubject().hasRole("Admin")) {
			BaseException e = new BaseException("系统错误。");
			LogUtils.logError(String.format("恶意修改非本团队工作组,%s。", ShiroUserInfoUtils.getUsername()), e);
			throw e;
		}
	}
	
	@Override
	public void beforUpdate(Model model, WorkGroup entity, BindingResult result, String backURL, RedirectAttributes redirectAttributes) {
		if (!SecurityUtils.getSubject().hasRole("TEAM_ADMIN") && !SecurityUtils.getSubject().hasRole("Admin")) {
			if (!SecurityUtils.getSubject().hasRole("WORK_GROUP_ADMIN") || (!Objects.equals(entity.getMaster().getId(), ShiroUserInfoUtils.getUserId()))) {
				throw new BaseException("无数据访问权限，请联系管理员。");
			}
			
		}
		
		super.beforUpdate(model, entity, result, backURL, redirectAttributes);
		
		//修改的用户组默认属于当前用户所在团队
		validate(entity);
		
		bindNewUserList(entity);
	}
	
	@Override
	public void afterUpdate(Model model, WorkGroup entity, BindingResult result, String backURL, RedirectAttributes redirectAttributes) {
		super.afterUpdate(model, entity, result, backURL, redirectAttributes);
		addWorkGroupAdminRoleToUser(entity);
	}
	
	private void bindNewUserList(WorkGroup entity) {
		
		HttpServletRequest request = ((ServletRequestAttributes) (RequestContextHolder.currentRequestAttributes())).getRequest();
		String[] userIds = request.getParameterValues("userList.id");
		
		List<User> userList = entity.getUserList();
		userList.clear();
		
		if (userIds != null) {
			//重新初始化用户列表
			for (String userId : userIds) {
				User user = new User();
				user.setId(new Long(userId));
				userList.add(user);
			}
		}
		
		authorizeService.refreshAll();
	}
	
	@Autowired
	private AuthorizeService authorizeService;
	
	@Autowired
	private TeamService teamService;
	
	/**
	 * 团队添加人员操作
	 *
	 * @param teamUserDTO
	 * @param currentUser
	 * @return
	 */
	@RequestMapping("createMember")
	@ResponseBody
	public String createMember(TeamUserDTO teamUserDTO, Long workGroupId, @CurrentUser User currentUser) {
		
		WorkGroup wg = baseService.findOne(workGroupId);
		if (!Objects.equals(currentUser.getId(), wg.getMaster().getId()) && !Objects.equals(currentUser.getId(), currentUser.getTeam().getMaster().getId())) {
			return "error";
		}
		
		User user = new User();
		user.setTeam(currentUser.getTeam());
		user.setUsername("RTUSER_" + UUID.randomUUID().toString().replaceAll("-", "").substring(2, 8) + UUID.randomUUID().toString().replaceAll("-", "").substring(18, 22));
		user.setName(teamUserDTO.getName());
		user.setPlainPassword(teamUserDTO.getPassword());
		user.setTel(teamUserDTO.getTel());
		user.setEmail(teamUserDTO.getEmail());
		user.setStatus(UserStatus.normal);
		
		
		List<Role> roles = teamService.getRolesByTeamId(currentUser.getTeam().getId());
		user.setRoleList(roles);
		
		userService.save(user);
		
		return new JsonMapper().toJson(user);
	}
	
	
	/**
	 * 修改成员账号使用状态
	 *
	 * @param memberId
	 * @param enable
	 * @param currentUser
	 * @return
	 */
	@RequestMapping("changeMemberState")
	@ResponseBody
	public String changeMemberState(Long memberId, Boolean enable, @CurrentUser User currentUser) {
		
		User member = userService.findOne(memberId);
		
		if (member.getTeam().getId() != currentUser.getTeam().getId() || !Objects.equals(currentUser.getTeam().getMaster().getUsername(), currentUser.getUsername())) {
			return "error";
		}
		
		if (Objects.equals(memberId, currentUser.getId())) {
			return "无法禁用自己。";
		}
		
		member.setStatus(enable ? UserStatus.normal : UserStatus.blocked);
		userService.update(member);
		
		return "success";
	}
	
	/**
	 * 所有RequestMapping方法调用前的Model准备方法, 实现Struts2 Preparable二次部分绑定的效果,先根据form的id从数据库查出Task对象,再把Form提交的内容绑定到该对象上。
	 * 因为仅update()方法的form中有id属性，因此仅在update时实际执行.
	 */
	@Override
	@ModelAttribute
	public void getEntity(@RequestParam(value = "id", defaultValue = "-1") Long id, Model model) {
		if (!id.toString().equals("-1")) {
			try {
				model.addAttribute("entity", BeanUtils.cloneBean(baseService.findOne(id)));
			} catch (Exception e) {
			
			}
			
		} else {
			WorkGroup workGroup = new WorkGroup();
			Team team = new Team();
			team.setId(ShiroUserInfoUtils.getTeamId());
			workGroup.setTeam(team);
			model.addAttribute("entity", workGroup);
		}
	}
	
	
	@RequestMapping(value = "checkGroupName")
	@ResponseBody
	public String checkTeamName(@RequestParam("oldName") String oldName,
	                            @RequestParam("name") String name) {
		if (name.equals(oldName)) {
			return "true";
		} else if (workGroupService.checkTeamWorkGroup(name, ShiroUserInfoUtils.getTeamId()) == null) {
			return "true";
		}
		
		return "false";
	}
	
}
