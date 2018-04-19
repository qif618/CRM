package com.lyf.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.lyf.basic.dao.BaseDao;
import com.lyf.dao.IUserDao;
import com.lyf.model.UserInfo;
@Repository
public class UserDao extends BaseDao<UserInfo> implements IUserDao{

	@Override
	public List<UserInfo> getList(String userInput, String queryType) {
		
		return null;
	}

	@Override
	public UserInfo getUserByUserName(String username,String password) {
		String hql = "from UserInfo where userNum=? and userPw =?";
		return (UserInfo) this.queryObject(hql, new Object[]{username,password});
	}


}
