/*
 * 
 * 
 * 
 */
package com.tao.springboot.dao;

import com.tao.springboot.entity.Authority;

import java.util.List;

/**
 * Dao - 权限
 * 
 * 
 * 
 */
public interface AuthorityDao extends BaseDao<Authority> {
	
	void saveAuthorities(List<Authority> authorities) throws Exception;
	
}