/*
 * 
 * 
 * 
 */
package com.tao.springboot.service.impl;

import com.tao.springboot.dao.AuthorityDao;
import com.tao.springboot.entity.Authority;
import com.tao.springboot.service.AuthorityService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Service - 权限
 * 
 * 
 * 
 */
@Service("authorityServiceImpl")
public class AuthorityServiceImpl extends BaseServiceImpl<Authority> implements AuthorityService {

	@Resource(name = "authorityDaoImpl")
	private AuthorityDao authorityDao;
	
	public void setBaseDao(AuthorityDao authorityDao) {
		super.setBaseDao(authorityDao);
	}

	@Override
	public int delete(String[] ids) throws Exception {
		return 0;
	}

	@Override
	public void saveAuthorities(List<Authority> authorities) throws Exception {
		authorityDao.saveAuthorities(authorities);
	}
	
	@Override
	public void deleteAuthorities(String id) throws Exception {
		authorityDao.delete("RoleMapper.deleteAuthorities", id);
	}

	

}