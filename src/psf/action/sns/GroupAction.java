
package psf.action.sns;

import java.net.URLDecoder;
import java.util.List;

import psf.Psf;
import psf.PsfAction;
import psf.common.PageParam;
import psf.common.PageResult;
import psf.common.PsfTime;
import psf.common.PsfUtils;
import psf.entity.TApply;
import psf.entity.TGroup;
import psf.entity.TGroupClass;
import psf.entity.TGroupMember;
import psf.entity.TInviteCode;
import psf.entity.TPost;
import psf.entity.TUrl;
import psf.entity.TZone;
import psf.service.common.ZoneService;
import psf.service.sns.GroupService;
import psf.service.sns.PostService;
import psf.service.sns.TopicService;
import psf.vo.sns.ApplyVO;
import psf.vo.sns.GroupVO;
import psf.vo.sns.LikeUserVO;
import psf.vo.sns.PostListItemVO;
import psf.vo.sns.RightGroupVO;
import psf.vo.sns.TopicVO;

public class GroupAction extends PsfAction {
	public void squareGroup() throws Exception {
		set("groupTab","squaregroup");
	}
	public void myGroup() throws Exception {
		set("groupTab","mygroup");
	}
	public void topicGroup() throws Exception {
		set("groupTab","topicgroup");
	}
	public void editGroupInfo() throws Exception {
		set("groupTab","editgroupinfo");
		
		GroupService groupService = new GroupService();
		List<TGroupClass> groupclass = groupService.queryGroupClass(null);
		set("groupclass", groupclass);
		
		ZoneService zoneService = new ZoneService();
		List<TZone> provinces = zoneService.queryZoneByLevel(1);
		List<TZone> cities = zoneService.queryZoneChildren(provinces.get(0).getZoneid());
		set("provinces", provinces);
		set("cities", cities);
	}
	/*
	public void editGroupAvatar() throws Exception {
		set("groupTab","editgroupavatar");
	}*/
	public void manageInfo() throws Exception {
		Integer groupid = p2int("groupid");
		GroupService groupService = new GroupService();
		GroupVO group = groupService.queryGroupById(groupid, getLoginUserId());
		set("group", group);
	}
	/*
	public void manageAvatar() throws Exception {
		set("groupTab","manageavatar");
	}
	public void manageAnnouncement() throws Exception {
		set("groupTab","manageannouncement");
	}
	public void manageMember() throws Exception {
		set("groupTab","managemember");
	}
	public void manageApply() throws Exception {
		set("groupTab","manageapply");
	}*/
	/**
	 * 站内邀请
	 */
	public void manageInviteAbout() throws Exception {
		Integer groupid = p2int("groupid");
		GroupService groupService = new GroupService();
		GroupVO group = groupService.queryGroupById(groupid, getLoginUserId());
		set("group", group);
	}
	
	/**
	 * 站外邀请
	 * @throws Exception
	 */
	public void manageInviteFriend() throws Exception {
		Integer groupid = p2int("groupid");
		if(getLoginUserId() == null){
			throw new Exception("用户未登录");
		}
		GroupService groupService = new GroupService();
		GroupVO group = groupService.queryGroupById(groupid, getLoginUserId());
		set("group", group);
		//生成邀请链接
		TInviteCode code = new TInviteCode();
		String invitecode = PsfUtils.generateCode(6);
		code.setInvitecode(invitecode);
		code.setOid(groupid);
		code.setOtype(Psf.OTYPE_Group);
		code.setUid(getLoginUserId());
		code.setUsecount(0);
		code.setAddtime(new PsfTime().getTimeInSeconds());
		code.setIsvalid(1);
		snsService.addInviteCode(code);
		
		String url = "http://localhost/reg?groupid="+groupid+"&uid="+getLoginUserId()+"&code="+invitecode;
		set("url",url);
	}
	
	/**
	 * 圈子详细首页——圈子发言列表页
	 * @throws Exception
	 */
	public void detailGroup() throws Exception {
		Integer groupid = p2int("groupid");
		/*
		Integer uid = p2int("uid");	//邀请发起人的ID
		String invitecode = p("code");
		
		if(invitecode != null && uid!= null){
			TInviteCode code = snsService.queryInviteCode(invitecode, groupid, Psf.OTYPE_Group, uid);
			if(code != null){
				if(groupService.queryGroupMemberById(groupid, getLoginUserId()) == null){	//成员不在圈子中
					TGroupMember member = new TGroupMember();
					member.setGroupid(groupid);
					member.setUid(getLoginUserId());
					member.setAddtime(new PsfTime().getTimeInSeconds());
					member.setLasttime(new PsfTime().getTimeInSeconds());
					member.setRole(0);
					member.setPostcount(0);
					groupService.addGroupMember(member);
					
					groupService.updateMemberCount(groupid);
				}
			}
		}
		*/
		GroupVO group = groupService.queryGroupById(groupid, getLoginUserId());
		set("group", group);
		LikeUserVO user = groupService.queryGroupMember(groupid, 7, getLoginUserId(), null, 3, new PageParam(1,1)).getList().get(0);	//圈主
		set("creator", user);
		PageResult<PostListItemVO> result = postService.queryGroupAnnoucement(groupid, new PageParam(1,1));
		if(result != null){
			set("announcement", result.getList().get(0));
		}
	}
	
