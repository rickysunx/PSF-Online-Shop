package psf.action.sns;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import psf.Psf;
import psf.PsfAction;
import psf.common.PageParam;
import psf.common.PageResult;
import psf.common.PsfTime;
import psf.common.PsfUtils;
import psf.entity.TApply;
import psf.entity.TFollowGroup;
import psf.entity.TFriendGroup;
import psf.entity.TIntroduce;
import psf.entity.TInviteCode;
import psf.framework.PsfException;
import psf.vo.sns.CheckedFriendGroupVO;
import psf.vo.sns.FriendVO;
import psf.vo.sns.IntroduceVO;
import psf.vo.sns.SnsUserInfoVO;

public class FriendAction extends PsfAction {
	
	//我的好友
	public void myFriend() throws Exception {
		List<TFriendGroup> friendGroupList = friendService.queryFriendGroupByUid(getLoginUserId());
		set("friendGroupList",friendGroupList);
		set("friendGroupCount",friendGroupList.size());	
		set("friendTab","myfriend");
	}
	public void getMyFriendItems() throws Exception {
		Integer friendGroup = p2int("otype");
		Integer page = p2int("page");
		String keyword = p("keyword");
		if(page == null)
			page = 1;
		PageResult<FriendVO> friends = null;
		PageParam pp = new PageParam(page,20);
		if(friendGroup == null || friendGroup == -1) {
			friends = friendService.queryFriendByUid(getLoginUserId(),null, keyword, pp);
		} else {
			friends = friendService.queryFriendByUid(getLoginUserId(), friendGroup, keyword, pp);
		}
		set("friends",friends);
		if(friendGroup == null){
			set("otype",-1);
		} else {
			set("otype",friendGroup);
		}
		if(keyword == null || "".equals(keyword)){
			set("keyword","");
		} else {
			set("keyword",keyword);
		}				
		set("curPage", page);	//当前页
		set("pageCount", friends.getPageCount());	//页面数
	}
	public void getTypeFriend() throws Exception {
		Integer page = p2int("page");
		Integer type = p2int("type");
		if(page == null)
			page = 1;
		PageResult<FriendVO> friends = null;
		PageParam pp = new PageParam(page,20);
		friends = friendService.queryFriendByType(getLoginUserId(), pp, type,1);
		set("type",type);
		set("friends",friends);		
		set("curPage", page);	//当前页
		set("pageCount", friends.getPageCount());	//页面数
		set("friendTab","myfriend");
	}
	
	//我的粉丝
	public void myFans() throws Exception {
		set("friendTab","myfans");
	}
	public void getMyFansItems() throws Exception {
		Integer page = p2int("page");
		String keyword = p("keyword");
		if(page == null)
			page = 1;
		PageResult<FriendVO> fans = null;
		PageParam pp = new PageParam(page,20);
		fans = followService.queryFansByUid(getLoginUserId(), keyword, pp);
		set("fans",fans);
		if(keyword == null || "".equals(keyword)){
			set("keyword","");
		} else {
			set("keyword",keyword);
		}				
		set("curPage", page);	//当前页
		set("pageCount", fans.getPageCount());	//页面数
	}
	
	public void getTypeFans() throws Exception {
		Integer page = p2int("page");
		Integer type = p2int("type");
		if(page == null)
			page = 1;
		PageResult<FriendVO> fans = null;
		PageParam pp = new PageParam(page,20);
		fans = friendService.queryFriendByType(getLoginUserId(), pp, type,3);
		set("type",type);
		set("fans",fans);		
		set("curPage", page);	//当前页
		set("pageCount", fans.getPageCount());	//页面数
		set("friendTab","myfans");
	}
	
