package com.tao.springboot.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.tao.springboot.entity.AdminRole;
import com.tao.springboot.entity.Role;
import com.tao.springboot.service.AdminRoleService;
import com.tao.springboot.service.RoleService;
import com.tao.springboot.shiro.Principal;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.tao.springboot.Page;
import com.tao.springboot.Pageable;
import com.tao.springboot.dao.AdminDao;
import com.tao.springboot.entity.Admin;
import com.tao.springboot.service.AdminService;

/**
 * AdminServiceImpl-管理员
 * @version: v1.0
 * @Description: 管理员
 * @author: yanjiantao
 * @date: 2018-12-03 09:54:02
 */
@Service("adminServiceImpl")
public class AdminServiceImpl extends BaseServiceImpl<Admin> implements AdminService {

	@Resource(name = "adminDaoImpl")
	private AdminDao adminDao;

	@Resource(name = "adminDaoImpl")
	public void setBaseDao(AdminDao adminDao) {
		super.setBaseDao(adminDao);
	}

	@Resource(name = "adminRoleServiceImpl")
	private AdminRoleService adminRoleService;

	@Resource(name = "roleServiceImpl")
	private RoleService roleService;

	@Override
	public Admin save(Admin admin, String[] ids) throws Exception {
		admin = adminDao.save("AdminMapper.save", admin);
		if(ids != null){
			List<AdminRole> adminRoles = new ArrayList<AdminRole>();
			for (String id : ids) {
				AdminRole adminRole = new AdminRole(admin.getId(), id);
				adminRoles.add(adminRole);
			}
			adminRoleService.saveRoles(adminRoles);
		}

		return admin;
	}

	@Override
	@CacheEvict(value="authorities",allEntries = true)
	public Admin update(Admin admin, String[] ids) throws Exception {
		adminRoleService.deleteRoles(admin.getId());
		if(ids != null){
			List<AdminRole> adminRoles = new ArrayList<AdminRole>();
			for (String id : ids) {
				AdminRole adminRole = new AdminRole(admin.getId(), id);
				adminRoles.add(adminRole);
			}
			adminRoleService.saveRoles(adminRoles);
		}

		return adminDao.update("AdminMapper.update", admin);
	}

	@Override
	public int delete(String[] ids) throws Exception {
		adminDao.delete("AdminMapper.deleteRolesByAdmin", ids);
		return adminDao.delete("AdminMapper.deleteAll", ids);
	}

	@Override
	public Admin findById(String id) throws Exception {
		return adminDao.find(id);
	}

	@Override
	public Admin findByUsername(String username) throws Exception {
		return adminDao.findByUserName(username);
	}

	@Override
	public boolean usernameExists(String username) {
		return false;
	}
	@Override
	@Cacheable(value="authorities")
	public List<String> findAuthorities(String principalId) throws Exception {
		List<String> authorities = new ArrayList<String>();
		if (principalId != null) {
			List<Role> roles = findRoles(principalId);
			for (Role role : roles) {
				authorities.addAll(role.getAuthorities());
			}
		}
		return authorities;
	}

	@Override
	public List<Role> findRoles(String principalId) throws Exception {
		List<Role> roles = new ArrayList<Role>();
		Admin admin = adminDao.find(principalId);
		if (admin != null) {
			roles = roleService.findList(admin.getId());
		}
		return roles;
	}

	@Override
	public boolean isAuthenticated() {
		return false;
	}

	@Override
	public Admin getCurrent() throws Exception {
		Subject subject = SecurityUtils.getSubject();
		if (subject != null) {
			Principal principal = (Principal) subject.getPrincipal();
			if (principal != null) {
				return adminDao.find(principal.getId());
			}
		}
		return null;
	}

	@Override
	public String getCurrentUsername() {
		Subject subject = SecurityUtils.getSubject();
		if (subject != null) {
			Principal principal = (Principal) subject.getPrincipal();
			if (principal != null) {
				return principal.getUsername();
			}
		}
		return null;
	}

	@Override
	public Page<Admin> findPage(Pageable pageable) throws Exception {

		int pageNumber = pageable.getPageNumber();
		int pageSize = pageable.getPageSize();
		int startIndex = (pageNumber - 1) * pageSize;

		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("startIndex", startIndex);
		parameters.put("pageSize", pageSize);
		parameters.put(pageable.getSearchProperty(), pageable.getSearchValue());

		List<Admin> admins = adminDao.findList("AdminMapper.findPage", parameters);
		if (admins == null || admins.size() == 0) {
			return new Page<Admin>(null, 0, pageable);
		} else {
			return new Page<Admin>(admins, adminDao.count("AdminMapper.count", null), pageable);
		}
	}
}