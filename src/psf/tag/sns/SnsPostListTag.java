package psf.tag.sns;


import javax.servlet.jsp.JspException;

import psf.PsfTag;
import psf.vo.sns.PostListItemVO;

public class SnsPostListTag extends PsfTag {
	protected PostListItemVO data = null;

	public PostListItemVO getData() {
		return data;
	}

	public void setData(PostListItemVO data) {
		this.data = data;
	}

	public int doEndTag() throws JspException {
		try {
			
			
			
			include("/sns/post_list.jsp");
		} catch (Exception e) {
			throw new JspException(e);
		}
		return EVAL_PAGE;
	}
}
