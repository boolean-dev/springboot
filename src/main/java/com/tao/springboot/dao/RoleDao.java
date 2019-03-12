/*
 * 
 * 
 * 
 */
package com.tao.springboot.dao;


import com.tao.springboot.entity.Role;

/**
 * Dao - 角色
 * 
 * 
 * 
 */
public interface RoleDao extends BaseDao<Role> {
	
	Role find(String id) throws Exception;
}