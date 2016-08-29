package psf;

import psf.framework.ActionContext;
import psf.framework.Dao;

import com.ibatis.sqlmap.client.SqlMapClient;

public class PsfActionService extends PsfAction {
	protected SqlMapClient sqlmap = null;
	protected Dao dao = null;
	
	public PsfActionService() {
		super();
		sqlmap = ActionContext.currentActionContext().getSqlmap();
		dao = ActionContext.currentActionContext().getDao();
	}
}
