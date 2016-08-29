package psf.service.sns;

import java.util.HashMap;
import java.util.Map;

import psf.PsfService;
import psf.entity.TEvent;
import psf.entity.TEventMember;

/**
 * 活动
 * 
 * @author 肖慧
 */
public class EventService extends PsfService {
	/**
	 * 添加活动
	 * 
	 * @param event
	 * @throws Exception
	 */
	public void addEvent(TEvent event) throws Exception {
		dao.insert(event);
	}

	/**
	 * 删除活动
	 * 
	 * @param eventid
	 * @throws Exception
	 */
	public void delEvent(Integer eventid) throws Exception {
		sqlmap.update("event.delete", eventid);
	}

	/**
	 * 更新活动
	 * 
	 * @param event
	 * @throws Exception
	 */
	public void updateEvent(TEvent event) throws Exception {
		dao.update(event);
	}

	/**
	 * 添加活动成员
	 * 
	 * @param eventid
	 * @param memberid
	 * @throws Exception
	 */
	public void addEventMember(Integer eventid, Integer memberid) throws Exception {
		TEventMember member = new TEventMember();
		member.setEventid(eventid);
		member.setUid(memberid);
		dao.insert(member);
	}

	/**
	 * 删除活动成员
	 * 
	 * @param eventid
	 * @param memberid
	 * @throws Exception
	 */
	public void delEventMember(Integer eventid, Integer memberid) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("eventid", eventid);
		param.put("memberid", memberid);
		sqlmap.delete("event.delEventMember", param);
	}
}
