package psf;

import psf.framework.ActionContext;
import psf.framework.Dao;

import com.ibatis.sqlmap.client.SqlMapClient;

public class PsfService {
	protected SqlMapClient sqlmap = null;
	protected Dao dao = null;
	
	public PsfService() {
		sqlmap = ActionContext.currentActionContext().getSqlmap();
		dao = ActionContext.currentActionContext().getDao();
	}
}
