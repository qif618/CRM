package com.lyf.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.lyf.model.XiaZhuMingXi;

@Repository
public interface IXiaZhuMingXiDao {
	public List<XiaZhuMingXi> xzmxListByQs(String qs);
	public void saveXzmx(XiaZhuMingXi xzmx);
	public List<String> xzrList();
	public List<XiaZhuMingXi> xzmxListByXzr(String xzr);
	public List<Map<String,Object>> allXzmxByXzr(String xzr);
	public List<Map<String,Object>> allXzmx();
	public List<XiaZhuMingXi> xzmxListByQsAndXzr(String qs, String xzr);
}
