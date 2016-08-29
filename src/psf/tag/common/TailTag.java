package psf.tag.common;

import javax.servlet.jsp.JspException;

import psf.PsfTag;

public class TailTag extends PsfTag {

	public int doEndTag() throws JspException {
		try {
			include("/common/tail.jsp");
		} catch (Exception e) {
			throw new JspException(e);
		}
		return EVAL_PAGE;
	}

}
