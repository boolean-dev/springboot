/*
 * 
 * 
 * 
 */
package com.tao.springboot.service;

import com.tao.springboot.entity.Authority;

import java.util.List;

/**
 * Service - 权限
 * 
 * 
 * 
 */
public interface AuthorityService extends BaseService<Authority> {

	void saveAuthorities(List<Authority> authorities) throws Exception;
	
	void deleteAuthorities(String id) throws Exception;

}