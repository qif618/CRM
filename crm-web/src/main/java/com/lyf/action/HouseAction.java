package com.lyf.action;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/house")
public class HouseAction {
	
	@RequestMapping(value="/houseList.jhtml")
	public String houseList() {
		System.out.println("所有房屋列表");
		return "house/houseList";
	}
	
	@RequestMapping(value="/houseTypeList.jhtml")
	public String houseTypeList() {
		System.out.println("所有房屋类型列表");
		return "house/houseTypeList";
	}
}
