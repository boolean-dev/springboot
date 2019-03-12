/*
 * 
 * 
 * 
 */
package com.tao.springboot.dao.impl;

import com.tao.springboot.dao.RoleDao;
import com.tao.springboot.entity.Role;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.Map;

/**
 * Dao - 角色
 * 
 * 
 * 
 */
@Repository("roleDaoImpl")
public class RoleDaoImpl extends BaseDaoImpl<Role> implements RoleDao {
	
	@Override
	public Role find(String mapper, Map<String, Object> parameters) throws Exception {
		return super.find(mapper, parameters);
	}

	@Override
	public Role find(String id) throws Exception {
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("id", id);
		return super.find("RoleMapper.findById", parameters);
	}
	

}