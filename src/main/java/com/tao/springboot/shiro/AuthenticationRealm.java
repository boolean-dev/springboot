package com.tao.springboot.shiro;

import com.tao.springboot.entity.Admin;
import com.tao.springboot.service.AdminService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * 权限认证
 * 
 * 
 * 
 */
public class AuthenticationRealm extends AuthorizingRealm {

	@Resource(name = "adminServiceImpl")
	private AdminService adminService;

	/**
	 * 获取认证信息
	 * 用户认证
	 * 
	 * @param token
	 *            令牌
	 * @return 认证信息
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) {

		UsernamePasswordToken usernamePasswordToken = (UsernamePasswordToken) token;
		String username = usernamePasswordToken.getUsername();
		String password = null;
		if (usernamePasswordToken.getPassword() != null) {
			password = new String(usernamePasswordToken.getPassword());
		}

		if (username != null && password != null) {
			Admin admin = null;
			try {
				admin = adminService.findByUsername(username);
			} catch (Exception e) {
				e.printStackTrace();
			}
			if (admin == null) {
				throw new UnknownAccountException();
			}
			if (admin.getIsLocked() == true) {
				throw new DisabledAccountException();
			}
			if (!password.equals(admin.getPassword())) {

				int loginFailureCount = admin.getLoginFailureCount() + 1;
				if (loginFailureCount >= 10) {
					admin.setIsLocked(true);
					admin.setLockedDate(new Date());
				}
				admin.setLoginFailureCount(loginFailureCount);
				// adminService.update(mapper, entity);
				throw new IncorrectCredentialsException();
			}
			// admin.setLoginIp(ip);
			// admin.setLoginDate(new Date());
			// admin.setLoginFailureCount(0);
			// adminService.update(admin);
			return new SimpleAuthenticationInfo(new Principal(admin.getId(), username), password, getName());
		}
		throw new UnknownAccountException();
	}

	/**
	 * 获取授权信息
	 * 用户角色权限和用户权限
	 *
	 * 执行认证逻辑
	 * @param principals
	 *            principals
	 * @return 授权信息
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		Principal principal = (Principal) principals.fromRealm(getName()).iterator().next();
		if (principal != null) {
			List<String> authorities = null;
			try {
				authorities = adminService.findAuthorities(principal.getId());
			} catch (Exception e) {
				e.printStackTrace();
			}
			if (authorities != null) {
				SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
				authorizationInfo.addStringPermissions(authorities);
				return authorizationInfo;
			}
		}
		return null;
	}

}