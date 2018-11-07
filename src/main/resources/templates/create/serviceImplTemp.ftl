/*
 * 
 * 
 * 
 */
package com.hztuen.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hztuen.Page;
import com.hztuen.Pageable;
import com.hztuen.dao.${objectName}Dao;
import com.hztuen.entity.${objectName};
import com.hztuen.service.${objectName}Service;

/**
 * Service - ${memo}
 */
@Service("${objectNameLower}ServiceImpl")
public class ${objectName}ServiceImpl extends BaseServiceImpl<${objectName}> implements ${objectName}Service {

	@Resource(name = "${objectNameLower}DaoImpl")
	private ${objectName}Dao ${objectNameLower}Dao;

	@Resource(name = "${objectNameLower}DaoImpl")
	public void setBaseDao(${objectName}Dao ${objectNameLower}Dao) {
		super.setBaseDao(${objectNameLower}Dao);
	}
	
	public ${objectName} save(${objectName} ${objectNameLower}) throws Exception {
		return ${objectNameLower}Dao.save("${objectName}Mapper.save", ${objectNameLower});
	}
	
	public ${objectName} update(${objectName} ${objectNameLower}) throws Exception {
		return ${objectNameLower}Dao.update("${objectName}Mapper.update", ${objectNameLower});
	}
	
	public int delete(Long[] ids) throws Exception {
		return ${objectNameLower}Dao.delete("${objectName}Mapper.deleteAll", ids);
	}

	public ${objectName} findById(Long id) throws Exception {
		return ${objectNameLower}Dao.find(id);
	}

	public Page<${objectName}> findPage(Pageable pageable) throws Exception {
		
		int pageNumber = pageable.getPageNumber();
		int pageSize = pageable.getPageSize();
		int startIndex = (pageNumber - 1) * pageSize;

		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("startIndex", startIndex);
		parameters.put("pageSize", pageSize);
		parameters.put(pageable.getSearchProperty(), pageable.getSearchValue());
		if(pageable.getFilter() != null){
			parameters.putAll(pageable.getFilter());
		}
		
		List<${objectName}> ${objectNameLower}s = ${objectNameLower}Dao.findList("${objectName}Mapper.findPage", parameters);
		if(${objectNameLower}s == null || ${objectNameLower}s.size() == 0){
			return new Page<${objectName}>(${objectNameLower}s, 0, pageable);
		}else{
			return new Page<${objectName}>(${objectNameLower}s, ${objectNameLower}Dao.count("${objectName}Mapper.count", parameters), pageable);
		}
	}
}