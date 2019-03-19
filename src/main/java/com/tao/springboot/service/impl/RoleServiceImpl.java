/*
 * 
 * 
 * 
 */
package com.tao.springboot.service.impl;

import com.tao.springboot.Page;
import com.tao.springboot.Pageable;
import com.tao.springboot.dao.AuthorityDao;
import com.tao.springboot.dao.RoleDao;
import com.tao.springboot.entity.Authority;
import com.tao.springboot.entity.Role;
import com.tao.springboot.service.RoleService;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Service - 角色
 * 
 * 
 * 
 */
@Service("roleServiceImpl")
public class RoleServiceImpl extends BaseServiceImpl<Role> implements RoleService {

	@Resource(name = "roleDaoImpl")
	private RoleDao roleDao;
	@Resource(name = "authorityDaoImpl")
	private AuthorityDao authorityDao;
	
	public void setBaseDao(RoleDao roleDao) {
		super.setBaseDao(roleDao);
	}

	@Override
	@CacheEvict(value="authorities",allEntries=true)
	public int delete(String[] ids) throws Exception {
		//删除角色拥有的权限
		roleDao.delete("RoleMapper.deleteAuthorities", ids);
		//删除角色与后台用户之间的关联
		roleDao.delete("RoleMapper.deleteRoles", ids);
		//删除角色
		return roleDao.delete("RoleMapper.deleteAll", ids);
	}
	
	@Override
	@CacheEvict(value="authorities",allEntries=true)
	public Role save(Role role) throws Exception {
		role = roleDao.save("RoleMapper.save", role);
		if (!role.getAuthorities().isEmpty()) {
			List<Authority> authorities = new ArrayList<Authority>();
			for (String str : role.getAuthorities()) {
				Authority authority = new Authority(role.getId(), str);
				authorities.add(authority);
			}
			authorityDao.saveAuthorities(authorities);
		}
		
		return role;
	}
	
	@Override
	@CacheEvict(value="authorities",allEntries=true)
	public Role update(Role role) throws Exception {
		authorityDao.delete("RoleMapper.deleteAuthorities",
				new String[] { role.getId() });
		if (!role.getAuthorities().isEmpty()) {
			List<Authority> authorities = new ArrayList<Authority>();
			for (String str : role.getAuthorities()) {
				Authority authority = new Authority(role.getId(), str);
				authorities.add(authority);
			}
			authorityDao.saveAuthorities(authorities);
		}
		
		return roleDao.update("RoleMapper.update", role);
	}
	
	

	@Override
	public Role findById(String id) throws Exception {
		return roleDao.find(id);
	}
	
	@Override
	public List<Role> findAll() throws Exception {
		return roleDao.findList("RoleMapper.findAll", null);
	}
	
	@Override
	public List<Role> findList(String adminId) throws Exception {
		Map<String,Object> parameter = new HashMap<String, Object>();
		parameter.put("id", adminId);
		return roleDao.findList("RoleMapper.findRoles", parameter);
	}

	@Override
	public Page<Role> findPage(Pageable pageable) throws Exception {
		
		int pageNumber = pageable.getPageNumber();
		int pageSize = pageable.getPageSize();
		int startIndex = (pageNumber - 1) * pageSize;

		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("startIndex", startIndex);
		parameters.put("pageSize", pageSize);
		parameters.put(pageable.getSearchProperty(), pageable.getSearchValue());
		
		List<Role> roles = roleDao.findList("RoleMapper.findPage", parameters);
		return new Page<Role>(roles, roles.size(), pageable);
	}

	

}