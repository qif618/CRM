package com.lyf.jstl;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;
/**
 * 
 * @author FENG
 *
 */
public class Button2 extends TagSupport {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 697242528945465958L;
	private String id;
	private String name;
	private String aClass;
	private Boolean test = true;
	private String value;
	private String status;
	private String role;
	private String color = "0";
	private Boolean reject = false;
	
	@Override
	public int doEndTag() throws JspException {
		JspWriter out = pageContext.getOut();
		StringBuffer buffer = new StringBuffer();
		if(test){
			buffer.append("<button type='button' class='button button-border button-rounded button-tiny ");
			if("1".equals(color)){
				buffer.append(" button-royal ");
			}else if("2".equals(color)){
				buffer.append(" button-highlight ");
			}else if("3".equals(color)){
				buffer.append(" button-caution ");
			}else if("4".equals(color)){
				buffer.append(" button-action ");
			}else{
				buffer.append(" button-primary ");
			}
			if(aClass != null){
				buffer.append(aClass).append("' ");
			}else{
				buffer.append("' ");
			}
			if(id != null){
				buffer.append("id='").append(id).append("' ");
			}
			if(name != null){
				buffer.append("name='").append(name).append("' ");
			}
			if(role != null){
				buffer.append("data-role='").append(role).append("' ");
			}
			if(status != null){
				buffer.append("data-status='").append(status).append("' ");
			}
			buffer.append("data-reject='").append(reject).append("' ");
			buffer.append(">").append(value).append("</button>");
		}else{
			buffer.append("");
		}
		
		try {
			out.write(buffer.toString());
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		
		return TagSupport.EVAL_PAGE;
	}

	public void setReject(Boolean reject) {
		this.reject = reject;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setaClass(String aClass) {
		this.aClass = aClass;
	}

	public void setTest(Boolean test) {
		this.test = test;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setColor(String color) {
		this.color = color;
	}

	
}
