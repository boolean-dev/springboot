package com.hztuen.dao.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.hztuen.dao.${objectName}Dao;
import com.hztuen.entity.${objectName};

/**
 * Dao - 管理员
 */
@Repository("${objectNameLower}DaoImpl")
public class ${objectName}DaoImpl extends BaseDaoImpl<${objectName}> implements ${objectName}Dao {

	@Override
	public ${objectName} find(String mapper, Map<String, Object> parameters) throws Exception {
		return super.find(mapper, parameters);
	}

	public ${objectName} find(Long id) throws Exception {
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("id", id);
		return super.find("${objectName}Mapper.findById", parameters);
	}
	
}