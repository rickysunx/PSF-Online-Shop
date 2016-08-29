package psf.tag.sns;


import javax.servlet.jsp.JspException;

import psf.PsfTag;

public class SnsHeaderTag extends PsfTag {

	public int doEndTag() throws JspException {
		try {
			include("/sns/sns_header.jsp");
		} catch (Exception e) {
			throw new JspException(e);
		}
		return EVAL_PAGE;
	}

}
