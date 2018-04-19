package com.lyf.jstl;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;
/**
 * 
 * @author FENG
 *
 */
public class Select extends TagSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7680695817751335496L;
	private String id;
	private String name;
	private String aClass;
	private Boolean test = true;
	private String value;
	private List<String> items;
	private Boolean empty = false;
	private String options; 
	private String style;
	@Override
	public int doEndTag() throws JspException {
		JspWriter out = pageContext.getOut();
		StringBuffer buffer = new StringBuffer();
		if(test){
			buffer.append("<select ");
			if(aClass != null){
				buffer.append("class='").append(aClass).append("' ");
			}
			
			buffer.append("name='").append(name).append("' ");

			if(id != null){
				buffer.append("id='").append(id).append("' ");
			}else{
				buffer.append("id='").append(name).append("' ");
			}
			if(options != null){
				buffer.append("data-options='").append(options).append("' ");
			}
			if(style != null){
				buffer.append("style='").append(style).append("' >");
			}else{
				buffer.append(">");
			}
			if(items != null ){
				Iterator<String> it = items.iterator();
				if(empty){
					buffer.append("<option></option>");
				}
				while(it.hasNext()){
					String tmp = it.next();
					if( tmp.equals(value)){
						buffer.append("<option selected>").append(tmp).append("</option>");
					}else{
						buffer.append("<option>").append(tmp).append("</option>");
					}
				}
			}
			
			buffer.append("</select>");
		}else{
			buffer.append(value).append("<input type='hidden' ");
			if(aClass != null){
				buffer.append("class='").append(aClass).append("' ");
			}
			buffer.append("name='").append(name).append("' ");

			if(id != null){
				buffer.append("id='").append(id).append("' ");
			}else{
				buffer.append("id='").append(name).append("' ");
			}
			buffer.append("value=\"").append(value).append("\" />");
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

	public void setItems(List<String> items) {
		this.items = items;
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

}
