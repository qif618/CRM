package com.lyf.basic.dao;

import java.util.List;
import java.util.Map;

import com.lyf.basic.model.Pager;

public interface IBaseDao<T> {
	/**
	 * 添加一个对象
	 * @param t
	 * @return
	 */
	public T add(T t);
	/**
	 * 删除一个对象
	 * @param t
	 */
	public void update(T t);
	/**
	 * 根据id删除
	 * @param id
	 */
	public void delete(int id);
	/**
	 * 根据id查询
	 * @param id
	 * @return
	 */
	public T load(int id);
	public T get(int id);
	/**
	 * 根据HQL查询符合条件的所有LIST
	 * @param hql
	 * @param args
	 * @return
	 */
	public List<T> list(String hql, Object[] args);
	public List<T> list(String hql, Object arg);
	public List<T> list(String hql);
	public List<T> listByAlias(String hql, Map<String, Object> alias);
	public List<T> list(String hql, Object[] args, Map<String, Object> alias);
	
	/**
	 * 根据hql分页查询
	 * @param hql
	 * @param args
	 * @return
	 */
	public Pager<T> find(String hql, Object[] args);
	public Pager<T> find(String hql, Object args);
	public Pager<T> find(String hql);
	public Pager<T> findByAlias(String hql,Map<String,Object> alias);
	public Pager<T> find(String hql,Object[] args,Map<String,Object> alias);
	
	/**
	 * 查询一条object数据
	 * @param hql
	 * @param args
	 * @return
	 */
	public Object queryObject(String hql, Object[] args);
	public Object queryObject(String hql, Object arg);
	public Object queryObject(String hql);
	public Object queryObjectByAlias(String hql, Map<String, Object> alias);
	public Object queryObject(String hql, Object[] args,Map<String, Object> alias);
	
	/**
	 * 根据hql更新对象
	 * @param hql
	 * @param args
	 */
	public void updateByHql(String hql, Object[] args);
	public void updateByHql(String hql, Object args);
	public void updateByHql(String hql);
	
	public <N extends Object>List<N> listBySql(String sql, Object[] args, Class<?> clz,boolean hasEntity);
	public <N extends Object>List<N> listBySql(String sql, Object arg, Class<?> clz,boolean hasEntity);
	public <N extends Object>List<N> listBySql(String sql, Class<?> clz, boolean hasEntity);
	public <N extends Object>List<N> listByAliasSql(String sql, Map<String, Object> alias,Class<?> clz, boolean hasEntity);
	public <N extends Object>List<N> listBySql(String sql, Object[] args,Map<String, Object> alias, Class<?> clz, boolean hasEntity);
	
	public <N extends Object>Pager<N> findBySql(String sql, Object[] args, Class<?> clz,boolean hasEntity);
	public <N extends Object>Pager<N> findBySql(String sql, Object arg, Class<?> clz,boolean hasEntity);
	public <N extends Object>Pager<N> findBySql(String sql, Class<?> clz, boolean hasEntity);
	public <N extends Object>Pager<N> findByAliasSql(String sql, Map<String, Object> alias,	Class<?> clz, boolean hasEntity);
	public <N extends Object>Pager<N> findBySql(String sql, Object[] args,Map<String, Object> alias, Class<?> clz, boolean hasEntity);
		
	
	public List<Map<String,Object>> listContainsMap(String sql);
	public List<Map<String, Object>> listContainsMap(String sql,Object[] args);
	public List<Map<String, Object>> listContainsMap(String sql,String arg);
}
		
















