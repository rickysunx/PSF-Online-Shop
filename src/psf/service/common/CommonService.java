package psf.service.common;

import psf.Psf;
import psf.PsfItem;
import psf.PsfService;
import psf.common.PsfTime;
import psf.entity.TSession;

public class CommonService extends PsfService {
	public void insertSession(TSession session) throws Exception {
		dao.insert(session);
	}
	
	public void invalidSession(String sessionId,String hexIp) throws Exception {
		String sql = "update t_session set valid=0 where sessionid=#sessionid# and ip=#ip#";
		dao.prepare(sql);
		dao.bind("sessionid", sessionId);
		dao.bind("ip", hexIp);
		dao.update();
	}
	
	public void updateSessionUid(Integer uid,String sessionId,String hexIp) throws Exception {
		String sql = "update t_session set uid = #uid# where valid=1 and sessionid=#sessionid# and ip=#ip# and lasttime>=#lasttime# ";
		Integer now = new PsfTime().getTimeInSeconds();
		dao.prepare(sql);
		dao.bind("uid", uid);
		dao.bind("sessionid", sessionId);
		dao.bind("ip", hexIp);
		dao.bind("lasttime", now-Psf.Session_Timeout);
		dao.update();
	}
	
	public PsfItem querySession(String sessionId,String hexIp) throws Exception {
		String sql = "select * from t_session where valid=1 and sessionid=#sessionid# and ip=#ip# and lasttime>=#lasttime#";
		Integer now = new PsfTime().getTimeInSeconds();
		dao.prepare(sql);
		dao.bind("sessionid", sessionId);
		dao.bind("ip", hexIp);
		dao.bind("lasttime", now-Psf.Session_Timeout);
		PsfItem session = dao.queryForOneRow();
		return session;
	}
	
	public void touchSession(String sessionId,String hexIp) throws Exception {
		String sql = "update t_session set lasttime = #time# where valid=1 and sessionid=#sessionid# and ip=#ip# and lasttime>=#lasttime#";
		Integer now = new PsfTime().getTimeInSeconds();
		dao.prepare(sql);
		dao.bind("sessionid", sessionId);
		dao.bind("ip", hexIp);
		dao.bind("lasttime", now-Psf.Session_Timeout);
		dao.bind("time", now);
		dao.update();
	}
	
}
