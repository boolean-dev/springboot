package com.tao.springboot.entity;

import org.apache.ibatis.type.Alias;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Admin-管理员
 * @version: v1.0
 * @Description: @TODO
 * @author: yanjiantao
 * @date: 2018-11-26 23:30:03
 */
@Alias("Admin")
public class Admin extends BaseEntity {

	private static final long serialVersionUID = 1L;
	
	/** 用户名 */
	private String username;
	
	/** 密码MD5形式 */
	private String password;
	
	/** 邮件 */
	private String email;
	
	/** 姓名 */
	private String name;
	
	/** 部门 */
	private String department;
	
	/** 登录失败次数 */
	private Integer loginFailureCount;
	
	/** 是否锁定 */
	private Boolean isLocked;
	
	/** 锁定日期 */
	private Date lockedDate;
	
	/** 登录日期 */
	private Date loginDate;
	
	/** 登录IP */
	private String loginIp;
	
}
