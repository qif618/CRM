package com.lyf.action;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mail")
public class MailAction {
	
	@RequestMapping(value="/mailList.jhtml")
	public String mailList() {
		System.out.println("邮件列表");
		return "mail/mailList";
	}
	
	@RequestMapping(value="/mailCompose.jhtml")
	public String mailCompose() {
		System.out.println("邮件列表");
		return "mail/mailCompose";
	}
}
























