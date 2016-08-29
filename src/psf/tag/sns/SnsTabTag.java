package psf.tag.sns;


import javax.servlet.jsp.JspException;

import psf.PsfTag;

public class SnsTabTag extends PsfTag {
	protected String current = null;

	public String getCurrent() {
		return current;
	}

	public void setCurrent(String current) {
		this.current = current;
	}

	@Override
	public int doEndTag() throws JspException {
		try {
			getRequest().setAttribute("snsTab", current);
			include("/sns/sns_tab.jsp");
		} catch (Exception e) {
			throw new JspException(e);
		}
		return EVAL_PAGE;
	}
}
