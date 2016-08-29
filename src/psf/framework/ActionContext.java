package psf.framework;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ibatis.sqlmap.client.SqlMapClient;

public class ActionContext {
	
	public HttpServletRequest request = null;
	public HttpServletResponse response = null;
	public SqlMapClient sqlmap = null;
	public ActionMapping mapping = null;
	public Dao dao = null;
	
	protected static ThreadLocal local = new ThreadLocal();
	
	public static ActionContext currentActionContext() {
		ActionContext context = (ActionContext)local.get();
		if(context==null) {
			context = new ActionContext();
			local.set(context);
		}
		return context;
	}
	
	public static void deleteCurrentAction() {
		local.remove();
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public HttpServletResponse getResponse() {
		return response;
	}

	public void setResponse(HttpServletResponse response) {
		this.response = response;
	}

	public SqlMapClient getSqlmap() {
		return sqlmap;
	}

	public void setSqlmap(SqlMapClient sqlmap) {
		this.sqlmap = sqlmap;
	}

	public Dao getDao() {
		return dao;
	}

	public void setDao(Dao dao) {
		this.dao = dao;
	}

	public ActionMapping getMapping() {
		return mapping;
	}

	public void setMapping(ActionMapping mapping) {
		this.mapping = mapping;
	}
	
}
