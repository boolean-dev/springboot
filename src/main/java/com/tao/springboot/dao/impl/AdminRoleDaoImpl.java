/*
 * 
 * 
 * 
 */
package com.tao.springboot.dao.impl;

import com.tao.springboot.dao.AdminRoleDao;
import com.tao.springboot.entity.AdminRole;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Dao - 权限
 * 
 * 
 * 
 */
@Repository("adminRoleDaoImpl")
public class AdminRoleDaoImpl extends BaseDaoImpl<AdminRole> implements AdminRoleDao {
	
	@Override
	public AdminRole find(String mapper, Map<String, Object> parameters) throws Exception {
		return super.find(mapper, parameters);
	}

		
	@Override
	public void saveRoles(List<AdminRole> roles) throws Exception {
		super.save("AdminMapper.saveRoles", roles);
	}

}