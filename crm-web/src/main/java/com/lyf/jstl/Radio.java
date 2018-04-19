package com.lyf.jstl;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;
/**
 * 
 * @Project: NewPortal_local 
 * @Author: Qingmao 
 * <p>Title:Radio.java</p>
 * <p>Description:��ѡ��ť</p>
 * @Date: 2016��9��7�� 
 * @Copyright: 2016 www.myfirstpro.com Inc. All rights reserved. 
 * @version 1.0
 */
public class Radio extends TagSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7680695817751335496L;
	private String id;
	private String name;
	private String aClass;
	private Boolean test = true;
	private String value;
	private Map<String, String> items;
	private String options; 
	private String style;
	private String addtional;//��������
	@Override
	public int doEndTag() throws JspException {
		JspWriter out = pageContext.getOut();
		StringBuffer buffer = new StringBuffer();
		
		if(items != null ){
			Iterator<Entry<String, String>> it = items.entrySet().iterator(); 

			while(it.hasNext()){
				Entry<String, String> tmp = it.next();
				
				buffer.append("<input type='radio' ");
				if(aClass != null){
					buffer.append("class='").append(aClass).append("' ");
				}
				
				if(options != null){
					buffer.append("data-options='").append(options).append("' ");
				}
				if(style != null){
					buffer.append("style='").append(style).append("' ");
				}
				if( tmp.getKey().equals(value)){
					buffer.append(" checked ");
				}else{
					
				}
				if(!test) {
					buffer.append(" disabled='disabled' ");
				}
				buffer.append("name='").append(name).append("' ");
				if(value!=null) {
					
					buffer.append("value='").append(tmp.getKey()).append("' ");
				}
				
				if(addtional!=null&&!"".equals(addtional)) {
					buffer.append(" ").append(addtional).append(" ");
				}
				
				buffer.append(" />&nbsp;").append(tmp.getValue()).append("&nbsp;&nbsp;");
			}
		}
		if(!test) {
			buffer.append("<input type='hidden' name='").append(name).append("' value='").append(value).append("' />");
		}
		
		try {
			out.write(buffer.toString());
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		
		return TagSupport.EVAL_PAGE;
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

	public void setOptions(String options) {
		this.options = options;
	}

	public void setStyle(String style) {
		this.style = style;
	}

	public void setItems(Map<String, String> items) {
		this.items = items;
	}

	public void setAddtional(String addtional) {
		this.addtional = addtional;
	}

}
