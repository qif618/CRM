package com.lyf.action;


import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lyf.model.UserInfo;
import com.lyf.service.IUserService;

@Controller
public class LoginAction {
	@Inject
	private IUserService userService;
	
	@RequestMapping(value="/login.jhtml",method=RequestMethod.GET)
	public String login() {
		System.out.println("去登录页面");
		return "employee/empList";
	}
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(String username,String password,String checkcode,Model model,HttpSession session) {
		/*String cc = (String)session.getAttribute("cc");
		if(!cc.equals(checkcode)) {
			model.addAttribute("error","验证码出错，请重新输入");
			return "admin/login";
		}
		User loginUser = userService.login(username, password);
		session.setAttribute("loginUser", loginUser);
		List<Role> rs = userService.listUserRoles(loginUser.getId());
		boolean isAdmin = isRole(rs,RoleType.ROLE_ADMIN);
		session.setAttribute("isAdmin", isAdmin);
		if(!isAdmin) {
			session.setAttribute("allActions", getAllActions(rs, session));
			session.setAttribute("isAudit", isRole(rs,RoleType.ROLE_AUDIT));
			session.setAttribute("isPublish", isRole(rs,RoleType.ROLE_PUBLISH));
		}
		session.removeAttribute("cc");*/
		UserInfo user = userService.getUserByUserName(username,password);
		if(user != null){
			model.addAttribute("message", "登录成功");
		}else{
			model.addAttribute("message", "登录失败");
		}
		return "admin/index";
	}
}
