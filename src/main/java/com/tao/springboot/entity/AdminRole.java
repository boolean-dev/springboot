package com.tao.springboot.entity;

import lombok.Data;

@Data
public class AdminRole {
	
	private String admins;
	
	private String roles;
	
	public AdminRole(){};

	public AdminRole(String admins, String roles) {
		this.admins = admins;
		this.roles = roles;
	}
}