	/**
	 * 圈子话题列表页面
	 * @throws Exception
	 */
	public void detailGroupTopiclist() throws Exception {
		Integer groupid = p2int("groupid");
		GroupService groupService = new GroupService();
		GroupVO group = groupService.queryGroupById(groupid, getLoginUserId());
		set("group", group);
		LikeUserVO user = groupService.queryGroupMember(groupid, 7, getLoginUserId(), null, 3, new PageParam(1,1)).getList().get(0);	//圈主
		set("creator", user);
		PageResult<PostListItemVO> result = postService.queryGroupAnnoucement(groupid, new PageParam(1,1));
		if(result != null){
			set("announcement", result.getList().get(0));
		}
	}
	/**
	 * 圈子话题详细页面,根据圈子ID和话题Title进入圈子
	 * @throws Exception
	 */
	public void detailGroupTopicdetail() throws Exception {
		String uri = getURI();
		String groupidStr = uri.substring(uri.lastIndexOf("/")+1).trim();
		Integer groupid = Integer.parseInt(groupidStr);
		
		Integer index = uri.substring(0, uri.lastIndexOf("/")).lastIndexOf("/");	//倒数第二个"/"的位置
		String topictitle = uri.substring(index+1, uri.lastIndexOf("/"));
		topictitle = URLDecoder.decode(topictitle, "utf-8");
		
		TopicService topicService = new TopicService();
		TopicVO topic = topicService.queryTopicByGroupId(groupid, topictitle);
		set("topic", topic);
		
		if(topic != null){
			GroupVO group = groupService.queryGroupById(topic.getGroupid(), getLoginUserId());
			set("group",group);
			
			LikeUserVO user = groupService.queryGroupMember(group.getGroupid(), 7, getLoginUserId(), null, 3, new PageParam(1,1)).getList().get(0);	//圈主
			set("creator", user);
		}
	}
	/**
	 * 圈子圈友列表页面
	 * @throws Exception
	 */
	public void detailGroupFriend() throws Exception {
		Integer groupid = p2int("groupid");
		GroupService groupService = new GroupService();
		GroupVO group = groupService.queryGroupById(groupid, getLoginUserId());
		set("group", group);
		LikeUserVO user = groupService.queryGroupMember(groupid, 7, getLoginUserId(), null, 3, new PageParam(1,1)).getList().get(0);	//圈主
		set("creator", user);
		PageResult<PostListItemVO> result = postService.queryGroupAnnoucement(groupid, new PageParam(1,1));
		if(result != null){
			set("announcement", result.getList().get(0));
		}
	}

	public void getChildZone() throws Exception {
		Integer parentid = p2int("parentid");
		ZoneService zoneService = new ZoneService();
		List<TZone> childs = null;
		if(parentid != null){
			childs =zoneService.queryZoneChildren(parentid);
		}
		set("childs", childs);
	}
	
