
package com.hztuen.dao;

import com.hztuen.entity.${objectName};


/**
 * Dao - ${memo}
 */
public interface ${objectName}Dao extends BaseDao<${objectName}> {

	/**
	 * 根据id查找${memo}
	 * 
	 * @param id ${memo}id
	 * @return 若不存在则返回null
	 * @throws Exception 
	 */
	${objectName} find(Long id) throws Exception;

}