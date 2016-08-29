package psf.framework;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import psf.PsfAction;
import psf.PsfFilter;

import com.ibatis.sqlmap.client.SqlMapClient;

public class PsfController implements Filter {

	public static int clickCount = 0;
	
	public void destroy() {}
	
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain fc) throws IOException, ServletException {
		long t1 = System.currentTimeMillis();
		HttpServletRequest request = (HttpServletRequest)servletRequest;
		HttpServletResponse response = (HttpServletResponse)servletResponse;
		String uri = request.getRequestURI();
		
		SqlMapClient sqlmap = null;
		boolean transactionSupport = false;
		boolean inAction = false;
		
		try {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.setBufferSize(512000);
			
			if(uri.startsWith("/WEB-INF/")) {
				fc.doFilter(request, response);
				return;
			}
			
			ActionMapping mapping = FilterAndActionManager.getInstance().getActionMapping(uri);
			if(mapping==null) {
				fc.doFilter(request, response);
				return;
			}
			
			inAction = true;
			
			ActionContext.currentActionContext().setRequest(request);
			ActionContext.currentActionContext().setResponse(response);
			
			sqlmap = PsfSqlMapClient.getSqlMapInstance();
			
			ActionContext.currentActionContext().setSqlmap(sqlmap);
			ActionContext.currentActionContext().setDao(new Dao(sqlmap));
			ActionContext.currentActionContext().setMapping(mapping);
			
			transactionSupport = mapping.isTrasaction();
			if(transactionSupport) {
				sqlmap.startTransaction();
			}
			
			FilterMapping [] fms = FilterAndActionManager.getInstance().getFilterMappings();
			for (FilterMapping fm:fms) {
				if((fm.starEnd && uri.startsWith(fm.getUrl())) ||
					(!fm.starEnd && uri.equals(fm.getUrl())))  {
					Class cf = Class.forName(fm.getTheClass());
					PsfFilter pf = (PsfFilter) cf.newInstance();
					if(!pf.doFilter()) {
						if(transactionSupport) sqlmap.commitTransaction();
						return;
					}
				}
			}
			
			String theClass = mapping.getTheClass();
			
			if(theClass.startsWith("jsp:")) {
				request.getRequestDispatcher("/WEB-INF/pages"+theClass.substring(4)).forward(request, response);
				if(transactionSupport) sqlmap.commitTransaction();
				return;
			}
			
			Class c = Class.forName(theClass);
			PsfAction action = (PsfAction) c.newInstance();
			Method m = c.getMethod(mapping.getMethod(), new Class[0]);
			try {
				m.invoke(action);
			} catch (InvocationTargetException e) {
				throw e.getTargetException();
			}
		
			if(!action.isForwardProcessed()) {
				action.forwardDefault();
			}
			
			if(transactionSupport) {
				sqlmap.commitTransaction();
				sqlmap.getCurrentConnection().commit();
			}
		} catch (Throwable e) {
			e.printStackTrace();
			response.sendError(500);
			if(transactionSupport) {
				try {sqlmap.getCurrentConnection().rollback();} catch (Exception e2) {}
			}
		} finally {
			try {
				if(sqlmap!=null && transactionSupport) {
					sqlmap.endTransaction();
				}
			} catch (Exception ex) {}
			long t2 = System.currentTimeMillis();
			ActionContext.deleteCurrentAction();
			
			if(!uri.equals("/action/sns/get_last_update_post_count") && 
			   !uri.startsWith("/pic/") && 
			   !uri.startsWith("/ecimage") && 
			   inAction) {
				System.out.println((clickCount++)+":page["+uri+"]"+"执行时间："+(t2-t1));
			}
		}
	}

	public void init(FilterConfig fc) throws ServletException {
		
	}

}
