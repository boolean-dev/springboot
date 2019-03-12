/*
 * 
 * 
 * 
 */
package com.tao.springboot.dao;


import com.tao.springboot.entity.AdminRole;

import java.util.List;

/**
 * Dao - 管理员-角色
 * 
 * 
 * 
 */
public interface AdminRoleDao extends BaseDao<AdminRole> {
	
	void saveRoles(List<AdminRole> roles) throws Exception;
	
}