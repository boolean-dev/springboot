package com.tao.springboot.configuration;

import com.tao.springboot.shiro.AuthenticationFilter;
import com.tao.springboot.shiro.AuthenticationRealm;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.filter.authc.LogoutFilter;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.servlet.Filter;
import java.util.LinkedHashMap;
import java.util.Map;

@Configuration
public class ShiroConfig {

	/**
	 * shiro拦截器
	 * 配置相对应的过滤条件和跳转条件
	 * @return
	 */
	@Bean(name = "shiroFilter")
	public ShiroFilterFactoryBean shiroFilterFactoryBean(){
		
		ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
		shiroFilterFactoryBean.setSecurityManager(securityManager());
		
		Map<String, Filter> filters = new LinkedHashMap<String, Filter>();
		LogoutFilter logoutFilter = new LogoutFilter();
		AuthenticationFilter authenticationFilter = new AuthenticationFilter();
		logoutFilter.setRedirectUrl("/admin/login");
		filters.put("logout", logoutFilter);
		filters.put("authenticationFilter", authenticationFilter);
		shiroFilterFactoryBean.setFilters(filters);

		/**
		 * 设置放行路径
		 */
		Map<String, String> filterChainDefinitionManager = new LinkedHashMap<String, String>();
		filterChainDefinitionManager.put("/admin/login", "anon");
		filterChainDefinitionManager.put("/admin/captcha", "anon");
		filterChainDefinitionManager.put("/admin/checkLogin", "anon");
		filterChainDefinitionManager.put("/admin/**", "authc");
		filterChainDefinitionManager.put("/admin/logout", "logout");
		shiroFilterFactoryBean.setFilterChainDefinitionMap(filterChainDefinitionManager);

		/**
		 * 设置登录路径
		 */
		shiroFilterFactoryBean.setLoginUrl("/admin/login");
		shiroFilterFactoryBean.setSuccessUrl("/admin/index");
		shiroFilterFactoryBean.setUnauthorizedUrl("/main/unauthorized");
		
		return shiroFilterFactoryBean;
	}

	/**
	 * 权限管理
	 * 配置主要是Realm的管理认证
	 * @return
	 */
	@Bean(name = "securityManager")
	public DefaultWebSecurityManager securityManager(){
		DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();		
		AuthenticationRealm realm = authenticationRealm();
		securityManager.setRealm(realm);
		return securityManager;
	}

	/**
	 * 将自己的shiro验证器方法加入容器
	 * @return
	 */
	@Bean(name = "authenticationRealm")
	public AuthenticationRealm authenticationRealm(){
		return new AuthenticationRealm();
	}
}
