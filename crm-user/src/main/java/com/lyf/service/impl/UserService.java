package com.lyf.service.impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.lyf.dao.IUserDao;
import com.lyf.model.UserInfo;
import com.lyf.service.IUserService;

@Service
public class UserService implements IUserService{
	@Inject
	private IUserDao userDao;
	
	@Override
	public UserInfo getUserById(int id) {
		return userDao.get(id);
	}

	@Override
	public UserInfo getUserByUserName(String username,String password) {
		UserInfo user = userDao.getUserByUserName(username,password);
		return user;
	}

}
