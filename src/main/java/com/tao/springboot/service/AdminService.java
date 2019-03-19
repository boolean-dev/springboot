package com.tao.springboot.service;

import com.tao.springboot.Page;
import com.tao.springboot.Pageable;
import com.tao.springboot.entity.Admin;
import com.tao.springboot.entity.Role;

import java.util.List;

/**
 * AdminService-管理员
 * @version: v1.0
 * @Description: 管理员
 * @author: yanjiantao
 * @date: 2018-12-03 09:54:02
 */
public interface AdminService extends BaseService<Admin> {

	Admin findById(String id) throws Exception;

	Page<Admin> findPage(Pageable pageable) throws Exception;

	Admin save(Admin admin,String[] ids) throws Exception;

	Admin update(Admin admin,String[] ids) throws Exception;

	/**
	 * 判断用户名是否存在
	 *
	 * @param username
	 *            用户名(忽略大小写)
	 * @return 用户名是否存在
	 */
	boolean usernameExists(String username);

	/**
	 * 根据用户名查找管理员
	 *
	 * @param username
	 *            用户名(忽略大小写)
	 * @return 管理员，若不存在则返回null
	 * @throws Exception
	 */
	Admin findByUsername(String username) throws Exception;

	/**
	 * 根据ID查找权限
	 *
	 * @param id
	 *            ID
	 * @return 权限,若不存在则返回null
	 * @throws Exception
	 */
	List<String> findAuthorities(String id) throws Exception;

	/**
	 * 判断管理员是否登录
	 *
	 * @return 管理员是否登录
	 */
	boolean isAuthenticated();

	/**
	 * 获取当前登录管理员
	 *
	 * @return 当前登录管理员,若不存在则返回null
	 * @throws Exception
	 */
	Admin getCurrent() throws Exception;

	/**
	 * 获取当前登录用户名
	 *
	 * @return 当前登录用户名,若不存在则返回null
	 */
	String getCurrentUsername();

	List<Role> findRoles(String principalId) throws Exception;
}