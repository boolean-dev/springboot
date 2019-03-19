/*
 * 
 * 
 * 
 */
package com.tao.springboot.dao.impl;

import com.tao.springboot.dao.AuthorityDao;
import com.tao.springboot.entity.Authority;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Dao - 权限
 * 
 * 
 * 
 */
@Repository("authorityDaoImpl")
public class AuthorityDaoImpl extends BaseDaoImpl<Authority> implements AuthorityDao {
	
	@Override
	public Authority find(String mapper, Map<String, Object> parameters) throws Exception {
		return super.find(mapper, parameters);
	}

		
	@Override
	public void saveAuthorities(List<Authority> authorities) throws Exception {
		super.save("RoleMapper.saveAuthorities", authorities);
	}

}