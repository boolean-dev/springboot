/*
 * 
 * 
 * 
 */
package com.hztuen.service;

import com.hztuen.Page;
import com.hztuen.Pageable;
import com.hztuen.entity.${objectName};

/**
 * Service - ${memo}
 */
public interface ${objectName}Service extends BaseService<${objectName}> {
	
	${objectName} findById(Long id) throws Exception;

	Page<${objectName}> findPage(Pageable pageable) throws Exception;
	
	${objectName} save(${objectName} ${objectNameLower}) throws Exception;
	
	${objectName} update(${objectName} ${objectNameLower}) throws Exception;
	
}