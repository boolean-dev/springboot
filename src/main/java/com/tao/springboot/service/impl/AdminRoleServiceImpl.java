/*
 * 
 * 
 * 
 */
package com.tao.springboot.service.impl;

import com.tao.springboot.dao.AdminRoleDao;
import com.tao.springboot.entity.AdminRole;
import com.tao.springboot.service.AdminRoleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Service - 权限
 * 
 * 
 * 
 */
@Service("adminRoleServiceImpl")
public class AdminRoleServiceImpl extends BaseServiceImpl<AdminRole> implements AdminRoleService {

	@Resource(name = "adminRoleDaoImpl")
	private AdminRoleDao adminRoleDao;
	
	public void setBaseDao(AdminRoleDao adminRoleDao) {
		super.setBaseDao(adminRoleDao);
	}


	@Override
	public void saveRoles(List<AdminRole> roles) throws Exception {
		if(roles.isEmpty()){
			return;
		}
		adminRoleDao.saveRoles(roles);
	}
	
	@Override
	public void deleteRoles(String id) throws Exception {
		adminRoleDao.delete("AdminMapper.deleteRoles", id);
	}


	@Override
	public int delete(String[] ids) throws Exception {
		return 0;
	}
}