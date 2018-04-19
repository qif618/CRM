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
 * @author FENG
 *
 */
public class SelectWithKeyValue extends TagSupport {

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
	private Boolean empty = false;
	private String options; 
	private String style;
	private String addtional;//��������
	@Override
	public int doEndTag() throws JspException {
		JspWriter out = pageContext.getOut();
		StringBuffer buffer = new StringBuffer();
		
		buffer.append("<select ");
		if(aClass != null){
			buffer.append("class='").append(aClass).append("' ");
		}

		if(options != null){
			buffer.append("data-options='").append(options).append("' ");
		}
		if(style != null){
			buffer.append("style='").append(style).append("' ");
		}
		if(test) {
			buffer.append("name='").append(name).append("' ");
			if(id != null){
				buffer.append("id='").append(id).append("' ");
			}else{
				buffer.append("id='").append(name).append("' ");
			}
			if(addtional!=null&&!"".equals(addtional)) {
				buffer.append(" ").append(addtional).append(" ");
			}
			buffer.append(">");
		} else {
			buffer.append("name='").append(name).append("_' ");
			if(id != null){
				buffer.append("id='").append(id).append("_' ");
			}else{
				buffer.append("id='").append(name).append("_' ");
			}
			if(addtional!=null&&!"".equals(addtional)) {
				buffer.append(" ").append(addtional).append(" ");
			}
			buffer.append("disabled='disabled' >");
		}
		if(items != null ){
			Iterator<Entry<String, String>> it = items.entrySet().iterator(); 
			if(empty){
				buffer.append("<option></option>");
			}
			while(it.hasNext()){
				Entry<String, String> tmp = it.next();
				if( tmp.getKey().equals(value)){
					buffer.append("<option ").append("value='").append(tmp.getKey()).append("' selected>").append(tmp.getValue()).append("</option>");
				}else{
					buffer.append("<option ").append("value='").append(tmp.getKey()).append("'>").append(tmp.getValue()).append("</option>");
				}
			}
		}
		
		buffer.append("</select>");
		if(!test) {
			buffer.append("<input type='hidden' ");
			buffer.append("name='").append(name).append("' ");
			if(id != null){
				buffer.append("id='").append(id).append("' ");
			}else{
				buffer.append("id='").append(name).append("' ");
			}
			buffer.append("value='").append(value).append("' />");
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

	public void setEmpty(Boolean empty) {
		this.empty = empty;
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
