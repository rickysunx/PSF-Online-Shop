package psf.action.sns;

import psf.PsfAction;
import psf.common.PsfTime;
import psf.entity.TApply;

public class ApplyAction extends PsfAction {

	public void checkApply() throws Exception {
		try{
			Integer uid = getLoginUserId();
			Integer fromuid = p2int("fromuid");
			Integer type = p2int("type");
			Integer checkstatus = p2int("checkstatus");
			Integer applyid = p2int("applyid");
			
			if(checkstatus == 2){
				TApply apply = applyService.queryApplyByID(applyid);
				apply.setCheckstatus(2);
				apply.setChecktime(new PsfTime().getTimeInSeconds());
				applyService.updateApply(apply);
			} else {
				TApply apply = applyService.queryApplyByID(applyid);
				apply.setCheckstatus(1);
				apply.setChecktime(new PsfTime().getTimeInSeconds());
				applyService.updateApply(apply);
				
				Boolean flag3 = followService.queryIsFollow(uid,fromuid);
				Boolean flag4 = followService.queryIsFollow(fromuid, uid);
				if(type == 1){
					Boolean flag1 = friendService.queryFriendIsExist(uid, fromuid);
					Boolean flag2 = friendService.queryFriendIsExist(fromuid, uid);
					if(!flag1 && !flag2 && !flag3 && !flag4){
						friendService.addFriend(uid, fromuid, 0);
						friendService.addFriend(fromuid, uid, 0);
						followService.addFollow(uid, fromuid, 0);
						followService.addFollow(fromuid, uid, 0);
					} else if(!flag1 && !flag2){
						friendService.addFriend(uid, fromuid, 0);
						friendService.addFriend(fromuid, uid, 0);
						if(!flag3){
							followService.addFollow(uid, fromuid, 0);
						} else if(!flag4){
							followService.addFollow(fromuid, uid, 0);
						}
					} else if(!flag2 && flag1){
						friendService.addFriend(fromuid, uid, 0);
						if(!flag3){
							followService.addFollow(uid, fromuid, 0);
						} else if(!flag4){
							followService.addFollow(fromuid, uid, 0);
						}
					} else if(!flag1 && flag2){
						friendService.addFriend(uid, fromuid, 0);
						if(!flag3){
							followService.addFollow(uid, fromuid, 0);
						} else if(!flag4){
							followService.addFollow(fromuid, uid, 0);
						}
					}
				} else {
					if(!flag3 && !flag4){
						followService.addFollow(uid, fromuid, 0);
						followService.addFollow(fromuid, uid, 0);
					} else if(!flag3 && flag4){
						followService.addFollow(uid, fromuid, 0);
					} else if(!flag4 && flag3){
						followService.addFollow(fromuid, uid, 0);
					}
				}
			}
		
			set("success",1);	
		}catch(Exception e){
			set("success",0);
			set("info",e.getMessage());
		}	
	}
	
	
	
}
