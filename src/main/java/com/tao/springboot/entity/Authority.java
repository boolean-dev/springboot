package com.tao.springboot.entity;

import lombok.Data;

@Data
public class Authority {
	
	private String role;
	
	private String authorities;
	
	public Authority(){};
	
	public Authority(String id, String authorities) {
		this.role = id;
		this.authorities = authorities;
	}


}
