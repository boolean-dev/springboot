package com.tao.springboot.entity;

import lombok.Data;
import org.apache.ibatis.type.Alias;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Admin-管理员
 * @version: v1.0
 * @Description: 管理员
 * @author: yanjiantao
 * @date: 2018-12-03 09:54:02
 */
@Alias("Admin")
@Data
public class Admin extends BaseEntity {

	private static final long serialVersionUID = 1L;

	private String username;// 用户名
	private String password;// 密码
	private String email;// E-mail
	private String name;// 姓名
	private String department;// 部门
	private Integer loginFailureCount;// 连续登录失败次数
	private Boolean isLocked;// 是否锁定
	private Date lockedDate;// 锁定日期
	private Date loginDate;// 最后登录日期
	private String loginIp;// 最后登录IP
	private String headImgUrl;// 头像地址
	private List<Role> roles = new ArrayList<Role>();//角色
	

    public void buildId() {
        this.id = "CR" + globalId.nextId();
    }


}
