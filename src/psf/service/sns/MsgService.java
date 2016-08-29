/**
 * 消息管理
 * @author 于淼
 */
package psf.service.sns;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import psf.Psf;
import psf.PsfService;
import psf.Smiley;
import psf.common.PageParam;
import psf.common.PageResult;
import psf.common.PsfHtmlUtils;
import psf.common.PsfShortUrl;
import psf.common.PsfTime;
import psf.common.PsfUtils;
import psf.entity.TMsg;
import psf.entity.TPic;
import psf.entity.TUser;
import psf.service.common.PicService;
import psf.service.common.UserService;
import psf.vo.sns.ApplyVO;
import psf.vo.sns.MsgVO;

public class MsgService extends PsfService {
		
	public int addMsg(TMsg msg) throws Exception {
		return dao.insert(msg);
	}
	public void delMsg(Integer msgid,Integer uid) throws Exception {
		TMsg msg = (TMsg)sqlmap.queryForObject("msg.queryMsgByMsgid", msgid);
		if(msg.getMsgto().equals(uid)){
			sqlmap.update("msg.delMsgByReader",msgid);
		}else{
			sqlmap.update("msg.delMsgBySender",msgid);
		}
	}
	public void updateMsgReadFlag(Integer msgfrom,Integer msgto) throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msgfrom", msgfrom);
		map.put("msgto", msgto);
		sqlmap.update("msg.updateMsgReadFlag", map);
	}
	/**
	 * 根据用户删除 
	 * @param msgfrom
	 * @param msgto
	 * @param type 1- 删除发件箱 2-删除收件箱
	 * @throws Exception
	 */
	public void updataDelFlag(Integer msgfrom,Integer msgto) throws Exception {
	
			Map<String,Object> m1 = new HashMap<String,Object>();
			m1.put("msgfrom", msgfrom);
			m1.put("msgto", msgto);
			sqlmap.update("msg.delToMsgByUid", m1);
	
			Map<String,Object> m2 = new HashMap<String,Object>();
			m2.put("msgfrom", msgto);
			m2.put("msgto", msgfrom);
			sqlmap.update("msg.delFromMsgByUid", m2);
		
	}
	public TMsg queryMsgByMsgid(Integer msgid) throws Exception {
		return (TMsg)sqlmap.queryForObject("msg.queryMsgByMsgid", msgid);
	}
	/**
	 * 根据用户查头像
	 */
	public String queryAvatarFileName (Integer uid) throws Exception {
		UserService userService = new UserService();
		TUser user = userService.queryUserByID(uid);
		if(user.getAvatarid() != null){
			TPic p = (TPic)sqlmap.queryForObject("sns.queryPicByPicid", user.getAvatarid());
			return user.getAvatarid()+"."+p.getFiletype();
		}else{
			return "1.jpg";
		}
	}
	public String queryRemarkName(Integer uid,Integer ouid,String username) throws Exception {
		SnsService snsService = new SnsService();
		String oname = snsService.queryRemarkName(uid, ouid);
		if(oname != null){
			return oname;
		} else {
			return username;
		}
	}
	/**
	 * 
	 * @param uid
	 * @param pp
	 * @return
	 * @throws Exception
	 * 
	 * delbyreader - 0 (未删)
	 * delbyreader - 1 (已删)
	 *  
	 * isread - 0 （未读）
	 * isread - 1  (已读)
	 */
	public PageResult<MsgVO> queryReceiveMsgByUid(Integer uid,PageParam pp) throws Exception {
		UserService userService = new UserService();
		PicService picService = new PicService();
		TUser userTo = userService.queryUserByID(uid);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("uid", uid);
		map.put("pp", pp);
		Integer itemCount = (Integer)sqlmap.queryForObject("msg.queryMsgByUidCount", uid);
		List<MsgVO> listMsgVO = sqlmap.queryForList("msg.queryMsgByUid", map);
		for(MsgVO msg : listMsgVO) {
			TMsg m = this.queryMsgByMsgid(msg.getMsgid());
			Integer ouid = msg.getUid();
			msg.setAvatarFileName(queryAvatarFileName(ouid));
			msg.setTime(new PsfTime(msg.getLastUpdateTime()).toChnDateString());
			if(m.getMsgfrom().equals(uid)) {	// 发信
				msg.setMsgType(1);
			} else {
				msg.setMsgType(0);
			} 
			String text = PsfHtmlUtils.decodeText(msg.getMsgcontent());
			text = Smiley.replaceSmiley(text);
			msg.setMsgcontent(text);
			map.put("msgfrom", ouid);
			List<MsgVO> listMsgToAndFrom = sqlmap.queryForList("msg.queryMsgByToFrom", map);
			for(MsgVO msgtofrom : listMsgToAndFrom) {
				if(msgtofrom.getMsgType() == 0){		//收信
					msgtofrom.setAvatarFileName(queryAvatarFileName(ouid));
				} else {											//发信
					msgtofrom.setNowavatarFileName(queryAvatarFileName(uid));
				}
				msgtofrom.setTime(new PsfTime(msgtofrom.getAddtime()).toChnDateString());
				String str = PsfHtmlUtils.decodeText(msgtofrom.getMsgcontent());
				str = Smiley.replaceSmiley(str);
				msgtofrom.setPicList(picService.queryPicByOid(Psf.OTYPE_Msg, msgtofrom.getMsgid(), new PageParam(1,200)).getList());
				msgtofrom.setMsgcontent(str);
			}
			
			msg.setDetailMsgList(listMsgToAndFrom);
		}
		return new PageResult<MsgVO>(listMsgVO,itemCount,pp.getPageSize());
	}
	
	public PageResult<MsgVO> queryMsgDetail(Integer uid,Integer ouid,PageParam pp,String keyword) throws Exception {
		PicService picService = new PicService();
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("uid", uid);
		map.put("ouid", ouid);
		map.put("pp", pp);
		map.put("keyword", keyword);
		
		Integer itemCount = (Integer)sqlmap.queryForObject("msg.queryMsgDetialByUidCount", map);
		List<MsgVO> msgList = sqlmap.queryForList("msg.queryMsgDetialByUid", map);
		for(MsgVO msg:msgList){
			msg.setTime(new PsfTime(msg.getAddtime()).toChnDateString());
			if(msg.getAvatarFileName() != null){
				TPic p = (TPic)sqlmap.queryForObject("sns.queryPicByPicid", msg.getAvatarFileName());
				msg.setAvatarFileName(msg.getAvatarFileName()+"."+p.getFiletype());
			}else{
				msg.setAvatarFileName("1.jpg");
			}
			String str = PsfHtmlUtils.decodeText(msg.getMsgcontent());
			str = Smiley.replaceSmiley(str);
			msg.setPicList(picService.queryPicByOid(Psf.OTYPE_Msg, msg.getMsgid(), new PageParam(1,200)).getList());
			msg.setMsgcontent(str);		
		}
		return new PageResult<MsgVO>(msgList,itemCount,pp.getPageSize());	
	}
	
	/**
	 * 
	 * @param uid
	 * @param pp
	 * @param keyword
	 * @return
	 * @throws Exception
	 */
	public PageResult<MsgVO> queryMsgByKeyword(Integer uid, PageParam pp,String keyword)throws Exception{
		Map<String,Object> m = new HashMap<String,Object>();
		m.put("uid", uid);
		m.put("pp",pp);
		m.put("keyword", keyword);
		Integer itemCount = (Integer)sqlmap.queryForObject("msg.queryMsgByKeywordCount", m);
		List<MsgVO> list = sqlmap.queryForList("msg.queryMsgByKeyword", m);
		return new PageResult<MsgVO>(list,itemCount,pp.getPageSize());
	}
/**
 * 查看系统信
 * @param uid
 * @param pp
 * @return
 * @throws Exception
 */
	public PageResult<MsgVO> queryAutoMsg(Integer uid,PageParam pp,String keyword) throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("uid", uid);
		map.put("pp", pp);
		map.put("keyword", keyword);
		Integer itemCount = (Integer)sqlmap.queryForObject("msg.queryAutoMsgCount",map);
		List<MsgVO> list = sqlmap.queryForList("msg.queryAutoMsg", map);
		for(MsgVO msg :list){
			msg.setTime(new PsfTime(msg.getAddtime()).toChnDateString());
		}
		return new PageResult<MsgVO>(list,itemCount,pp.getPageSize());
	}

}
