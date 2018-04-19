package com.lyf.dao;

import java.util.List;

import com.lyf.model.KaiJiangHaoMao;

public interface IKaiJiangHaoMaoDao {
	public void save(KaiJiangHaoMao kjhm);
	public KaiJiangHaoMao getKjhmByQs(String qs);
	public List<KaiJiangHaoMao> kjhmList();
}
