package psf;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.tagext.TagSupport;

import psf.framework.PsfServletResponseWrapper;

public class PsfTag extends TagSupport {
	public HttpServletRequest getRequest() {
		return (HttpServletRequest) pageContext.getRequest();
	}
	public HttpServletResponse getResponse() {
		return (HttpServletResponse) pageContext.getResponse();
	}
	public void include(String page) throws Exception {
		getRequest().getRequestDispatcher("/WEB-INF/pages"+page).include(
			getRequest(), new PsfServletResponseWrapper(getResponse(), pageContext.getOut()));
	}
}
