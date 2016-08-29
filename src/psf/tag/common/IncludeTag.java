package psf.tag.common;

import javax.servlet.jsp.JspException;

import psf.PsfTag;

public class IncludeTag extends PsfTag {

	protected String page = null;
	
	public int doEndTag() throws JspException {
		
		try {
			include(page);
		} catch (Exception e) {
			throw new JspException(e);
		}
		
		return EVAL_PAGE;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

}
