package psf.action.sns;

import java.util.List;

import psf.Psf;
import psf.PsfAction;
import psf.common.PsfTime;
import psf.entity.TMsg;
import psf.entity.TUser;
import psf.framework.PsfException;

public class MsgAction extends PsfAction {
	
	public void sendMsg() throws Exception {
		try {
			Integer msgfrom = getLoginUserId();
			
			if(msgfrom == null) {
				throw new PsfException("未登陆或超时，不能发信");
			}		
			
			Integer msgto = p2int("msgtouid");
			String msgcontent = p("content");
			
			Integer [] picids = ps2int("picid");
		
			if(msgto==null || msgto==0) {
				throw new PsfException("请填写收信人");
			}
			if(msgcontent==null || msgcontent.trim().length()==0) {
				throw new PsfException("消息内容不能为空");
			}
			if(msgcontent.trim().length()>200) {
				throw new PsfException("消息内容不能超过200个字");
			}	
			
			TUser user = userService.queryPrivateByUid(msgto);
			List<Integer> friendAndFollowList = friendService.queryMyFriendAndFollow(msgfrom);
			if(user.getAp_msg() == 3){
				throw new PsfException("对方设置了私信权限控制，您不能给Ta发私信");
			} else if(user.getAp_msg() == 2 && !friendAndFollowList.contains(msgto)){
				throw new PsfException("对方只允许Ta的好友或者关注发私信");
			} else {
				TMsg msg = new TMsg();		
				Integer addtime = new PsfTime().getTimeInSeconds();
				Integer delbyreader = 0;
				Integer delbysender = 0;
				Integer isread = 0;
				
				msg.setAddtime(addtime );
				msg.setDelbyreader(delbyreader);
				msg.setDelbysender(delbysender);
				msg.setIsread(isread);
				msg.setMsgcontent(msgcontent);
				msg.setMsgfrom(msgfrom);
				msg.setMsgto(msgto);
				int oid = msgService.addMsg(msg);
				if(picids!=null && picids.length>0) {
					picService.updatePic(picids, oid , Psf.OTYPE_Msg);
				}
				set("success",1);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			set("success",0);
			set("info",e.getMessage());
		}	
	}
	
	public void sendNewMsg() throws Exception{
		try{
			String username = p("sendNewName");
			String msgContent = p("newMsgContent");
			Integer msgfrom = getLoginUserId();
			Integer [] picids = ps2int("picid");
			
			if(username == null || username.trim().length() == 0){
				set("success",0);
				set("info","请输入收信人昵称");
			} else if (msgContent == null || msgContent.trim().length() == 0){
				set("success",0);
				set("info","发信内容不能为空");
			} else {
				TUser user = userService.queryUserByName(username);
				if(user == null){
					set("success",0);
					set("info","昵称不存在");
				} else {
					Integer msgto = user.getUid();
					Integer ap_msg = user.getAp_msg();
					List<Integer> friendAndFollowList = friendService.queryMyFriendAndFollow(msgfrom);
					if(ap_msg == 3){
						set("success",0);
						set("info","用户设置了私信权限，不能Ta他发信");
					} else if(ap_msg == 2 && !friendAndFollowList.contains(msgto)){
						set("success",0);
						set("info","用户只允许好友和关注给Ta发信");
					} else {
						TMsg msg = new TMsg();		
						Integer addtime = new PsfTime().getTimeInSeconds();
						Integer delbyreader = 0;
						Integer delbysender = 0;
						Integer isread = 0;
						
						msg.setAddtime(addtime );
						msg.setDelbyreader(delbyreader);
						msg.setDelbysender(delbysender);
						msg.setIsread(isread);
						msg.setMsgcontent(msgContent);
						msg.setMsgfrom(msgfrom);
						msg.setMsgto(msgto);
						int oid = msgService.addMsg(msg);
						if(picids!=null && picids.length>0) {
							picService.updatePic(picids, oid , Psf.OTYPE_Msg);
						}
						set("success",1);
					}
				}
			}
				
		}catch(Exception e){
			set("success",0);
			set("info",e.getMessage());
		}
	}
	public void readMsg() throws Exception {
		try{
			Integer msgfrom = p2int("uid");
			Integer msgto = getLoginUserId();
			msgService.updateMsgReadFlag(msgfrom, msgto);
			set("success",1);
		}catch(Exception e){
			set("success",0);
			set("info",e.getMessage());
		}
	}
	public void delMsgByUid() throws Exception {
		try{
			Integer msgfrom = p2int("uid");
			Integer msgto = getLoginUserId();
			msgService.updataDelFlag(msgfrom, msgto);
			set("success",1);
		}catch(Exception e){
			e.printStackTrace();
			set("success",0);
			set("info",e.getMessage());
		}
	}
	public void delMsgByMsgid() throws Exception {
		try{
			Integer msgid = p2int("msgid");
			Integer uid = getLoginUserId();
			msgService.delMsg(msgid, uid);
			set("success",1);
		}catch(Exception e){
			e.printStackTrace();
			set("success",0);
			set("info",e.getMessage());
		}	
	}
}
