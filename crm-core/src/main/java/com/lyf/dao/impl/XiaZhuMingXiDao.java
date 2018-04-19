package com.lyf.dao.impl;

import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Repository;

import com.lyf.basic.dao.BaseDao;
import com.lyf.dao.IXiaZhuMingXiDao;
import com.lyf.model.XiaZhuMingXi;
@Repository
public class XiaZhuMingXiDao extends BaseDao<XiaZhuMingXi> implements IXiaZhuMingXiDao {

	@Override
	public List<XiaZhuMingXi> xzmxListByQs(String qs) {
		String hql = "from XiaZhuMingXi where qs=?";
		return this.list(hql, new Object[]{qs});
	}

	@Override
	public void saveXzmx(XiaZhuMingXi xzmx) {
		this.add(xzmx);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> xzrList() {
		String hql = "select DISTINCT  xzr from XiaZhuMingXi";
		Session session = this.getSession();
		List<String> list = session.createQuery(hql).list();
		return list;
	}

	@Override
	public List<XiaZhuMingXi> xzmxListByXzr(String xzr) {
		String hql = "from XiaZhuMingXi where xzr=?";
		System.out.println(list(hql, new Object[]{xzr}).size());
		return this.list(hql, new Object[]{xzr});
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String,Object>> allXzmxByXzr(String xzr) {
		 String sql = "SELECT qs, xzr,SUM(je) as je FROM xiazhumingxi where xzr=?  GROUP BY qs";
		 Session session = this.getSession();
		 List<Map<String,Object>> alljeList = session.createSQLQuery(sql).setParameter(0, xzr).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
                 
		return alljeList;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> allXzmx() {
		 String sql = "SELECT qs, xzr,SUM(je) as je FROM xiazhumingxi GROUP BY qs";
		 Session session = this.getSession();
		 List<Map<String,Object>> alljeList = session.createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
                 
		return alljeList;
	}

	@Override
	public List<XiaZhuMingXi> xzmxListByQsAndXzr(String qs, String xzr) {
		String hql = "from XiaZhuMingXi where xzr=? and qs=?";
		return this.list(hql, new Object[]{xzr,qs});
	}

}


















