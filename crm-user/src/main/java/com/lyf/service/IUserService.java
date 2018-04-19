package com.lyf.service;

import com.lyf.model.UserInfo;

public interface IUserService{
	public UserInfo getUserById(int id);
	public UserInfo getUserByUserName(String username,String password);
}
