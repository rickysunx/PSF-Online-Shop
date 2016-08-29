package psf.action.sns;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import psf.Psf;
import psf.PsfAction;
import psf.common.PsfTime;
import psf.entity.TApply;
import psf.entity.TFollowGroup;
import psf.entity.TFriend;
import psf.framework.PsfException;
import psf.service.sns.FollowService;
import psf.vo.sns.CheckedFollowGroupVO;

public class FollowAction extends PsfAction {
	
	public void add() throws Exception {
		try{
			if(getLoginUserId() == null){
				throw new PsfException("未登录或超时，不能加关注");
			}
			Integer followuid = p2int("uid");
			if(followuid == null || followuid.equals(0)){
				throw new PsfException("参数错误");
			}
			FollowService followService = new FollowService();
			followService.addFollow(getLoginUserId(), followuid,0);
			set("success", 1);
		}catch(Exception e){
			e.printStackTrace();
			set("success", 0);
			set("msg", e.getMessage());
		}
	}
	
	public void askForFollow() throws Exception {
		try {
			if(getLoginUserId() == null) {
				throw new PsfException("未登陆或超时，不能删除品论");
			}
			
			Integer touid = p2int("touid");
			String content = p("content");

			if(touid==null || touid==0) {
				throw new PsfException("参数错误");
			}
			if(content==null || content.trim().length()==0) {
				throw new PsfException("介绍内容不能为空");
			}
			if(content.trim().length()>100) {
				throw new PsfException("介绍内容不能超过100个字");
			}
			
			Integer otype = Psf.OTYPE_Ask_For_Follow;
			Integer oid = 0;
			Integer fromuid = getLoginUserId();
			Integer addtime = new PsfTime().getTimeInSeconds();
			String addip = getHexIP();
			Integer applytype = 2;	//#1-申请 2-邀请
			Integer checkstatus = 0;	//#0-未确认 1-确认通过 2-确认不通过

			Integer checktime = 0;
			Integer checkuid = 0;
			String checkreason = null;
			Integer delbyapplier = 0;
			Integer delbychecker = 0;
			
			TApply apply = new TApply();
			
			apply.setAddip(addip);
			apply.setAddtime(addtime);
			apply.setApplytype(applytype);
			apply.setCheckreason(checkreason);
			apply.setCheckstatus(checkstatus);
			apply.setChecktime(checktime);
			apply.setCheckuid(checkuid);
			apply.setContent(content);
			apply.setDelbyapplier(delbyapplier);
			apply.setDelbychecker(delbychecker);
			apply.setFromuid(fromuid);
			apply.setOid(oid);
			apply.setOtype(otype);
			apply.setTouid(touid);
			
			applyService.addApply(apply );
			
			set("success",1);
		} catch (Exception e) {
			e.printStackTrace();
			set("success",0);
			set("info",e.getMessage());
		}
	}
	
	public void del() throws Exception {
		try{
			if(getLoginUserId() == null){
				throw new PsfException("未登录或超时，不能取消关注");
			}
			Integer followuid = p2int("uid");
			Boolean b = friendService.queryFriendIsExist(getLoginUserId(), followuid);
			if(followuid == null || followuid.equals(0)){
				throw new PsfException("参数错误");
			} else if(b){
				set("success",0);
				set("msg","对方是你的好友，不能取消关注，除非解除好友关系");
			} else {
				followService.delFollow(getLoginUserId(), followuid);
				set("success", 1);
			}
		}catch(Exception e){
			e.printStackTrace();
			set("success", 0);
			set("msg", e.getMessage());
		}
	}
	
