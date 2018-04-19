package com.lyf.dao;

import java.util.List;

import com.lyf.basic.dao.IBaseDao;
import com.lyf.model.UserInfo;


public interface IUserDao extends IBaseDao<UserInfo>{
	
	/**
	 * 根据条件查询员工信息
	 * @param username
	 * @return
	 */
	public List<UserInfo> getList(String userInput, String queryType);
	public UserInfo getUserByUserName(String username,String password);
	

}
