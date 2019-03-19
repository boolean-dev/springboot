package com.tao.springboot.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public abstract class BaseEntity implements Serializable {

	protected static final long serialVersionUID = 1L;

	protected static GlobalId globalId = new GlobalId(0L, 0L);
	
	/** ID */
	protected String id;

	/** 创建日期 */
	protected Date createDate;

	/** 修改日期 */
	protected Date modifyDate;

	/** 排序索引 */
	protected Long orders;

}
