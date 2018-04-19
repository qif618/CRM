package com.lyf.basic.test;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.SessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.lyf.basic.model.IUserDao;
import com.lyf.basic.model.Pager;
import com.lyf.basic.model.User;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/beans.xml")
public class UserTest {
	@Autowired
	SessionFactory sessionFactory;
	@Autowired
	private IUserDao userDao;

	@Test
	public void sqlTest(){
		String sql = "select * from t_user";
		@SuppressWarnings("rawtypes")
		Pager pager = userDao.findBySql(sql, User.class, false);
		System.out.println(pager.getDatas());
	}
	@Test
	public void loadTest(){
		User user = userDao.get(2);
		System.out.println(user);
	}
	@Test
	public void save(){
		User user = new User("张飞飞","666999");
		User u = userDao.add(user);
		System.out.println(u);
	}
	@Test
	public void listByAlias(){
		Map<String,Object> map = new HashMap<>();
		map.put("um", "张学友");
		String hql = "from User where username=:um";
		List<User> list = userDao.listByAlias(hql, map);
		System.out.println(list);
	}
	@Test
	public void findObject(){
		String hql = "select * from t_user";
		List<User> list1 =  userDao.listBySql(hql,User.class,false);
		List<User> list2 =  userDao.listBySql(hql,User.class,true);
		System.out.println(list1);
		System.out.println(list2);
	}
	@Test
	public void listContainsMap(){
		String sql = "select username,password from t_user where username=?";
		List<Map<String,Object>> list = userDao.listContainsMap(sql,"刘德华");
		System.out.println(list.get(0));
	}
}











