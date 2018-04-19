package com.lyf.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.lyf.basic.dao.BaseDao;
import com.lyf.dao.IKaiJiangHaoMaoDao;
import com.lyf.model.KaiJiangHaoMao;
@Repository
public class KaiJiangHaoMaoDao extends BaseDao<KaiJiangHaoMao> implements IKaiJiangHaoMaoDao {
		
	@Override
	public void save(KaiJiangHaoMao kjhm) {
		System.out.println("期数："+kjhm.getQs());
		if (kjhm.getQs()==null || kjhm.getQs().equals("")) {
			this.update(kjhm);
		}else{
			System.out.println("tianjiao："+kjhm.getQs());
			this.add(kjhm);
		}
	}

	@Override
	public KaiJiangHaoMao getKjhmByQs(String qs) {
		if(this.get(qs)==null){
			return new KaiJiangHaoMao();
		}else{
			return this.get(qs);
		}
	}

	@Override
	public List<KaiJiangHaoMao> kjhmList() {
		System.out.println("获取所有开奖号码");
		String hql = "from KaiJiangHaoMao";
		return this.list(hql);
	}

}
