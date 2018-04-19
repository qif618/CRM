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
public class TextArea extends TagSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7680695817751335496L;
	private String id;
	private String name;
	private String aClass;
	private Boolean test = true;
	private String value;

	@Override
	public int doEndTag() throws JspException {
		JspWriter out = pageContext.getOut();
		StringBuffer buffer = new StringBuffer();
		if(test){
			buffer.append("<textArea ");
			if(aClass != null){
				buffer.append("class='").append(aClass).append("' ");
			}
			
			buffer.append("name='").append(name).append("' ");

			if(id != null){
				buffer.append("id='").append(id).append("' ");
			}else{
				buffer.append("id='").append(name).append("' ");
			}
			buffer.append(" >").append(value).append("</textArea>");
		}else{
			buffer.append("<pre>").append(value).append("</pre>").append("<input type='hidden' ");
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


	
}
