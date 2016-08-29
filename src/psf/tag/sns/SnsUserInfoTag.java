package psf.tag.sns;

import javax.servlet.jsp.JspException;

import psf.PsfTag;

public class SnsUserInfoTag extends PsfTag {

	public int doEndTag() throws JspException {
		
		try {
			include("/sns/user_info.jsp");
		} catch (Exception e) {
			throw new JspException(e);
		}
		
		return EVAL_PAGE;
	}

}
