
package psf.action.sns;

import java.net.URLDecoder;
import java.net.URLEncoder;

import psf.PsfAction;
import psf.common.PageParam;
import psf.common.PageResult;
import psf.entity.TPic;
import psf.entity.TUser;
import psf.vo.sns.ApplyVO;
import psf.vo.sns.CommentVO;
import psf.vo.sns.MsgVO;
import psf.vo.sns.SnsUserInfoVO;

public class MyAction extends PsfAction {
	
	public void msg() throws Exception {
		Integer page = p2int("page");
		if(page == null)
			page = 1;
		PageParam pp = new PageParam(page,20);
		PageResult<MsgVO> msgList = msgService.queryReceiveMsgByUid(getLoginUserId(), pp);
		set("msgList",msgList.getList());
		set("userCount",msgList.getItemCount());
		set("curPage",page);
		set("pageCount",msgList.getPageCount());
		
	}
	public void notice() throws Exception {
		Integer uid = getLoginUserId();
		Integer page = p2int("page");
		String keyword = p("keyword");
		if(page == null)
			page = 1;
		if(keyword == null || keyword.length() == 0){
			keyword = null;
		} else {
			keyword = URLDecoder.decode(keyword,"utf-8");
		}
		PageParam pp = new PageParam(page,20);
		PageResult<MsgVO> msgAutoList = msgService.queryAutoMsg(uid, pp,keyword);
		set("msgAutoList",msgAutoList.getList());
		set("msgAutoCount",msgAutoList.getItemCount());
		set("pageCount",msgAutoList.getPageCount());
		set("curPage",page);
		set("keyword",keyword);
	}
	public void invite() throws Exception {
		Integer uid = getLoginUserId();
		Integer page = p2int("page");
		String keyword = p("keyword");
		if(page == null)
			page = 1;
		if(keyword == null || keyword.length() == 0){
			keyword = null;
		} else {
			keyword = URLDecoder.decode(keyword,"utf-8");
		}
		PageParam pp = new PageParam(page,20);
		PageResult<ApplyVO> list = applyService.queryAppplyByUid(uid, pp,keyword);
		set("applyList",list.getList());
		set("pageCount",list.getPageCount());
		set("curPage",page);
		set("count",list.getItemCount());
		set("keyword",keyword);
	}
	public void dialog() throws Exception {
		Integer touid = p2int("touid");
		Integer uid = getLoginUserId();
		Integer page = p2int("page");
		String keyword = p("keyword");
		
		if(page == null)
			page = 1;
		if(keyword == null || keyword.length() == 0){
			keyword = null;
		} else {
			keyword = URLDecoder.decode(keyword,"utf-8");
		}
		PageParam pp = new PageParam(page,2);
		PageResult<MsgVO> list = msgService.queryMsgDetail(uid, touid, pp,keyword);
		
		TUser toUser = userService.queryUserByID(touid);

		set("msgs",list.getList());
		set("count",list.getItemCount());
		set("touid",touid);
		set("username",toUser.getUsername());
		set("taAvatarFileName",msgService.queryAvatarFileName(touid));
		set("myAvatarFileName",msgService.queryAvatarFileName(uid));
		set("curPage",page);
		set("pageCount",list.getPageCount());
		if(keyword == null){
			set("keyword","");
		} else {
			set("keyword",keyword);
		}
	}
	public void comment() throws Exception {
		
		Integer uid = getLoginUserId();
		Integer page = p2int("page");
		Integer type = p2int("type");
		String keyword = p("keyword");
			
		if(page == null)
			page = 1;
		if(type == null)
			type = 1;
		if(keyword == null || keyword.length() == 0){
			keyword = null;
		} else {
			keyword = URLDecoder.decode(keyword,"utf-8");
		}
		PageParam pp = new PageParam(page,20);	
		PageResult<CommentVO> commentList = commentService.queryMyComment(uid, pp, type,keyword);

		set("commentList",commentList.getList());
		set("sessionID",uid);
		set("pageCount",commentList.getPageCount());
		set("curPage",page);
		set("type",type); 
		if(keyword == null){
			set("keyword","");
		} else {
			set("keyword",keyword);
		}

	}
	public void about() throws Exception {
		Integer uid = getLoginUserId();
		Integer page = p2int("page");
		String keyword = p("keyword");
		if(page == null)
			page = 1;
		if(keyword == null || keyword.length() == 0){
			keyword = null;
		} else {
			keyword = URLDecoder.decode(keyword,"utf-8");
		}
		PageParam pp = new PageParam(page,20);
		PageResult<SnsUserInfoVO> userList = commentService.queryAboutMyComment(uid, pp,keyword);
		set("userList",userList.getList());
		set("userListCount",userList.getItemCount());
		set("count",userList.getList().size());
		set("pageCount",userList.getPageCount());
		set("curPage",page);
		if(keyword == null){
			set("keyword","");
		} else {
			set("keyword",keyword);
		}
	}

	
}
