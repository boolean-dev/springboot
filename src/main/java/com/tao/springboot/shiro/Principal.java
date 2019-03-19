/*
 * 
 * 
 * 
 */
package com.tao.springboot.shiro;

import lombok.Data;
import lombok.ToString;

import java.io.Serializable;

/**
 * 身份信息
 * 
 * 
 * 
 */
@Data
@ToString
public class Principal implements Serializable {

	private static final long serialVersionUID = 5798882004228239559L;

	/** ID */
	private String id;

	/** 用户名 */
	private String username;

	public Principal(String id, String username) {
		this.id = id;
		this.username = username;
	}
}