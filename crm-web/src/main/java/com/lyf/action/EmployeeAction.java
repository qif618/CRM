package com.lyf.action;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/emp")
public class EmployeeAction {
	
	@RequestMapping(value="/empList.jhtml")
	public String empList() {
		System.out.println("所有员工列表");
		return "employee/empList";
	}
	
	@RequestMapping(value="/deptList.jhtml")
	public String deptList() {
		System.out.println("所有部门列表");
		return "employee/deptList";
	}
	
	@RequestMapping(value="/bulletinList.jhtml")
	public String bulletinList() {
		System.out.println("所有公告列表");
		return "employee/bulletinList";
	}
	
	@RequestMapping(value="/addEmp.jhtml")
	public String addEmp(HttpServletRequest request,Model model) {
		String flag = request.getParameter("flag");
		model.addAttribute("flag", flag);
		return "employee/empDetail";
	}
	
	@RequestMapping(value="/editEmp.jhtml")
	public String editEmp(HttpServletRequest request,Model model) {
		String flag = request.getParameter("flag");
		model.addAttribute("flag", flag);
		return "employee/empDetail";
	}
}










