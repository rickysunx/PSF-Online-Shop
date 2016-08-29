package psf.tag.common;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;

import psf.PsfTag;

public class CurrentTag extends PsfTag {

	public String key = null;
	public String value = null;
	public String output = null;
	
	public int doEndTag() throws JspException {
		try {
			
			String keyValue = (String)getRequest().getAttribute(key);
			if(keyValue!=null && keyValue.equals(value)) {
				JspWriter out = pageContext.getOut();
				out.print(output==null?" current ":output);
			}
		} catch (Exception e) {
			throw new JspException(e);
		}
		return EVAL_PAGE;
	}

	public String getKey() {
		return key;
	}

	public String getValue() {
		return value;
	}

	public String getOutput() {
		return output;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public void setOutput(String output) {
		this.output = output;
	}

}
