package psf.tag.common;

import javax.servlet.jsp.JspException;

import psf.PsfTag;

public class SetTag extends PsfTag {
	protected String key = null;
	protected Object value = null;
	
	public int doEndTag() throws JspException {
		pageContext.getRequest().setAttribute(key, value);
		return EVAL_PAGE;
	}

	public String getKey() {
		return key;
	}

	public Object getValue() {
		return value;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public void setValue(Object value) {
		this.value = value;
	}
	
	
}
