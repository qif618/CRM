package com.lyf.basic.model;


import java.util.List;

import org.springframework.stereotype.Repository;

import com.lyf.basic.dao.BaseDao;
@Repository
public class UserDao extends BaseDao<User> implements IUserDao{

	@Override
	public List<User> listUserBySql(String sql, Object args, Class<User> clz,
			boolean b) {
		return super.listBySql(sql, args, clz, true);
	}
	
}
