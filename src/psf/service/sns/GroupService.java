/**
 * 圈子管理
 * @author 于淼
 */
package psf.service.sns;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import psf.Psf;
import psf.PsfService;
import psf.common.PageParam;
import psf.common.PageResult;
import psf.entity.TGroup;
import psf.entity.TGroupClass;
import psf.entity.TGroupMember;
import psf.entity.TPic;
import psf.entity.TUser;
import psf.service.common.PicService;
import psf.service.common.UserService;
import psf.service.common.ZoneService;
import psf.vo.sns.GroupVO;
import psf.vo.sns.LikeUserVO;
import psf.vo.sns.PostListItemVO;
import psf.vo.sns.RightGroupVO;
import psf.vo.sns.SnsUserInfoVO;
import psf.vo.sns.TopicVO;

public class GroupService extends PsfService {
	
	public Integer addGroup(TGroup group) throws Exception {
		return dao.insert(group);
	}
	
	public void delGroup(int groupid) throws Exception {
		sqlmap.update("group.delGroup", groupid);
	}
	
	public TGroup queryGroupById(Integer groupid) throws Exception {
		return (TGroup)sqlmap.queryForObject("group.queryById", groupid);
	}
	
	public void updateGroup(TGroup group) throws Exception {
		dao.update(group);
	}

	public void addGroupMember(TGroupMember member) throws Exception {
		dao.insert(member);
	}
	
	public void updateGroupMember(TGroupMember member) throws Exception {
		sqlmap.update("group.updateGroupMember",member);
	}
	
	public void delGroupMember(int groupid,int uid) throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("groupid", groupid);
		map.put("uid", uid);
		sqlmap.delete("group.delGroupMember", map);
		
