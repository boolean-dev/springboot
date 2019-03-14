package com.tao.springboot.dao.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.tao.springboot.dao.BaseDao;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("daoSupport")
public abstract class BaseDaoImpl<T> implements BaseDao<T> {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public T save(String str, T entity) throws Exception {
		sqlSessionTemplate.insert(str, entity);
		return entity;
	}

	public List<T> save(String str, List<T> entitys) throws Exception {
		sqlSessionTemplate.insert(str, entitys);
		return entitys;
	}
	
	@Override
	public int save(String str, Map<String, Object> parameter) throws Exception {
		return sqlSessionTemplate.insert(str, parameter);		
	}

	@Override
	public int update(String mapper, Map<String, Object> parameter) throws Exception {
		return sqlSessionTemplate.update(mapper, parameter);
	}
	
	@Override
	public T update(String str, T entity) throws Exception {
		sqlSessionTemplate.update(str, entity);
		return entity;
	}
	
	@Override
	public int delete(String mapper, String id) throws Exception {
		return sqlSessionTemplate.delete(mapper, id);
	}

	@Override
	public int delete(String str, String[] ids) throws Exception {
		return sqlSessionTemplate.delete(str, ids);
	}
	
	@Override
	public int delete(String mapper, Map<String, Object> parameter) throws Exception {
		return sqlSessionTemplate.delete(mapper, parameter);
	}
	
	@Override
	public T find(String str, Map<String,Object> parameter) throws Exception {
		return sqlSessionTemplate.selectOne(str, parameter);
    }
	
	@Override
	public Object findObj(String str, Map<String,Object> parameter) throws Exception {
		return sqlSessionTemplate.selectOne(str, parameter);
    }
	
	@Override
	public Long count(String str, Map<String,Object> parameter) throws Exception {
		Long count = sqlSessionTemplate.selectOne(str, parameter);
		if(count == null){
			return 0L;
		}else{
			return count;
		}
    }
	
	@Override
	public Double sum(String str, Map<String, Object> parameter) throws Exception{
		Double sum = sqlSessionTemplate.selectOne(str, parameter);
		if(sum == null){
			return 0.0;
		}else{
			return sum;
		}
	}
    
    @Override
	public List<T> findList(String str, Map<String,Object> parameter) throws Exception {
        return sqlSessionTemplate.selectList(str, parameter);
    }
    
    @Override
	public List<Object> findObjList(String str, Map<String,Object> parameter) throws Exception {
        return sqlSessionTemplate.selectList(str, parameter);
    }

    @Override
	public Map<String,Map<String,String>> findMap(String mapper, Map<String,Object> parameter, String mapKey) throws Exception {
        return sqlSessionTemplate.selectMap(mapper, parameter, mapKey);
    }

	@Override
	public List<String> findRe(String str, List<String> list) throws Exception {
		 return sqlSessionTemplate.selectList(str, list);
	}

}

