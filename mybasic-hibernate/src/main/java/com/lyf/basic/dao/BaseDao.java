package com.lyf.basic.dao;

import java.lang.reflect.ParameterizedType;
import java.math.BigInteger;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;

import com.lyf.basic.model.Pager;
import com.lyf.basic.model.SystemContext;
@SuppressWarnings("unchecked")

public class BaseDao<T> implements IBaseDao<T>{
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}


	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}


	private Class<?> clz;
	
	public Class<?> getClz() {
		if(clz==null) {
			clz = ((Class<?>)
					(((ParameterizedType)(this.getClass().getGenericSuperclass())).getActualTypeArguments()[0]));
		}
		return clz;
	}
	
	
	public T add(T t) {
		getSession().save(t);
		return  t;
	}
	
	public void update(T t) {
		getSession().update(t);
	}

	public void delete(int id) {
		getSession().delete(load(id));
	}

	
	public T load(int id) {
		return (T) getSession().load(getClz(), id);
	}
	
	public T get(String id){
		return (T) getSession().get(getClz(), id);
	}
	
	private String initSort(String hql) {
		String order = SystemContext.getOrder();
		String sort = SystemContext.getSort();
		if(sort!=null&&!"".equals(sort.trim())) {
			hql+=" order by "+sort;
			if(!"desc".equals(order)) hql+=" asc";
			else hql+=" desc";
		}
		return hql;
	}
	
	@SuppressWarnings("rawtypes")
	private void setAliasParameter(Query query,Map<String,Object> alias) {
		if(alias!=null) {
			Set<String> keys = alias.keySet();
			for(String key:keys) {
				Object val = alias.get(key);
				if(val instanceof Collection) {
					//如果val是一个collection
					query.setParameterList(key, (Collection)val);
				} else {
					query.setParameter(key, val);
				}
			}
		}
	}
	
	private void setParameter(Query query,Object[] args) {
		if(args!=null&&args.length>0) {
			int index = 0;
			for(Object arg:args) {
				query.setParameter(index++, arg);
			}
		}
	}

	/**
	 * 根据hql查询所有符合条件的LIST
	 */
	public List<T> list(String hql, Object[] args) {
		return this.list(hql, args, null);
	}

	public List<T> list(String hql, Object arg) {
		return this.list(hql, new Object[]{arg}, null);
	}

	public List<T> list(String hql) {
		return this.list(hql, null, null);
	}

	public List<T> listByAlias(String hql, Map<String, Object> alias) {
		return this.list(hql, null, alias);
	}

	public List<T> list(String hql, Object[] args, Map<String, Object> alias) {
		hql = initSort(hql);
		Query query = getSession().createQuery(hql);
		setAliasParameter(query, alias);
		setParameter(query, args);
		return query.list();
	}

	@SuppressWarnings("rawtypes")
	private void setPagers(Query query,Pager pages) {
		Integer pageSize = SystemContext.getPageSize();
		Integer pageOffset = SystemContext.getPageOffset();
		if(pageOffset==null||pageOffset<0) pageOffset = 0;
		if(pageSize==null||pageSize<0) pageSize = 15;
		pages.setOffset(pageOffset);
		pages.setSize(pageSize);
		query.setFirstResult(pageOffset).setMaxResults(pageSize);
	}
	
	private String getCountHql(String hql,boolean isHql) {
		String e = hql.substring(hql.indexOf("from"));
		String c = "select count(*) "+e;
		if(isHql)
			c = c.replaceAll("fetch", "");
		return c;
	}

	/**
	 * 根据HQL分页查询
	 */
	public Pager<T> find(String hql, Object[] args) {
		return this.find(hql, args, null);
	}

	public Pager<T> find(String hql, Object args) {
		return this.find(hql, new Object[]{args}, null);
	}

	public Pager<T> find(String hql) {
		return this.find(hql, null, null);
	}

	public Pager<T> findByAlias(String hql, Map<String, Object> alias) {
		return this.find(hql, null, alias);
	}

	public Pager<T> find(String hql, Object[] args, Map<String, Object> alias) {
		hql = initSort(hql);
		String cq = getCountHql(hql,true);
		Query cquery = getSession().createQuery(cq);
		Query query = getSession().createQuery(hql);
		//件赋值
		setAliasParameter(query, alias);
		setAliasParameter(cquery, alias);
		setParameter(query, args);
		setParameter(cquery, args);
		Pager<T> pages = new Pager<T>();
		setPagers(query,pages);
		List<T> datas = query.list();
		pages.setDatas(datas);
		long total = (Long)cquery.uniqueResult();
		pages.setTotal(total);
		return pages;
	}


	/**
	 * 根据hql查询一个Object
	 */
	public Object queryObject(String hql, Object[] args) {
		return this.queryObject(hql, args, null);
	}

	public Object queryObject(String hql, Object arg) {
		return this.queryObject(hql, new Object[]{arg}, null);
	}

	public Object queryObject(String hql) {
		return this.queryObject(hql, null, null);
	}

	public Object queryObjectByAlias(String hql, Map<String, Object> alias) {
		return this.queryObject(hql, null, alias);
	}

	public Object queryObject(String hql, Object[] args,Map<String, Object> alias) {
		Query query = getSession().createQuery(hql);
		setAliasParameter(query, alias);
		setParameter(query, args);
		return query.uniqueResult();
	}

	/**
	 *根据HQL更新数据
	 */
	public void updateByHql(String hql, Object[] args) {
		Query query = getSession().createQuery(hql);
		setParameter(query, args);
		query.executeUpdate();
		
	}

	public void updateByHql(String hql, Object args) {
		this.updateByHql(hql, new Object[]{args});
	}

	public void updateByHql(String hql) {
		this.updateByHql(hql, null);
		
	}


	/**
	 * findBySql to List,
	 */
	public <N> List<N> listBySql(String sql, Object[] args, Class<?> clz,
			boolean hasEntity) {
		return this.listBySql(sql, args,null, clz, hasEntity);
	}

	public <N> List<N> listBySql(String sql, Object arg, Class<?> clz,
			boolean hasEntity) {
		return this.listBySql(sql, new Object[]{arg},clz, hasEntity);
	}

	public <N> List<N> listBySql(String sql, Class<?> clz, boolean hasEntity) {
		return this.listBySql(sql,null,clz, hasEntity);
	}

	public <N> List<N> listByAliasSql(String sql, Map<String, Object> alias,
			Class<?> clz, boolean hasEntity) {
		return this.listBySql(sql, null, clz, hasEntity);
	}

	public <N> List<N> listBySql(String sql, Object[] args,
			Map<String, Object> alias, Class<?> clz, boolean hasEntity) {
		sql = initSort(sql);
		SQLQuery sq = getSession().createSQLQuery(sql);
		setAliasParameter(sq, alias);
		setParameter(sq, args);
		if(hasEntity) {
			sq.addEntity(clz);
		} else 
			sq.setResultTransformer(Transformers.aliasToBean(clz));
		return sq.list();
	}

	/**
	 * findBySql to Pager
	 */
	public <N> Pager<N> findBySql(String sql, Object[] args, Class<?> clz,
			boolean hasEntity) {
		return this.findBySql(sql, args, null, clz, hasEntity);
	}

	public <N> Pager<N> findBySql(String sql, Object arg, Class<?> clz,
			boolean hasEntity) {
		return this.findBySql(sql, new Object[]{arg},clz, hasEntity);
	}

	public <N> Pager<N> findBySql(String sql, Class<?> clz, boolean hasEntity) {
		return this.findBySql(sql,null,clz, hasEntity);
	}

	public <N> Pager<N> findByAliasSql(String sql, Map<String, Object> alias,
			Class<?> clz, boolean hasEntity) {
		return this.findBySql(sql, null, alias, clz, hasEntity);
	}

	public <N> Pager<N> findBySql(String sql, Object[] args,
			Map<String, Object> alias, Class<?> clz, boolean hasEntity) {
		sql = initSort(sql);
		String cq = getCountHql(sql,false);
		SQLQuery sq = getSession().createSQLQuery(sql);
		SQLQuery cquery = getSession().createSQLQuery(cq);
		setAliasParameter(sq, alias);
		setAliasParameter(cquery, alias);
		setParameter(sq, args);
		setParameter(cquery, args);
		Pager<N> pages = new Pager<N>();
		setPagers(sq, pages);
		if(hasEntity) {
			sq.addEntity(clz);
		} else {
			sq.setResultTransformer(Transformers.aliasToBean(clz));
		}
		List<N> datas = sq.list();
		pages.setDatas(datas);
		long total = ((BigInteger)cquery.uniqueResult()).longValue();
		pages.setTotal(total);
		return pages;
	}

	@Override
	public T get(int id) {
		return (T) this.getSession().get(getClz(), id);
	}


	@Override
	public List<Map<String, Object>> listContainsMap(String sql) {
		return listContainsMap(sql, new Object[]{null});//为毛放null会报错
	}
	@Override
	public List<Map<String, Object>> listContainsMap(String sql,Object[] args) {
		Query query = this.getSession().createSQLQuery(sql);
		setParameter(query, args);
		List<Map<String, Object>> list = query.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
		return list;
	}


	@Override
	public List<Map<String, Object>> listContainsMap(String sql, String arg) {
		return listContainsMap(sql, new Object[]{arg});
	}
	
}