		//更新圈子的membercount字段
		updateMemberCount(groupid);
	}
	
	/**
	 * 查询圈子成员记录
	 * @param groupid
	 * @param uid
	 * @return
	 * @throws Exception
	 */
	public TGroupMember queryGroupMemberById(int groupid, int uid) throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("groupid", groupid);
		map.put("uid", uid);
		return (TGroupMember)sqlmap.queryForObject("group.queryGroupMemberById", map);
	}
	
	/**
	 * 设置圈子图片，圈主显示名、圈子发言数
	 * @param groupslist
	 * @param uid
	 * @throws Exception
	 */
	private void setGroupList(List<GroupVO> groupslist, Integer uid) throws Exception {
		PicService picService = new PicService();
		UserService userService = new UserService();
		PostService postService = new PostService();
		
		for(GroupVO group : groupslist){
			
			TPic pic = picService.queryPicByPicId(group.getPicid());
			group.setLogo(pic.getPicid() +"."+ pic.getFiletype());
			
			SnsUserInfoVO userinfo = userService.queryUserInfo(uid, group.getUid());
			group.setDisplayName(userinfo.getUsername());
			
			group.setPostCount(postService.queryGroupPostCount(group.getGroupid(), null));	//圈子发言数
		}
	}
	
	/**
	 * 推荐用户所参加圈子的同类未参加的圈子，如果为空，则推荐未参加的热门圈子
	 * @param uid
	 * @param pp
	 * @return
	 * @throws Exception
	 */
	public PageResult<GroupVO> queryGroupRecommend(Integer uid, PageParam pp) throws Exception {
		
		Integer count = (Integer) sqlmap.queryForObject("group.countGroupsRecommend", uid);
		
		List<GroupVO> grouplist = null;
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("uid", uid);
		param.put("offset", pp.getOffset());
		param.put("pageSize", pp.getPageSize());
		
		if(count > 0) {
			grouplist = sqlmap.queryForList("group.queryGroupsRecommend", param);
		}else{
			param.put("orderby", 1);
			count = (Integer) sqlmap.queryForObject("group.countHotByUid", param);
			grouplist = sqlmap.queryForList("group.queryHotByUid", param);
		}
		
		setGroupList(grouplist, uid);
		
		return new PageResult<GroupVO>(grouplist, count, pp.getPageSize());
	}
	
	/**
	 * 查询热门圈子(uid没有参与的)
	 * @param uid 0，所有热门圈子
	 * @param orderby 1-成员数，2-创建时间
	 * @param pp
	 * @return
	 * @throws Exception
	 */
	public PageResult<GroupVO> queryHotGroup(Integer uid, Integer orderby, PageParam pp) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("uid", uid);
		Integer count = (Integer) sqlmap.queryForObject("group.countHotByUid", param);
		PageResult<GroupVO> result = null;
		if(count > 0){
			param.put("orderby", orderby);
			param.put("offset", pp.getOffset());
			param.put("pageSize", pp.getPageSize());
			List<GroupVO> grouplist = sqlmap.queryForList("group.queryHotByUid", param);
			
			setGroupList(grouplist, uid);
			
			result =  new PageResult<GroupVO>(grouplist, count, pp.getPageSize());
		}
		return result;
	}
	
	/**
	 * 查询指定用户参加的圈子
	 * @param uid 用户ID
	 * @param pp 分页参数
	 * @return
	 * @throws Exception
	 */
	public PageResult<GroupVO> queryJoinGroupByUid(Integer uid, PageParam pp) throws Exception {
		Integer count = (Integer) sqlmap.queryForObject("group.countJoinGroupByUid", uid);
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("uid", uid);
		param.put("offset", pp.getOffset());
		param.put("pageSize", pp.getPageSize());
		List<GroupVO> grouplist = sqlmap.queryForList("group.queryJoinGroupByUid", param);
		
		setGroupList(grouplist, uid);
		
		return new PageResult<GroupVO>(grouplist, count, pp.getPageSize());
	}
	
	/**
	 * 查询转发圈子列表
	 * @param uid
	 * @param pp
	 * @return
	 * @throws Exception
	 */
	public PageResult<TGroup> queryForwardGroupList(Integer uid, PageParam pp) throws Exception {
		Integer count = (Integer) sqlmap.queryForObject("group.countJoinGroupByUid", uid);
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("uid", uid);
		param.put("offset", pp.getOffset());
		param.put("pageSize", pp.getPageSize());
		List<TGroup> grouplist = sqlmap.queryForList("group.queryForwardGroupList", param);
		return new PageResult<TGroup>(grouplist, count, pp.getPageSize());
	}
	
	/**
	 * 查询圈子类型
	 * @param groupclassid null-返回全部类型
	 * @return
	 * @throws Exception
	 */
	public List<TGroupClass> queryGroupClass(Integer groupclassid) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("groupclassid", groupclassid);
		return sqlmap.queryForList("group.queryGroupClass",param);
	}
	
	/**
	 * 圈子“我的圈子”
	 * @param type 1:我参与的，2：我创建的
	 * @param uid
	 * @param orderby 1-最新，2-最热
	 * @param keyword
	 * @param pp
	 * @return
	 * @throws Exception
	 */
	public PageResult<GroupVO> queryGroupByUid(Integer type, Integer uid, Integer orderby, String keyword, PageParam pp) throws Exception {
		PicService picService = new PicService();
		UserService userService = new UserService();
		PostService postService = new PostService(); 
		ZoneService zoneService = new ZoneService();
		TopicService topicService = new TopicService(); 
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("uid", uid);
		param.put("type", type);
		param.put("keyword", keyword);
		Integer count = (Integer)sqlmap.queryForObject("group.countGroupByUid", param);
		PageResult<GroupVO> groups = null;
		if(count > 0){
			param.put("orderby", orderby);
			param.put("offset", pp.getOffset());
			param.put("pageSize", pp.getPageSize());
			List<GroupVO> grouplist = sqlmap.queryForList("group.queryGroupByUid", param);
			for(GroupVO group : grouplist){
				Integer groupid = group.getGroupid();
				TPic pic = picService.queryPicByPicId(group.getPicid());
				group.setLogo(pic.getPicid() +"."+ pic.getFiletype());
				
				SnsUserInfoVO userinfo = userService.queryUserInfo(uid, group.getUid());
				group.setDisplayName(userinfo.getUsername());
				
				Integer topicCount = topicService.queryTopicCount(1, groupid);
				group.setTopicCount(topicCount);	//圈子话题数目
				
				group.setPostCount(postService.queryGroupPostCount(groupid, null));	//圈子发言数
				
				TGroupClass groupclass = queryGroupClass(group.getGroupclassid()).get(0);
				group.setGroupclass(groupclass.getGroupclassname());
				
				group.setZonename(zoneService.queryZoneByID(group.getZoneid()).getZonename());
				
				group.setIsJoin(true);	//均是参与状态
				
				group.setRole(queryRoleInGroup(groupid, uid));	//设置圈子角色
				
				//计算圈中品友数量：好友+关注+粉丝
				group.setPsfFriendCount(queryMemberCount(groupid,1,uid));
				//热门话题
				PageParam pp_1 = new PageParam(1,3);
				PageResult<TopicVO> topiclist = topicService.queryTopicVOByUid(1, 0, null, groupid, null, 2, pp_1);
				if(topiclist != null){
					List<TopicVO> hottopic = topiclist.getList();
					group.setHottopic(hottopic);
				}
				
				//最新话题
				PageParam pp_2 = new PageParam(1,1);
				topiclist = topicService.queryTopicVOByUid(1, 0, null, groupid, null, 1, pp_2);
				if(topiclist != null){
					List<TopicVO> latesttopic = topiclist.getList();
					group.setLatesttopic(latesttopic);
				}
			}
			groups = new PageResult<GroupVO>(grouplist, count, pp.getPageSize());
		}
		return groups;
	}
	
	/**
	 * 查询圈子成员数目
	 * @param groupid
	 * @param type null-全部成员，1-品友，2-好友，3-关注，4-粉丝，5-普通圈友，6-管理员，7-圈主
	 * @param uid
	 * @return
	 */
	public Integer queryMemberCount(Integer groupid, Integer type, Integer uid) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("groupid", groupid);
		param.put("type", type);
		param.put("uid", uid);
		return (Integer)sqlmap.queryForObject("group.queryMemberCount", param);
	}
	
	/**
	 * 查询圈子成员
	 * @param groupid
	 * @param type null-全部成员，1-品友，2-好友，3-关注，4-粉丝，5-普通圈友，6-管理员，7-圈主
	 * @param uid
	 * @param keyword
	 * @param orderby 1：加入时间，2-最后发言时间，3-圈身份，4-圈子发言数
	 * @param pp
	 * @return
	 * @throws Exception
	 */
	public PageResult<LikeUserVO> queryGroupMember(Integer groupid, Integer type, Integer uid, String keyword, Integer orderby, PageParam pp) throws Exception {
		UserService userService = new UserService();
		PicService picService = new PicService();
		PostService postService = new PostService();
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("groupid", groupid);
		param.put("type", type);
		param.put("uid", uid);
		param.put("keyword", keyword);
		Integer count = (Integer)sqlmap.queryForObject("group.queryMemberCount", param);
		PageResult<LikeUserVO> result = null;
		if(count > 0){
			param.put("orderby", orderby);
			param.put("offset", pp.getOffset());
			param.put("pageSize", pp.getPageSize());
			List<LikeUserVO> userlist = sqlmap.queryForList("group.queryGroupMember", param);
			for(LikeUserVO user : userlist){
				SnsUserInfoVO userinfo = userService.queryUserInfo(uid, user.getUid());
				user.setAvatarFileName(userinfo.getAvatarFileName());
				user.setIsFollow(userinfo.getIsfollow());
				
				//查询最后一条发言
				PageParam pp_1 = new PageParam(1,1);
				PageResult<PostListItemVO> posts = postService.queryGroupPost(1, user.getUid(), groupid, null, null, 1, pp_1);
				if(posts != null){
					user.setLastpost(posts.getList().get(0));
				}
				
				user.setRole(queryRoleInGroup(groupid, user.getUid()));	//设置圈友角色
				
			}
			result = new PageResult<LikeUserVO>(userlist, count, pp.getPageSize());
		}
		return result;
	}
	
	/**
	 * 根据品友类别查询圈子
	 * @param uid
	 * @param type null-所有圈子，1-好友圈子，2-关注圈子，3-粉丝圈子
	 * @param pp
	 * @return
	 * @throws Exception
	 */
	public PageResult<GroupVO> queryGroupByUserType(Integer uid, Integer type, PageParam pp) throws Exception {
		PicService picService = new PicService();
		UserService userService = new UserService();
		TopicService topicService = new TopicService();
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("uid", uid);
		param.put("type", type);
		Integer count = (Integer)sqlmap.queryForObject("group.countGroupByUserType", param);
		PageResult<GroupVO> result = null;
		if(count > 0){
			param.put("offset", pp.getOffset());
			param.put("pageSize", pp.getPageSize());
			List<GroupVO> grouplist = sqlmap.queryForList("group.queryGroupByUserType", param);
			for(GroupVO group : grouplist){
				TPic pic = picService.queryPicByPicId(group.getPicid());
				group.setLogo(pic.getPicid() +"."+ pic.getFiletype());
				
				SnsUserInfoVO userinfo = userService.queryUserInfo(uid, group.getUid());
				group.setDisplayName(userinfo.getUsername());
				
				Integer topicCount = topicService.queryTopicCount(1, group.getGroupid());
				group.setTopicCount(topicCount);	//圈子话题数目
				
				//设置粉丝和品友数
				PageParam pp_1 = new PageParam(1,3);
				PageResult<LikeUserVO> userlist = queryGroupMember(group.getGroupid(),null,uid,null,1,pp_1);
				if(userlist != null){
					group.setJoiner(userlist.getList());
				}
				group.setPsfFriendCount(queryMemberCount(group.getGroupid(),1,uid));
			}
			result = new PageResult<GroupVO>(grouplist, count, pp.getPageSize());
		}
		return result;
	}
	
	/**
	 * 根据圈子类别查询圈子或者关键字查询圈子
	 * @param uid 当前登录用户
	 * @param classid null-所有圈子
	 * @param keyword
	 * @param pp
	 * @return
	 * @throws Exception
	 */
	public PageResult<GroupVO> queryGroupByClass(Integer uid, Integer classid, String keyword, PageParam pp) throws Exception {
		PicService picService = new PicService();
		TopicService topicService = new TopicService();
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("classid", classid);
		param.put("keyword", keyword);
		Integer count = (Integer)sqlmap.queryForObject("group.countGroupByClass", param);
		PageResult<GroupVO> result = null;
		if(count > 0){
			param.put("offset", pp.getOffset());
			param.put("pageSize", pp.getPageSize());
			List<GroupVO> grouplist = sqlmap.queryForList("group.queryGroupByClass", param);
			for(GroupVO group : grouplist){
				TPic pic = picService.queryPicByPicId(group.getPicid());
				group.setLogo(pic.getPicid() +"."+ pic.getFiletype());
			
				Integer topicCount = topicService.queryTopicCount(1, group.getGroupid());
				group.setTopicCount(topicCount);	//圈子话题数目
				
				/**
				if(uid != null){
					group.setIsJoin(isJoin(group.getGroupid(),uid));	//是否加入，对于私密圈只有加入者才能看到
				}*/
			}
			result = new PageResult<GroupVO>(grouplist, count, pp.getPageSize());
		}
		return result;
	}
	
	public GroupVO queryGroupById(Integer groupid, Integer uid) throws Exception {
		PicService picService = new PicService();
		PostService postService = new PostService();
		TopicService topicService = new TopicService();
		ZoneService zoneService = new ZoneService();
		ApplyService applyService = new ApplyService(); 
		
		GroupVO group = (GroupVO) sqlmap.queryForObject("group.queryGroupById", groupid);
		//圈子logo
		if(group.getPicid()!=null){
			TPic pic = picService.queryPicByPicId(group.getPicid());
			group.setLogo(pic.getPicid() +"."+ pic.getFiletype());
		}else{
			group.setLogo("1.jpg");
		}
		
		group.setPostCount(postService.queryGroupPostCount(groupid, null));	//圈子发言数
		
		group.setTopicCount(topicService.queryTopicCount(null, groupid));	//圈子话题数
		
		if(uid != null){	
			group.setPsfFriendCount(queryMemberCount(groupid, 1, uid));	//设置品友
			group.setIsJoin(isJoin(groupid,uid));	//参与状态
			if(!group.getIsJoin()){
				if(applyService.isApplied(Psf.OTYPE_Group, groupid, uid, Psf.ApplyType_Apply, Psf.ApplyCheckStatus_NotConfirmed)!=null){
					group.setIsApplied(true);
				}
			}
			group.setRole(queryRoleInGroup(groupid, uid));	//设置当前用户在圈子中的角色，便于权限的判断
			group.setManagecount(queryMemberCount(groupid,6,uid));	//设置管理员数
		}
		
		TGroupClass groupclass = queryGroupClass(group.getGroupclassid()).get(0);
		group.setGroupclass(groupclass.getGroupclassname());
		
		group.setZonename(zoneService.queryZoneByID(group.getZoneid()).getZonename());
		
		return group;
	}
	
	/**
	 * 查询用户在某个圈子的角色
	 * @param groupid
	 * @param uid
	 * @return
	 * @throws Exception
	 */
	public Integer queryRoleInGroup(Integer groupid, Integer uid) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("groupid", groupid);
		param.put("uid", uid);
		return (Integer)sqlmap.queryForObject("group.queryRoleInGroup", param);
	}
	
	/**
	 * 更新圈子成员数
	 * @param groupid
	 * @throws Exception
	 */
	public void updateMemberCount(Integer groupid) throws Exception {
		sqlmap.update("group.updateMemberCount", groupid);
	}
	
	/**
	 * 判断用户是否加入圈子 
	 * @param groupid
	 * @param uid
	 * @return
	 * @throws Exception
	 */
	public Boolean isJoin(Integer groupid, Integer uid) throws Exception {
		if(uid==null || groupid==null || queryGroupMemberById(groupid,uid) == null){
			return false;
		}else{
			return true;
		}
	}
	
	/**
	 * 查询圈子的邀请对象
	 * @param groupid
	 * @param uid
	 * @param type 1-好友，2-粉丝，3-好友+粉丝
	 * @param keyword
	 * @param pp
	 * @return
	 * @throws Exception
	 */
	public PageResult<LikeUserVO> queryInviteUserByType(Integer groupid, Integer uid, Integer type, String keyword, PageParam pp) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("groupid", groupid);
		param.put("uid", uid);
		param.put("type", type);
		param.put("keyword", keyword);
		Integer count = (Integer)sqlmap.queryForObject("group.countInviteUserByType",param);
		PageResult<LikeUserVO> result = null;
		if(count > 0){
			param.put("offset", pp.getOffset());
			param.put("pageSize", pp.getPageSize());
			List<LikeUserVO> userlist = sqlmap.queryForList("group.queryInviteUserByType",param);
			for(LikeUserVO user : userlist){
				if(user.getAvatarFileName()==null){
					user.setAvatarFileName("1.jpg");
				}
			}
			result = new PageResult<LikeUserVO>(userlist, count, pp.getPageSize());
		}
		return result;
	}
	
	/**
	 * 查询选择邀请加入圈子的用户
	 * @param uids
	 * @param pp
	 * @return
	 * @throws Exception
	 */
	public PageResult<LikeUserVO> queryInvitedUserById(Integer[] uids, PageParam pp) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("uids", uids);
		param.put("offset", pp.getOffset());
		param.put("pageSize", pp.getPageSize());
		List<LikeUserVO> userlist = sqlmap.queryForList("group.queryInvitedUserById",param);
		for(LikeUserVO user : userlist){
			if(user.getAvatarFileName()==null){
				user.setAvatarFileName("1.jpg");
			}
		}
		return new PageResult<LikeUserVO>(userlist, uids.length, pp.getPageSize());
	}
	
	/**
	 * 根据圈子推荐圈子
	 * @param groupid
	 * @param uid
	 * @param pp
	 * @return
	 * @throws Exception
	 */
	public PageResult<RightGroupVO> queryRecommendGroupByGroupId(Integer groupid, Integer uid, PageParam pp) throws Exception {
		Integer count = (Integer)sqlmap.queryForObject("group.countRecommendGroupByGroupId", groupid);
		PageResult<RightGroupVO> result = null;
		if(count > 0){
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("groupid", groupid);
			param.put("offset", pp.getOffset());
			param.put("pageSize", pp.getPageSize());
			List<RightGroupVO> grouplist = sqlmap.queryForList("group.queryRecommendGroupByGroupId",param);
			for(RightGroupVO group : grouplist){
				group.setIsJoin(isJoin(group.getGroupid(), uid));
			}
			result = new PageResult<RightGroupVO>(grouplist, count, pp.getPageSize());
		}
		return result;
	}
	
	/**
	 * 查询检索圈子对象
	 * @param uid 当前登录用户的ID
	 * @param groupids
	 * @param pp
	 * @return
	 * @throws Exception
	 */
	public PageResult<GroupVO> querySearchGroupByIds(Integer uid, Integer[] groupids, Integer orderby, PageParam pp) throws Exception {
		PostService postService = new PostService();
		TopicService topicService =  new TopicService();
		ApplyService applyService =  new ApplyService();
		ZoneService zoneService = new ZoneService();
		SnsService snsService = new SnsService();
		
		PageResult<GroupVO> groups = null;
		if(groupids != null && groupids.length > 0){
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("groupids", groupids);
			param.put("orderby", orderby);
			param.put("offset", pp.getOffset());
			param.put("pageSize", pp.getPageSize());
			List<GroupVO> grouplist = sqlmap.queryForList("group.querySearchGroupByIds",param);
			for(GroupVO group : grouplist){
				Integer groupid = group.getGroupid();
				group.setPostCount(postService.queryGroupPostCount(groupid, null));	//圈子发言数
				group.setTopicCount(topicService.queryTopicCount(null, groupid));	//圈子话题数
				String remarkname = snsService.queryRemarkName(uid, group.getUid());
				if(remarkname != null){
					group.setDisplayName(remarkname);
				}
				
				if(uid != null){	
					group.setPsfFriendCount(queryMemberCount(groupid, 1, uid));	//设置品友
					group.setIsJoin(isJoin(groupid,uid));	//参与状态
					if(!group.getIsJoin()){
						if(applyService.isApplied(Psf.OTYPE_Group, groupid, uid, Psf.ApplyType_Apply, Psf.ApplyCheckStatus_NotConfirmed)!=null){
							group.setIsApplied(true);
						}
					}
				}
				group.setZonename(zoneService.queryZoneByID(group.getZoneid()).getZonename());
			}
			groups = new PageResult<GroupVO>(grouplist, groupids.length, pp.getPageSize());
		}
		return groups;
	}
}
