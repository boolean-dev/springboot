/*
 * 
 * 
 * 
 */
package com.tao.springboot.service;

import com.tao.springboot.entity.AdminRole;

import java.util.List;

/**
 * Service - 权限
 * 
 * 
 * 
 */
public interface AdminRoleService extends BaseService<AdminRole> {

	void saveRoles(List<AdminRole> roles) throws Exception;
	
	void deleteRoles(String id) throws Exception;

}