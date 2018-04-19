package com.lyf.action;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

@Controller
public class UserAction {
	public String login(Model model){
		System.out.println("登录");
		return "index";
	}
}
