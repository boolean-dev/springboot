package com.hztuen.entity;

import org.apache.ibatis.type.Alias;
import java.math.BigDecimal;

@Alias("${objectName}")
public class ${objectName} extends BaseEntity {

	private static final long serialVersionUID = 1L;
	
	<#list params as param>
	/** ${param.memo} */
	private ${param.type} ${param.name};
	
	</#list>
}
