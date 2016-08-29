package psf;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import psf.framework.ActionContext;

/**
 * 过滤器的基类
 * @author 孙锐
 */

public abstract class PsfFilter extends PsfAction {
	public abstract boolean doFilter() throws Exception;
	
	public void forward(String page) throws Exception {
		HttpServletRequest request = ActionContext.currentActionContext().getRequest();
		HttpServletResponse response = ActionContext.currentActionContext().getResponse();
		request.getRequestDispatcher("/WEB-INF/pages"+page).forward(request, response);
	}
	
	public void redirect(String page) throws Exception {
		HttpServletResponse response = ActionContext.currentActionContext().getResponse();
		response.sendRedirect(page);
	}
}
