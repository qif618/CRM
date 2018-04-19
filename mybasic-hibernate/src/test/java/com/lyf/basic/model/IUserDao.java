package com.lyf.basic.model;

import java.util.List;


import com.lyf.basic.dao.IBaseDao;

public interface IUserDao extends IBaseDao<User>{
	public List<User> listUserBySql(String sql, Object args,
			Class<User> clz, boolean b);
}