	public void saveGroup() throws Exception {
		try{
			String reg = "[,|\\\\s|,\\\\s|\\\\s,]+";
			String message = null;
			Integer success = 0;
			String groupname = p("group_name");
			String groupintro = p("group_intro").trim();
			Integer groupclass = p2int("group_class");
			Integer addr_province = p2int("addr_province");
			Integer addr_city = p2int("addr_city");
			String grouptag = p("group_tag");
			Integer grouptype = p2int("group_type");
			Integer jointype = null;
			if(grouptype.equals(1)){
				jointype = p2int("join_type");
				grouptype = jointype;
			}
			Integer groupid = p2int("groupid");
			
			if(groupname == null || groupname.equals("")){
				message = "圈子名称不能为空!";
			}else if(groupintro == null || groupintro.equals("") || groupintro.length()>70){
				message = "圈子介绍内容字数不符合要求!";
			}else if(groupclass == null){
				message = "未选择圈子分类!";
			}else if(addr_province == null || addr_city == null){
				message = "地址填写错误!";
			}else if(grouptag == null || grouptag.split(reg).length > 5){
				message = "圈子标签错误!";
			}else if(grouptype == null){
				message = "未选择圈子类别!";
			}else{
				TGroup group = new TGroup();
				group.setGroupname(groupname);
				group.setGroupclassid(groupclass);
				group.setUid(getLoginUserId());
				group.setPicid(1028);	//默认
				group.setGrouptype(grouptype);
				PsfTime time1 = new PsfTime();
				group.setAddtime(time1.getTimeInSeconds());
				group.setAddip(getHexIP());
				group.setMembercount(1);	//圈子初始成员为1
				group.setIntro(groupintro);
				group.setZoneid(addr_city);
				group.setGrouptag(grouptag);
				group.setDelflag(0);
				
				GroupService groupService = new GroupService();
				if(groupid != null){	//更新
					group.setGroupid(groupid);
					groupService.updateGroup(group);
				}else{	//添加
					groupid = groupService.addGroup(group);
					
					TGroupMember groupmember = new TGroupMember();
					groupmember.setGroupid(groupid);
					groupmember.setUid(getLoginUserId());
					groupmember.setRole(2);
					PsfTime time2 = new PsfTime();
					groupmember.setAddtime(time2.getTimeInSeconds());
					groupmember.setLasttime(time2.getTimeInSeconds());
					groupmember.setPostcount(0);
					groupService.addGroupMember(groupmember);
					
					set("groupid", groupid);
				}
				
				success = 1;
			}
			set("message", message);
			set("success", success);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void getRecommendation() throws Exception {
		String keyword = p("keyword");
		if(keyword.equals("null") || keyword.equals("圈子搜索")){
			keyword = null;
		}
		PageParam pp = new PageParam(1, 18);
		PageResult<GroupVO> recommend_groups = groupService.queryGroupRecommend(getLoginUserId(), pp);
		set("recommend_groups", recommend_groups);
	}
	
	/**
	 * 圈子首页发言列表
	 * @throws Exception
	 */
	public void getTopicContent() throws Exception {
		Integer type = p2int("type");
		if(type == null){
			type = 0;
		}
		set("type", type);
		Integer orderby = p2int("orderby");
		if(orderby == null){
			orderby = 1;
		}
		set("orderby", orderby);
		String keyword = p("keyword");
		if(keyword.equals("null")||keyword.equals("圈子发言搜索")){
			keyword = null;
		}
		set("keyword", keyword);
		Integer page = p2int("page");
		if(page == null){
			page = 1;
		}
		set("curPage", page);
		PageParam pp = new PageParam(page, 20);
		PostService postService = new PostService();
		PageResult<PostListItemVO> posts = postService.queryGroupPost(type, getLoginUserId(), null, null, keyword, orderby, pp);
		if(posts != null){
			set("postListItems", posts.getList());
			set("pageCount", posts.getPageCount());
		}
	}
	
	public void getMyGroup() throws Exception {
		Integer type = p2int("type");
		if(type == null){
			type =1;
		}
		set("type", type);
		Integer orderby = p2int("orderby");
		if(orderby == null){
			orderby = 1;
		}
		set("orderby", orderby);
		String keyword = p("keyword");
		if(keyword.equals("null") || keyword.equals("圈子搜索")){
			keyword = null;
		}
		set("keyword", keyword);
		Integer page = p2int("page");
		if(page == null){
			page = 1;
		}
		set("page", page);
		PageParam pp = new PageParam(page,4);
		GroupService groupService = new GroupService();
		if(getLoginUserId() != null){
			PageResult<GroupVO> groups = groupService.queryGroupByUid(type, getLoginUserId(), orderby, keyword, pp);
			if(groups != null){
				set("grouplist", groups.getList());
				set("pageCount", groups.getPageCount());
			}
		}
	}
	
	/**
	 * 圈子广场品友圈子请求
	 * @throws Exception
	 */
	public void getPsfFriendGroup() throws Exception {
		Integer type = p2int("type");
		set("type", type);
		Integer page = p2int("page");
		if(page == null){
			page = 1;
		}
		set("page", page);
		PageParam pp = new PageParam(page,6);
		GroupService groupService = new GroupService();
		if(getLoginUserId() != null){
			PageResult<GroupVO> groups = groupService.queryGroupByUserType(getLoginUserId(), type, pp);
			if(groups != null){
				set("grouplist", groups.getList());
				set("pageCount", groups.getPageCount());
			}
		}
	}
	
	/**
	 * 圈子广场热门圈子请求
	 * @throws Exception
	 */
	public void getHotGroup() throws Exception {
		Integer classid = p2int("classid");
		set("classid", classid);
		Integer page = p2int("page");
		if(page == null){
			page = 1;
		}
		set("page", page);
		PageParam pp = new PageParam(page,21);
		GroupService groupService = new GroupService();
		PageResult<GroupVO> groups = groupService.queryGroupByClass(getLoginUserId(), classid, null, pp);
		if(groups != null){
			set("grouplist", groups.getList());
			set("pageCount", groups.getPageCount());
		}
	}
	
	/**
	 * 圈子热门话题
	 * @throws Exception
	 */
	public void getHotTopic() throws Exception{
		Integer groupid =p2int("groupid");
		set("groupid", groupid);
		Integer page = p2int("page");
		if(page == null){
			page = 1;
		}
		set("page",page);
		PageParam pp = new PageParam(page, 6);
		TopicService topicService  = new TopicService();
		PageResult<TopicVO> topics = topicService.queryTopicVOByUid(1, 0, null, groupid, null, 2, pp);
		if(topics != null){
			set("topiclist", topics.getList());
			set("pageCount", topics.getPageCount());
		}
	}
	
	/**
	 * 圈子的最新发言
	 * @throws Exception
	 */
	public void getLatestComment() throws Exception {
		String keyword = p("keyword");
		if(keyword.equals("null") || keyword.equals("圈子发言搜索")){
			keyword = null;
		}
		PageParam pp = new PageParam(1,5);
		PageResult<PostListItemVO> posts = postService.queryGroupPost(0, getLoginUserId(), null, null, keyword, 1, pp);
		if(posts != null){
			set("postlist", posts.getList());
			set("pageCount", posts.getPageCount());
		}
	}
	
	/**
	 * 圈子详细发言列表
	 * @throws Exception
	 */
	public void getGroupPostList() throws Exception {
		Integer type = p2int("type");
		if(type == null){
			type = 0;
		}
		set("type", type);
		String keyword = p("keyword");
		if(keyword.equals("null") || keyword.equals("搜索发言")){
			keyword = null;
		}
		set("keyword", keyword);
		Integer orderby = p2int("orderby");
		if(orderby==null){
			orderby = 1;
		}
		set("orderby", orderby);
		Integer page = p2int("page");
		if(page == null){
			page = 1;
		}
		set("page", page);
		Integer curUid = getLoginUserId();
		if(curUid == null){
			throw new Exception("未登录");
		}
		Integer groupid = p2int("groupid");
		if(groupid == null) {
			throw new Exception("参数错误");
		}
		PageParam pp = new PageParam(page, 20);
		PageResult<PostListItemVO> posts = postService.queryGroupPostByType(groupid, type, curUid, keyword, orderby, pp);
		if(posts != null){
			set("postListItems", posts.getList());
			set("pageCount", posts.getPageCount());
		}
		set("Tab","group_detail_postlist");
	}
	
	/**
	 * 圈子话题列表
	 * @throws Exception
	 */
	public void getGroupTopicList() throws Exception {
		Integer type = p2int("type");
		if(type == null){
			type = 0;
		}
		set("type", type);
		String keyword = p("keyword");
		if(keyword.equals("null") || keyword.equals("搜索话题")){
			keyword = null;
		}
		set("keyword", keyword);
		Integer orderby = p2int("orderby");
		if(orderby==null){
			orderby = 1;
		}
		set("orderby", orderby);
		Integer page = p2int("page");
		if(page == null){
			page = 1;
		}
		set("page", page);
		if(getLoginUserId() == null){
			throw new Exception("未登录");
		}
		Integer groupid = p2int("groupid");
		if(groupid == null) {
			throw new Exception("参数错误");
		}
		PageParam pp = new PageParam(page, 20);
		TopicService topicService = new TopicService();
		PageResult<TopicVO> topics = topicService.queryTopicVOByUid(1, type, getLoginUserId(), groupid, keyword, orderby, pp);
		if(topics != null){
			set("topiclist", topics.getList());
			set("pageCount", topics.getPageCount());
		}
	}
	
	/**
	 * 圈子详细圈友列表
	 * @throws Exception
	 */
	public void getGroupFriendList() throws Exception {
		Integer type = p2int("type");
		if(type == null){
			type = 0;
		}
		set("type", type);
		String keyword = p("keyword");
		if(keyword.equals("null") || keyword.equals("搜索圈友")){
			keyword = null;
		}
		set("keyword", keyword);
		Integer orderby = p2int("orderby");
		if(orderby==null){
			orderby = 1;
		}
		set("orderby", orderby);
		Integer page = p2int("page");
		if(page == null){
			page = 1;
		}
		set("page", page);
		if(getLoginUserId() == null){
			throw new Exception("未登录");
		}
		Integer groupid = p2int("groupid");
		if(groupid == null) {
			throw new Exception("参数错误");
		}
		set("groupid", groupid);
		PageParam pp = new PageParam(page, 20);
		GroupService groupService = new GroupService();
		PageResult<LikeUserVO> users = groupService.queryGroupMember(groupid, type, getLoginUserId(), keyword, orderby, pp);
		if(users != null){
			set("userlist", users.getList());
			set("pageCount", users.getPageCount());
		}
		
		Integer cur_role = groupService.queryRoleInGroup(groupid, getLoginUserId());
		set("cur_role", cur_role);
	}
	
	/**
	 * 话题详细发言列表
	 * @throws Exception
	 */
	public void getTopicPostList() throws Exception {
		Integer groupid = p2int("groupid");
		set("groupid", groupid);
		String topictitle = p("topictitle");
		set("topictitle", topictitle);
		Integer page = p2int("page");
		if(page == null){
			page = 1;
		}
		set("page", page);
		Integer orderby = p2int("orderby");
		if(orderby == null){
			orderby = 1;
		}
		set("orderby", orderby);
		if(topictitle == null || groupid == null){
			throw new Exception("参数错误");
		}if(getLoginUserId() == null){
			throw new Exception("未登录");
		}
		PageParam pp = new PageParam(page,20);
		PageResult<PostListItemVO> posts = postService.queryTopicPost(getLoginUserId(), 1, groupid, topictitle, orderby, pp);
		if(posts != null){
			set("postListItems", posts.getList());
			set("pageCount", posts.getPageCount());
		}
		set("Tab", "topic_detail_postlist");
	}
	
	/**
	 * 圈子管理局部页面加载控制
	 * @throws Exception
	 */
	public void manage() throws Exception{
		Integer groupid = p2int("groupid");
		if(groupid == null){
			throw new Exception("参数错误!");
		}
		set("groupid", groupid);
		Integer type = p2int("type");
		if(type == null){
			type = 1;
		}
		set("type", type);
		if(getLoginUserId() == null){
			throw new Exception("未登录");
		}
		if(type.equals(1)){
			GroupVO group = groupService.queryGroupById(groupid, getLoginUserId());
			set("group", group);
			
			TZone parentZone = null;
			if(group.getZoneid() != null){
				parentZone = zoneService.queryParentZone(group.getZoneid());
				set("parentid", parentZone.getZoneid());
			}
			
			GroupService groupService = new GroupService();
			List<TGroupClass> groupclass = groupService.queryGroupClass(null);
			set("groupclass", groupclass);
			
			ZoneService zoneService = new ZoneService();
			List<TZone> provinces = zoneService.queryZoneByLevel(1);
			List<TZone> cities = zoneService.queryZoneChildren(parentZone.getZoneid());
			set("provinces", provinces);
			set("cities", cities);
			
		}else if(type.equals(2)){
			TGroup group = groupService.queryGroupById(groupid);
			set("group", group);
		}else if(type.equals(3)){
			PageParam pp = new PageParam(1,50);	//默认显示最近的5条公告
			PageResult<PostListItemVO> announs = postService.queryGroupAnnoucement(groupid, pp);
			if(announs != null){
				set("announs", announs.getList());
			}
		}else if(type.equals(4)){
			
		}else if(type.equals(5)){
			
		}
	}
	
	/**
	 * 发表公告
	 * @throws Exception
	 */
	public void saveAnnouncement() throws Exception {
		Integer groupid = p2int("groupid");
		String content = p("announcement");
		String message = null;
		Integer success = 0;
		try{
			if(getLoginUserId() == null){
				message = "用户未登录";
			}else if(groupid == null){
				message = "参数错误";
			}else if(content == null || content.trim().length()<=0){
				message = "公告内容不能为空";
			}else{
				TPost post = new TPost();
				post.setUid(getLoginUserId());
				post.setPosttype(Psf.OTYPE_Announcement);
				post.setTypeid(groupid);
				post.setContent(content);
				post.setAddtime(new PsfTime().getTimeInSeconds());
				post.setAddip(getHexIP());
				post.setDelflag(0);
				postService.addPost(post);
				success = 1;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		set("success", success);
		set("message", message);
	}
	
	/**
	 * 删除公告
	 * @throws Exception
	 */
	public void delAnnouncement() throws Exception {
		Integer postid = p2int("postid");
		String message = null;
		Integer success = 0;
		try{
			if(getLoginUserId() == null){
				message = "用户未登录";
			}else if(postid == null){
				message = "参数错误";
			}else{
				postService.delPost(postid);
				success = 1;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		set("success", success);
		set("message", message);
	}
	
	/**
	 * 圈子成员列表
	 * @throws Exception
	 */
	public void getMemberList() throws Exception {
		if(getLoginUserId()==null){
			throw new Exception("用户未登录");
		}
		Integer groupid = p2int("groupid");
		if(groupid == null){
			throw new Exception("参数错误");
		}
		Integer type = p2int("type");
		if(type==null || type.equals("null")){
			type = null;
		}
		String keyword = p("keyword");
		if(keyword.equals("null") || keyword.equals("请输入用户名")){
			keyword = null;
		}
		Integer orderby = p2int("orderby");
		if(orderby == null){
			orderby = 1;
		}
		Integer page = p2int("page");
		if(page == null){
			page = 1;
		}
		set("page", page);
		PageParam pp = new PageParam(page, 20);
		PageResult<LikeUserVO> users = groupService.queryGroupMember(groupid, type, getLoginUserId(), keyword, orderby, pp);
		if(users != null){
			set("userlist", users.getList());
			set("pageCount", users.getPageCount());
			set("count", users.getItemCount());
		}
		
		GroupVO group = groupService.queryGroupById(groupid, getLoginUserId());
		set("g", group);	
	}
	
	/**
	 * 一键删除圈友
	 * @throws Exception
	 */
	public void delGroupFriend() throws Exception {
		Integer[] uids = ps2int("userid"); 
		Integer groupid = p2int("groupid");
		Integer quit = p2int("quit");
		Integer uid = getLoginUserId();
		Integer success = 0;
		String message = null;
		try{
			if(uid == null){
				message = "用户未登录";
			}else if((quit == null || uids == null) && groupid == null){
				message = "参数错误";
			}else if(quit != null){
				groupService.delGroupMember(groupid, getLoginUserId());
				groupService.updateMemberCount(groupid);
				success = 1;
				message = "退出成功";
				TGroup group = groupService.queryGroupById(groupid);
				set("groupid", group.getGroupid());
				set("grouptype", group.getGrouptype());
			}else{
				for(Integer id : uids){
					groupService.delGroupMember(groupid, id);
				}
				groupService.updateMemberCount(groupid);
				success = 1;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		set("success", success);
		set("message", message);
	}
	
	/**
	 * 圈主管理圈子管理员
	 * @throws Exception
	 */
	public void manageAdmin() throws Exception {
		Integer type = p2int("type");
		Integer groupid = p2int("groupid");
		Integer uid = p2int("uid");
		Integer success = 0;
		String message = null;
		try{
			if(getLoginUserId() == null){
				message = "用户未登录";
			}else if(type== null || uid == null || groupid == null){
				message = "参数错误";
			}else{
				TGroupMember member = groupService.queryGroupMemberById(groupid, uid);
				member.setRole(type);
				groupService.updateGroupMember(member);
				success = 1;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		set("success", success);
		set("message", message);
	}
	
	/**
	 * 申请加入圈子
	 * @throws Exception
	 */
	public void apply() throws Exception {
		Integer groupid = p2int("groupid");
		Integer grouptype = p2int("grouptype");
		String content = p("content");
		Integer success = 0;
		String message = null;
		try{
			if(getLoginUserId() == null){
				message = "用户未登录";
			}else if(groupid == null || grouptype == null || content == null){
				message = "参数错误";
			}else{
				if(grouptype.equals(1)){	//自由加入
					TGroupMember member = new TGroupMember();
					member.setGroupid(groupid);
					member.setUid(getLoginUserId());
					member.setRole(0);
					member.setAddtime(new PsfTime().getTimeInSeconds());
					member.setLasttime(new PsfTime().getTimeInSeconds());
					member.setPostcount(0);
					groupService.addGroupMember(member);
					//更新圈子成员数
					groupService.updateMemberCount(groupid);
					success = 1;
					message = "加入成功";
				}else if(grouptype.equals(2) || grouptype.equals(3)){	//申请加入
					if(applyService.isApplied(Psf.OTYPE_Group, groupid, getLoginUserId(), Psf.ApplyType_Apply, Psf.ApplyCheckStatus_NotConfirmed)){
						message = "您已经申请过了，请耐心等待审核!";
					}else{
						TApply apply = new TApply();
						apply.setOtype(Psf.OTYPE_Group);
						apply.setOid(groupid);
						apply.setFromuid(getLoginUserId());
						apply.setTouid(0);
						apply.setContent(content);
						apply.setAddtime(new PsfTime().getTimeInSeconds());
						apply.setAddip(getHexIP());
						apply.setApplytype(Psf.ApplyType_Apply);
						apply.setCheckstatus(Psf.ApplyCheckStatus_NotConfirmed);
						apply.setDelbyapplier(0);
						apply.setDelbychecker(0);
						applyService.addApply(apply);
						success = 2;
						message = "申请成功,等待审核";
					}
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		set("success", success);
		set("message", message);
	}
	
	/**
	 * 获取申请列表
	 * @throws Exception
	 */
	public void getApplyList() throws Exception {
		Integer groupid = p2int("groupid");
		Integer page = p2int("page");
		if(page == null){
			page = 1;
		}
		set("page", page);
		if(getLoginUserId() == null){
			throw new Exception("用户未登录");
		}
		PageParam pp = new PageParam(page, 20);
		PageResult<ApplyVO> applies = applyService.queryApply(Psf.OTYPE_Group, groupid, getLoginUserId(), null, null, Psf.ApplyType_Apply, Psf.ApplyCheckStatus_NotConfirmed, pp);
		if(applies != null){
			set("applylist", applies.getList());
			set("pageCount", applies.getPageCount());
		}
	}
	
	/**
	 * 处理申请或邀请
	 * @throws Exception
	 */
	public void handleApply() throws Exception {
		Integer type = p2int("type");
		Integer[] applyids = ps2int("applyid");
		Integer success = 0;
		String message = null;
		try{
			if(getLoginUserId()==null){
				message = "用户未登录";
			}else if(type == null || applyids == null){
				message = "参数错误";
			}else{
				for(Integer applyid : applyids){
					TApply apply = applyService.queryApplyByID(applyid);
					apply.setCheckuid(getLoginUserId());
					apply.setChecktime(new PsfTime().getTimeInSeconds());
					apply.setCheckstatus(type);
					applyService.updateApply(apply);
					if(type.equals(1)){	
						Integer groupid = apply.getOid();
						Integer uid = apply.getFromuid();
						if(apply.getApplytype().equals(2)){
							uid = apply.getTouid();
						}
						if(!groupService.isJoin(groupid, uid)){	//该成员没加入圈子，则添加圈子成员，更新圈子成员数
							TGroupMember member = new TGroupMember();
							member.setGroupid(groupid);
							member.setUid(uid);
							member.setRole(0);
							member.setAddtime(new PsfTime().getTimeInSeconds());
							member.setLasttime(new PsfTime().getTimeInSeconds());
							member.setPostcount(0);
							groupService.addGroupMember(member);
							//更新圈子成员数
							groupService.updateMemberCount(apply.getOid());
						}
					}
				}
				success = 1;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		set("success", success);
		set("message", message);
	}
	
	/**
	 * 获取圈子邀请对话框
	 * @throws Exception
	 */
	public void getInviteDialog() throws Exception {
		if(getLoginUserId()==null){
			throw new Exception("用户未登录");
		}
		Integer groupid = p2int("groupid");
		if(groupid == null){
			throw new Exception("参数错误");
		}
		set("groupid", groupid);
		Integer page = p2int("page");
		if(page == null){
			page = 1;
		}
		set("page",page);
		PageParam pp = new PageParam(page, 20);
		PageResult<LikeUserVO> users = groupService.queryInviteUserByType(groupid, getLoginUserId(), 3, null, pp);
		if(users != null){
			set("itemcount", users.getItemCount());
		}
	}
	
	/**
	 * 获取可以邀请用户列表
	 * @throws Exception
	 */
	public void getInviteUserlist() throws Exception {
		if(getLoginUserId()==null){
			throw new Exception("用户未登录");
		}
		Integer groupid = p2int("groupid");
		if(groupid == null){
			throw new Exception("参数错误");
		}
		set("groupid", groupid);
		Integer type = p2int("type");
		if(type == null){
			type = 3;
		}
		String keyword = p("keyword");
		if(keyword.equals("null") || keyword.equals("输入用户名")){
			keyword = null;
		}
		Integer page = p2int("page");
		if(page == null){
			page = 1;
		}
		set("page",page);
		PageParam pp = new PageParam(page, 20);
		PageResult<LikeUserVO> users = groupService.queryInviteUserByType(groupid, getLoginUserId(),type, keyword, pp);
		if(users != null){
			set("userlist", users.getList());
			set("pageCount", users.getPageCount());
		}
	}
	
	/**
	 * 获取已邀请的用户列表
	 * @throws Exception
	 */
	public void getHasInvitedUserList() throws Exception {
		Integer groupid = p2int("groupid");
		if(groupid == null){
			throw new Exception("参数错误");
		}
		set("groupid",groupid);
		Integer page = p2int("page");
		if(page == null){
			page = 1;
		}
		set("page",page);
		Integer[] uids = ps2int("uid");
		if(uids != null){
			PageParam pp = new PageParam(page, 10);
			PageResult<LikeUserVO> result = groupService.queryInvitedUserById(uids, pp);
			if(result != null){
				set("selected_userlist",result.getList());
				set("selected_pageCount",result.getPageCount());
			}
			set("selected_count", uids.length);
		}
	}
	
	/**
	 * 保存邀请
	 * @throws Exception
	 */
	public void saveInvitation() throws Exception {
		Integer[] uids = ps2int("selected_uid");
		Integer groupid = p2int("groupid");
		String content = p("invitation");
		Integer success = 0;
		String message = null;
		try{
			if(getLoginUserId() == null){
				message = "用户未登录";
			}else if(uids == null || groupid == null){
				message = "参数错误";
			}else{
				for(Integer uid : uids){
					List<TApply> applylist = applyService.queryApplyByStatus(Psf.OTYPE_Group, groupid, uid, Psf.ApplyType_Invite, Psf.ApplyCheckStatus_NotConfirmed);
					if(applylist != null && applylist.size()>0){//忽略先前的邀请
						for(TApply apply : applylist){
							apply.setCheckstatus(Psf.ApplyCheckStatus_Ignore);
							apply.setCheckuid(getLoginUserId());
							apply.setChecktime(new PsfTime().getTimeInSeconds());
							applyService.updateApply(apply);
						}
					}
					TApply apply = new TApply();
					apply.setOtype(Psf.OTYPE_Group);
					apply.setOid(groupid);
					apply.setFromuid(getLoginUserId());
					apply.setTouid(uid);
					apply.setContent(content);
					apply.setAddtime(new PsfTime().getTimeInSeconds());
					apply.setAddip(getHexIP());
					apply.setApplytype(Psf.ApplyType_Invite);
					apply.setCheckstatus(Psf.ApplyCheckStatus_NotConfirmed);
					apply.setDelbyapplier(0);
					apply.setDelbychecker(0);
					applyService.addApply(apply);
					success = 1;
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		set("message", message);
		set("success", success);
	}
	
	/**
	 * 获取右侧的邀请列表
	 * @throws Exception
	 */
	public void getInviteList() throws Exception {
		if(getLoginUserId() == null){
			throw new Exception("用户未登录");
		}
		Integer page = p2int("page");
		if(page == null){
			page = 1;
		}
		set("page", page);
		PageParam pp = new PageParam(page, 3);
		PageResult<ApplyVO> invites = applyService.queryApply(Psf.OTYPE_Group, null, getLoginUserId(), null, getLoginUserId(), Psf.ApplyType_Invite, Psf.ApplyCheckStatus_NotConfirmed, pp);
		if(invites != null){
			set("invitelist", invites.getList());
			set("pageCount", invites.getPageCount());
		}
	}
	
	/**
	 * 解散圈子
	 * @throws Exception
	 */
	public void dismissGroup() throws Exception {
		Integer groupid = p2int("groupid");
		Integer uid = getLoginUserId();
		Integer success = 0;
		String message = null;
		try{
			if(getLoginUserId() == null){
				message = "用户未登录";
			}else if(groupid == null){
				message = "参数错误";
			}else{
				Integer role = groupService.queryRoleInGroup(groupid, uid);
				if(!role.equals(2)){
					message = "您无权限解散该圈子";
				}else{
					groupService.delGroup(groupid);
					success = 1;
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		set("success", success);
		set("message", message);
	}
	
	/**
	 * 圈子详细右侧列表
	 * @throws Exception
	 */
	public void groupDetailRightUser() throws Exception {
		Integer groupid = p2int("groupid");
		String divid = p("divid");
		Integer type = p2int("type");
		Integer page = p2int("page");
		if(page == null){
			page = 1;
		}
		if(getLoginUserId() == null){
			throw new Exception("用户未登录");
		}
		if(groupid == null || divid == null || type == null){
			throw new Exception("参数错误");
		}
		set("groupid", groupid);
		set("divid", divid);
		set("type", type);
		set("page", page);
		
		PageParam pp = new PageParam(page, 9);
		if(type.equals(1)){	//返回管理员
			PageResult<LikeUserVO> result = groupService.queryGroupMember(groupid, 6, getLoginUserId(), null, 1, pp);
			if(result != null){
				set("userlist", result.getList());
				set("pageCount", result.getPageCount());
			}else{
				set("message","该圈子当前没有管理员");
			}
		}else if(type.equals(2)){	//在线品友
			
		}else if(type.equals(3)){	//最新圈友
			PageResult<LikeUserVO> result = groupService.queryGroupMember(groupid, null, getLoginUserId(), null, 1, pp);
			if(result != null){
				set("userlist", result.getList());
				set("pageCount", result.getPageCount());
			}else{
				set("message","该圈子当前还没有成员");
			}
		}
	}
	
	/**
	 * 圈子详细右侧可能喜欢的圈子
	 * @throws Exception
	 */
	public void groupDetailRightRecommend() throws Exception {
		Integer groupid = p2int("groupid");
		Integer page = p2int("page");
		if(page == null){
			page = 1;
		}
		set("page",page);
		if(getLoginUserId() == null){
			throw new Exception("用户未登录");
		}
		if(groupid == null){
			throw new Exception("参数错误");
		}
		set("groupid", groupid);
		PageParam pp = new PageParam(page, 8);
		PageResult<RightGroupVO> groups = groupService.queryRecommendGroupByGroupId(groupid, getLoginUserId(), pp);
		if(groups != null){
			set("grouplist", groups.getList());
			set("pageCount", groups.getPageCount());
		}
	}
	
	/**
	 * 圈子推广
	 * @throws Exception
	 */
	public void promoteGroup() throws Exception {
		Integer groupid = p2int("groupid");
		Integer success = 0;
		String message = null;
		try{
			if(getLoginUserId() == null){
				message = "未登录";
			}else if(groupid == null){
				message = "参数错误";
			}else{
				TGroup group = groupService.queryGroupById(groupid);
				if(group.getGrouptype().equals(4)){
					message = "该圈子不能被推广";
				}else{
					TUrl turl = new TUrl();
					turl.setOurl("sns/group/detail?groupid="+groupid);
					turl.setUrltype(0);
					String url = snsService.addUrl(turl);
					String content = "这个叫\""+group.getGroupname()+"\"圈子很不错啊！<a href='"+url+"'>"+url+"</a>";
					TPost post = new TPost();
					post.setUid(getLoginUserId());
					post.setPosttype(Psf.OTYPE_Blog);
					post.setContent(content);
					post.setAddip(getHexIP());
					post.setAddtime(new PsfTime().getTimeInSeconds());
					post.setAddby(Psf.AddBy_Web);
					post.setDelflag(0);
					post.setCommentcount(0);
					post.setSharecount(0);
					post.setForwardcount(0);
					post.setClickcount(0);
					post.setLikecount(0);
					post.setLastreplytime(new PsfTime().getTimeInSeconds());
					postService.addPost(post);
					success = 1;
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		set("success", success);
		set("message", message);
	}
}
