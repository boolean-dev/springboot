/*
 * 
 * 
 * 
 */
package com.tao.springboot.service;


import com.tao.springboot.Page;
import com.tao.springboot.Pageable;
import com.tao.springboot.entity.Role;

import java.util.List;

/**
 * Service - 角色
 * 
 * 
 * 
 */
public interface RoleService extends BaseService<Role> {
	
	Role save(Role role) throws Exception;

	Page<Role> findPage(Pageable pageable) throws Exception;
	
	int delete(String[] ids) throws Exception;
	
	Role findById(String id) throws Exception;
	
	Role update(Role role) throws Exception;
	
	List<Role> findAll() throws Exception;
	
	List<Role> findList(String adminId) throws Exception;
}