	//我关注
	public void myFollow() throws Exception {
		List<TFollowGroup> followGroupList = followService.queryFollowGroup(getLoginUserId());
		set("followGroupList",followGroupList);
		set("followGroupCount",followGroupList.size());
		set("friendTab","myfollow");
	}
	public void getMyFollowItems() throws Exception {
		Integer followGroup = p2int("otype");
		Integer page = p2int("page");
		String keyword = p("keyword");
		if(page == null)
			page = 1;
		PageResult<FriendVO> follows = null;
		PageParam pp = new PageParam(page,20);
		if(followGroup == null || followGroup == -1 ) {
			follows = followService.queryFollowByUid(getLoginUserId(), null, keyword, pp);
		} else {
			follows = followService.queryFollowByUid(getLoginUserId(), followGroup, keyword, pp);
		}
		set("follows",follows);
		if(followGroup == null){
			set("otype",-1);
		} else {
			set("otype",followGroup);
		}
		if(keyword == null || "".equals(keyword)){
			set("keyword","");
		} else {
			set("keyword",keyword);
		}		
		set("curPage", page);	//当前页
		set("pageCount", follows.getPageCount());	//页面数
	}
	public void getTypeFollow() throws Exception {
		Integer page = p2int("page");
		Integer type = p2int("type");
		if(page == null)
			page = 1;
		PageResult<FriendVO> follows = null;
		PageParam pp = new PageParam(page,20);
		follows = friendService.queryFriendByType(getLoginUserId(), pp, type,2);
		set("type",type);
		set("follows",follows);		
		set("curPage", page);	//当前页
		set("pageCount", follows.getPageCount());	//页面数
		set("friendTab","myfollow");
	}
	public void followAll() throws Exception {
		try{
			Boolean flag = friendService.followAll(getLoginUserId());
			set("success",1);
			set("flag",flag);
		}catch(Exception e){
			e.printStackTrace();
			set("success",0);
			set("info",e.getMessage());
		}
	}
	
	//品友的好友
	public void psfFriend() throws Exception {
		set("friendTab","psffriend");
	}
	public void getPsfFriendItems() throws Exception {
		Integer type = p2int("type");
		Integer page = p2int("page");
		if(page == null)
			page = 1;	
		PageParam pp = new PageParam(page,20);
		PageResult<FriendVO> psfFriends = friendService.queryFriendOfFriend(getLoginUserId(), pp, type);
		if(psfFriends != null && psfFriends.getList().size() != 0){
			set("psfFriends",psfFriends);	
			set("curPage", page);	//当前页
			set("pageCount", psfFriends.getPageCount());	//页面数
		}
		set("type",type);
	}
	
	//好友邀请
	public void invite() throws Exception {
		set("friendTab","invite");
	}
	public void getPsfFriendInvite() throws Exception {
		Integer uid = getLoginUserId();
		
		TInviteCode code = new TInviteCode();
		String invitecode = PsfUtils.generateCode(10);
		code.setInvitecode(invitecode);
		code.setOid(0);
		code.setOtype(Psf.OTYPE_Friend);
		code.setUid(uid);
		code.setUsecount(0);
		code.setAddtime(new PsfTime().getTimeInSeconds());
		code.setIsvalid(1);
		snsService.addInviteCode(code);
		String url = "http://localhost/reg?uid="+uid+"&code="+invitecode;
		set("url",url);
	}
	

