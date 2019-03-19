/*
 * 
 * 
 * 
 */
package com.tao.springboot.entity;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

/**
 * Entity - 角色
 * 
 * 
 * 
 */
@Data
public class Role extends BaseEntity {

	private static final long serialVersionUID = -6614052029623997372L;

	/** 名称 */
	private String name;

	/** 是否内置 */
	private Boolean isSystem;

	/** 描述 */
	private String description;

	/** 权限 */
	private List<String> authorities = new ArrayList<String>();

}