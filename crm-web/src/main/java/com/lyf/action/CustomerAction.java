package com.lyf.action;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/customer")
public class CustomerAction {
	
	@RequestMapping(value="/customerList.jhtml")
	public String customerList() {
		System.out.println("客户列表");
		return "customer/customerList";
	}
	
	@RequestMapping(value="/customerFpList.jhtml")
	public String customerFpList() {
		System.out.println("分配");
		return "customer/customerFpList";
	}
	
	@RequestMapping(value="/customerGhList.jhtml")
	public String customerGhList() {
		System.out.println("关怀");
		return "customer/customerGhList";
	}
	
	@RequestMapping(value="/customerTypeList.jhtml")
	public String customerTypeList() {
		System.out.println("类型");
		return "customer/customerTypeList";
	}
	
	@RequestMapping(value="/customerZtList.jhtml")
	public String customerZtList() {
		System.out.println("状态");
		return "customer/customerZtList";
	}
	
	@RequestMapping(value="/customerLyList.jhtml")
	public String customerLyList() {
		System.out.println("来源");
		return "customer/customerLyList";
	}
	
	@RequestMapping(value="/customerLxjlList.jhtml")
	public String customerLxjlList() {
		System.out.println("联系记录");
		return "customer/customerLxjlList";
	}
	
	@RequestMapping(value="/customerLxrList.jhtml")
	public String customerLxrList() {
		System.out.println("联系人");
		return "customer/customerLxrList";
	}
}
