	public void fansDel() throws Exception {
		try{
			Integer uid = p2int("uid");
			followService.delFollow(uid, getLoginUserId());
			set("success",true);
		}catch(Exception e){
			e.printStackTrace();
			set("success", false);
			set("msg", e.getMessage());
		}
	}
	public void followGroupAdd() throws Exception {
		try{
			Integer uid = getLoginUserId();
			List<TFollowGroup> followGroups = followService.queryFollowGroup(uid);
			Boolean flag = false;
			String followgroupname = p("followgroupname");
			for(TFollowGroup followGroup:followGroups){
				if(followgroupname.equals(followGroup.getFollowgroupname())){
					flag = true;
					break;
				}
			}
			if(followgroupname == null || followgroupname.trim().length() == 0 ){
				set("success",false);
				set("info","分组名不能为空");
			} else if (followgroupname.length() > 15){
				set("success",false);
				set("info","分组名过长");
			} else if (flag) {
				set("success",false);
				set("info","分组已存在，请更换");
			} else if (followGroups.size() > 15){
				set("success",false);
				set("info","最多可创建15个分组");
			} else {	
				int followgroupid = followService.addFollowGroup(uid, followgroupname);
				set("success",true);
				set("followgroupid",followgroupid);
				set("followgroupname",followgroupname);
				set("groupCount",followGroups.size()+1);
				TFollowGroup followgroup = new TFollowGroup();
				followgroup.setDisplayorder(0);
				followgroup.setFollowgroupid(followgroupid);
				followgroup.setFollowgroupname(followgroupname);
				followgroup.setUid(uid);
				followGroups.add(followgroup);
				set("followGroups",followGroups);
			}		
		}catch(Exception e){
			e.printStackTrace();
			set("success",false);
			set("info",e.getMessage());
		}
	}
	public void followGroupDel() throws Exception {
		Integer followgroupid = p2int("followgroupid");
		Integer uid = getLoginUserId();
		try{
			followService.delFollowGroup(followgroupid, uid);
			set("success",true);
		}catch(Exception e){
			e.printStackTrace();
			set("success",false);
			set("info",e.getMessage());
		}
	}
	public void getFollowGroup() throws Exception {
		Integer followuid = p2int("followuid");
		Integer uid = getLoginUserId();
		
		List<TFollowGroup> followGroupAll = followService.queryFollowGroup(uid);
		List<TFollowGroup> followGroupList =  followService.queryFollowGroupByFriendId(uid, followuid);
		HashMap mapFollowGroup = new HashMap();
		for(TFollowGroup g:followGroupList) {
			mapFollowGroup.put(g.getFollowgroupid(), g.getFollowgroupid());
		}
		
		List<CheckedFollowGroupVO> checkedFollowGroupList = new ArrayList<CheckedFollowGroupVO>();
		
		for(TFollowGroup g:followGroupAll) {
			CheckedFollowGroupVO cfvo = new CheckedFollowGroupVO();
			cfvo.setUid(g.getUid());
			cfvo.setFollowgroupname(g.getFollowgroupname());
			cfvo.setFollowgroupid(g.getFollowgroupid());
			cfvo.setDisplayorder(g.getDisplayorder());
			cfvo.setChecked(mapFollowGroup.containsKey(g.getFollowgroupid()));
			checkedFollowGroupList.add(cfvo);
		}
		set("followGroupList",checkedFollowGroupList);
		set("followuid",followuid);
	}
	public void changeFollowGroup() throws Exception {
		Integer followuid = p2int("followuid");
		Integer [] followgroupids = ps2int("followgroupid");
		followService.updateFollowGroup(getLoginUserId(), followuid, followgroupids);
	}
	public void followGroupUpdate() throws Exception {
		Integer followgroupid = p2int("followgroupid");
		String followgroupname = p("newfollowgroupname");
		try {
			List<TFollowGroup> followGroups = followService.queryFollowGroup(getLoginUserId());
			Boolean flag = false;
			for(TFollowGroup followGroup:followGroups){
				if(followgroupname.equals(followGroup.getFollowgroupname())){
					flag = true;
					break;
				}
			}
			if(followgroupname == null || followgroupname.trim().length() == 0){
				set("success",false);
				set("info","请填写分组名");
			} else if(followgroupname.length() > 15){
				set("success",false);
				set("info","分组名过长请更换");
			} else if (flag) {
				set("success",false);
				set("info","分组已存在，请更换");
			} else if (followGroups.size() > 15){
				set("success",false);
				set("info","最多可创建16个分组");
			} else {	
				followService.updateFollowGroup(followgroupid, followgroupname);
				set("success",true);
			}		
		}catch(Exception e) {
			e.printStackTrace();
			set("success",false);
			set("info",e.getMessage());
		}
	}
	
	public void followGroupOrder() throws Exception {
		try {
			Integer [] followGroupIds = ps2int("fgid");
			Integer uid = getLoginUserId();
			
			followService.updateFollowGroupOrder(uid, followGroupIds);
			
			set("success","1");
		} catch (Exception e) {
			e.printStackTrace();
			set("success","0");
			set("info",e.getMessage());
		}
	}
	
	
}