	//好友操作
	public void askForFriend() throws Exception {
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
			
			Integer otype = Psf.OTYPE_Friend;
			Integer oid = 0;
			Integer fromuid = getLoginUserId();
			Integer addtime = new PsfTime().getTimeInSeconds();
			String addip = getHexIP();
			Integer applytype = 1;	//#1-申请 2-邀请
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
	
	public void delFriend() throws Exception {
		try{
			Integer friendid = p2int("friendgroupid");
			Integer uid = getLoginUserId();
			friendService.delFriend(uid, friendid);
			set("success",true);
		}catch(Exception e){
			e.printStackTrace();
			set("success",false);
			set("info",e.getMessage());
		}
	}
	
	public void groupAdd() throws Exception {
		try{
			Integer uid = getLoginUserId();
			List<TFriendGroup> friendGroups = friendService.queryFriendGroupByUid(uid);
			Boolean flag = false;
			String friendgroupname = p("friendgroupname");
			for(TFriendGroup friendGroup:friendGroups){
				if(friendgroupname.equals(friendGroup.getFriendgroupname())){
					flag = true;
					break;
				}
			}
			if(friendgroupname == null || friendgroupname.trim().length() == 0 ){
				set("success",false);
				set("info","分组名不能为空");
			} else if (friendgroupname.length() > 15){
				set("success",false);
				set("info","分组名过长");
			} else if (flag) {
				set("success",false);
				set("info","分组已存在，请更换");
			} else if (friendGroups.size() > 15){
				set("success",false);
				set("info","最多可创建15个分组");
			} else {	
				int friendgroupid = friendService.addFriendGroup(uid, friendgroupname);
				set("success",true);
				set("friendgroupid",friendgroupid);
				set("friendgroupname",friendgroupname);
				set("groupCount",friendGroups.size()+1);
				TFriendGroup friendgroup = new TFriendGroup();
				friendgroup.setDisplayorder(0);
				friendgroup.setFriendgroupid(friendgroupid);
				friendgroup.setFriendgroupname(friendgroupname);
				friendgroup.setUid(uid);
				friendGroups.add(friendgroup);
				set("friendGroups",friendGroups);
			}		
		}catch(Exception e){
			e.printStackTrace();
			set("success",false);
			set("info",e.getMessage());
		}
	}
	
	public void updateFriendGroupOrder() throws Exception {
		Integer [] friendgroupids = ps2int("friendgroupid");
		friendService.updateFriendGroupOrder(getLoginUserId(), friendgroupids);
	}
	
	public void groupUpdate() throws Exception {
		Integer friendgroupid = p2int("friendgroupid");
		String friendgroupname = p("newfriendgroupname");
		try {
			List<TFriendGroup> friendGroups = friendService.queryFriendGroupByUid(getLoginUserId());
			Boolean flag = false;
			for(TFriendGroup friendGroup:friendGroups){
				if(friendgroupname.equals(friendGroup.getFriendgroupname())){
					flag = true;
					break;
				}
			}
			if(friendgroupname == null || friendgroupname.trim().length() == 0){
				set("success",false);
				set("info","请填写分组名");
			} else if(friendgroupname.length() > 15){
				set("success",false);
				set("info","分组名过长请更换");
			} else if (flag) {
				set("success",false);
				set("info","分组已存在，请更换");
			} else if (friendGroups.size() > 15){
				set("success",false);
				set("info","最多可创建16个分组");
			} else {	
				friendService.updateFriendGroupName(getLoginUserId(),friendgroupid, friendgroupname);
				set("success",true);
			}		
		}catch(Exception e) {
			e.printStackTrace();
			set("success",false);
			set("info",e.getMessage());
		}
	}
	
	public void groupDel() throws Exception {
		Integer friendgroupid = p2int("friendgroupid");
		Integer uid = getLoginUserId();
		try{
			friendService.delFriendGroup(friendgroupid, uid);
			set("success",true);
		}catch(Exception e){
			e.printStackTrace();
			set("success",false);
			set("info",e.getMessage());
		}
		
	}
	
	public void changeGroup() throws Exception {
		Integer friendid = p2int("friendid");
		Integer [] friendgroupids = ps2int("friendgroupid");
		friendService.updateFriendGroup(getLoginUserId(), friendid, friendgroupids);
	}
	
	public void getFriendGroup() throws Exception {
		Integer friendid = p2int("friendid");
		Integer uid = getLoginUserId();
		
		List<TFriendGroup> friendGroupAll = friendService.queryFriendGroupByUid(uid);
		List<TFriendGroup> friendGroupList =  friendService.queryFriendGroupByFriendId(uid, friendid);
		HashMap mapFriendGroup = new HashMap();
		for(TFriendGroup g:friendGroupList) {
			mapFriendGroup.put(g.getFriendgroupid(), g.getFriendgroupid());
		}
		
		List<CheckedFriendGroupVO> checkedFriendGroupList = new ArrayList<CheckedFriendGroupVO>();
		
		for(TFriendGroup g:friendGroupAll) {
			CheckedFriendGroupVO cfvo = new CheckedFriendGroupVO();
			cfvo.setUid(g.getUid());
			cfvo.setFriendgroupname(g.getFriendgroupname());
			cfvo.setFriendgroupid(g.getFriendgroupid());
			cfvo.setDisplayorder(g.getDisplayorder());
			cfvo.setChecked(mapFriendGroup.containsKey(g.getFriendgroupid()));
			checkedFriendGroupList.add(cfvo);
		}
		set("friendGroupList",checkedFriendGroupList);
		set("friendid",friendid);
	}
	
	public void groupOrder() throws Exception {
		try {
			Integer [] friendGroupIds = ps2int("fgid");
			Integer uid = getLoginUserId();
			
			friendService.updateFriendGroupOrder(uid, friendGroupIds);
			
			set("success","1");
		} catch (Exception e) {
			e.printStackTrace();
			set("success","0");
			set("info",e.getMessage());
		}
	}
	//收到引荐
	public void introducGet() throws Exception {
		set("introducTab","get");
		Integer uid = getLoginUserId();
		Integer page = p2int("page");
		if(page == null)
			page = 1;
		PageParam pp = new PageParam(page,2);
		PageResult<IntroduceVO> list = friendService.queryMyGetIntroduce(uid, pp);
		if(list != null){
			set("list",list.getList());
			set("curPage",page);
			set("pageCount",list.getPageCount());
		}
	}
	//发出引荐
	public void introducSend() throws Exception {
		set("introducTab","send");
		Integer uid = getLoginUserId();
		Integer page = p2int("page");
		if(page == null)
			page = 1;
		PageParam pp = new PageParam(page,2);
		PageResult<IntroduceVO> list = friendService.queryMySendIntroduce(uid, pp);
		if(list != null){
			set("list",list.getList());
			set("curPage",page);
			set("pageCount",list.getPageCount());
		}
	}
	public void tuijianFriend() throws Exception {
		Integer uid = getLoginUserId();
		Integer friendid = p2int("friendid");
		Integer type = p2int("type");
		String keyword = p("keyword");
		Integer page = p2int("page");
		String username = p("username");
		String fuids = p("fuids");
		if(type == null)
			type = 1;
		if(page == null)
			page = 1;
		PageParam pp = new PageParam(page,2);
		PageResult<SnsUserInfoVO> user = friendService.queryTuijianFriend(uid, friendid, type, pp, keyword);
		if(fuids != null && fuids.length() > 0){
			fuids = fuids.substring(0, fuids.length()-1);
		}
		set("fuids",fuids);
		set("userList",user.getList());
		set("type",type);
		set("keyword",keyword);
		set("username",username);
		set("friendid",friendid);
		set("curPage",page);
		set("pageCount",user.getPageCount());
		
//		System.out.println("当前用户:"+uid+"推荐用户："+friendid+"推荐用户名："+username+"推荐类型："+type+"页数:"+page+"搜索关键字:"+keyword);
	}
	
	public void introduceFriend() throws Exception {
		Integer uid = getLoginUserId();
		Integer friendid = p2int("friendid");
		Integer type = p2int("type");
		String keyword = p("keyword");
		Integer page = p2int("page");
		String username = p("username");
		String fuids = p("fuids");
		if(type == null)
			type = 1;
		if(page == null)
			page = 1;
		PageParam pp = new PageParam(page,2);
		PageResult<SnsUserInfoVO> user = friendService.queryTuijianFriend(uid, friendid, type, pp, keyword);
		if(fuids != null && fuids.length() > 0){
			fuids = fuids.substring(0, fuids.length()-1);
		}
		set("fuids",fuids);
		set("userList",user.getList());
		set("type",type);
		set("keyword",keyword);
		set("username",username);
		set("friendid",friendid);
		set("curPage",page);
		set("pageCount",user.getPageCount());
	}
	
	public void saveTuijian() throws Exception {
		try{
			Integer uid = getLoginUserId();
			String fuids = p("fuids");
			String content = p("content");
			Integer friendid = p2int("friendid");
			fuids = fuids.substring(0, fuids.length()-1);
			String[] str = fuids.split(",");
			
			for(int i=0;i<str.length;i++){
				TIntroduce introduce = new TIntroduce();
				introduce.setAddtime(new PsfTime().getTimeInSeconds());
				introduce.setUid(uid);
				introduce.setFromuid(friendid);
				introduce.setIntrocontent(content);
				introduce.setTouid(Integer.parseInt(str[i]));
				introduce.setDelbyreader(0);
				introduce.setDelbysender(0);
				friendService.addIntroduct(introduce);
			}
			set("success",1);
		}catch(Exception e){
			set("success",0);
			set("info",e.getMessage());
		}		
	}
	
	public void saveIntroduce() throws Exception {
		try{
			Integer uid = getLoginUserId();
			String fuids = p("fuids");
			String content = p("content");
			Integer friendid = p2int("friendid");
			fuids = fuids.substring(0, fuids.length()-1);
			String[] str = fuids.split(",");
			
			if(uid == null){
				throw new PsfException("未登录或超时");
			}
			
			for(int i=0;i<str.length;i++){
				TIntroduce introduce = new TIntroduce();
				introduce.setAddtime(new PsfTime().getTimeInSeconds());
				introduce.setUid(uid);
				introduce.setFromuid(Integer.parseInt(str[i]));
				introduce.setIntrocontent(content);
				introduce.setTouid(friendid);
				introduce.setDelbyreader(0);
				introduce.setDelbysender(0);
				friendService.addIntroduct(introduce);
			}
			set("success",1);
		}catch(Exception e){
			set("success",0);
			set("info",e.getMessage());
		}	
	}
	
	public void delIntroduce() throws Exception {
		try{
			Integer uid = p2int("uid");
			Integer touid = getLoginUserId();
			if(touid == null){
				set("success",1);
				set("info","登陆后再删除");
			} else {
				friendService.delIntroduce(uid, touid);
				set("success",1);
			}
		}catch(Exception e){
			set("success",0);
			set("info",e.getMessage());
		}
	}
	public void delSendIntroduce() throws Exception {
		try{
			Integer uid = getLoginUserId();
			Integer touid = p2int("uid");
			if(uid == null){
				set("success",1);
				set("info","登陆后再删除");
			} else {
				friendService.delSendIntroduce(uid, touid);
				set("success",1);
			}
		}catch(Exception e){
			set("success",0);
			set("info",e.getMessage());
		}
	}
	public void allCheck() throws Exception {
		try{
			Integer uid = getLoginUserId();
			Integer friendid = p2int("friendid");
			Integer type = p2int("type");
			
			List<Integer> list = friendService.queryFriendByType(uid, friendid, type);
			set("list",list);
			set("success",1);
		}catch(Exception e){
			set("success",0);
			set("info",e.getMessage());
		}
	}
	
	public void searchFriend() throws Exception {

		Integer uid = getLoginUserId();
		Integer type = p2int("type");
		Integer page = p2int("page");
		String keyword = p("keyword");
		String searchUid = p("searchUid");
		
		if(page == null)
			page = 1;
		if(keyword == null || keyword.length() ==  0)
			keyword = null;
		PageParam pp = new PageParam(page,2);
		PageResult<FriendVO> friendList = friendService.searchFriend(uid, pp, type, keyword);
		set("friendList",friendList.getList());
		set("curPage",page);
		set("pageCount",friendList.getPageCount());
		set("type",type);
		set("keyword",keyword);	
		set("count",friendList.getItemCount());
		set("num",pp.getPageSize());
		if(searchUid != null && searchUid.length() > 0){
			set("suid",searchUid);
		}
	}
	
	
	
	
	
	
	
	
	
	
	
}
