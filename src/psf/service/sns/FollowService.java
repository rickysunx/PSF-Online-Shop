/**
 * 关注（粉丝）操作
 * 
 */
package psf.service.sns;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import psf.PsfService;
import psf.Smiley;
import psf.common.PageParam;
import psf.common.PageResult;
import psf.common.PsfHtmlUtils;
import psf.entity.TFollow;
import psf.entity.TFollowGroup;
import psf.entity.TFriend;
import psf.entity.TFriendGroup;
import psf.entity.TPost;
import psf.entity.TUserBalance;
import psf.service.common.UserService;
import psf.service.common.ZoneService;
import psf.vo.sns.FriendVO;
import psf.vo.sns.SnsUserInfoVO;



public class FollowService extends PsfService {
	/**
	 * 加关注
	 */
	public void addFollow(int uid, int followuid,int followgroupid) throws Exception {
		TFollow f = new TFollow();
		f.setFollowuid(followuid);
		f.setUid(uid);
		f.setFollowgroupid(followgroupid);
		dao.insert(f);
	}

	/**
	 * 取消关注/删除粉丝
	 */
	public void delFollow(int uid, int followuid) throws Exception {
		TFollow f = new TFollow();
		f.setFollowuid(followuid);
		f.setUid(uid);
		sqlmap.delete("follow.delFollow", f);
	}

	public int addFollowGroup(Integer uid,String followgroupname) throws Exception {
		TFollowGroup f = new TFollowGroup();
		f.setUid(uid);
		f.setDisplayorder(0);
		f.setFollowgroupname(followgroupname);
		return dao.insert(f);
	}
	public void updateFollowGroup(Integer followgroupid,String followgroupname) throws Exception {
		Map<String,Object> m = new HashMap<String,Object>();
		m.put("followgroupid", followgroupid);
		m.put("followgroupname", followgroupname);
		sqlmap.update("follow.updateFollowGroup", m);
	}
	public void delFollowGroup(Integer followgroupid,Integer uid) throws Exception {
		Map<String,Object> m = new HashMap<String,Object>();
		m.put("uid", uid);
		m.put("followgroupid", followgroupid);
		// 根据用户和要删除的组查找这个组下的全部关注
		List followlist = sqlmap.queryForList("follow.queryFollowuidByFollowgroupid", m);
		// 查询这个组下的好友是否是单分组，还是多分组，单分组，转移到未分组，多分组直接将这个组删除
		for (int i = 0; i < followlist.size(); i++) {
			int followuid = (Integer) followlist.get(i);
			m.put("followuid", followuid);
			List sfgs = sqlmap.queryForList("follow.queryisFollow", m);
			if (sfgs.size() > 1) {
				sqlmap.delete("follow.delFollowByFollowgroupid", m);
			} else {
				m.put("followgroupid", 0);
				sqlmap.update("follow.updateFollowgroup", m);
			}
		}	
		sqlmap.delete("follow.delFollowGroup", followgroupid);
	}
	
	public void updateFollowGroup(Integer uid,Integer followuid,Integer [] followgroupids) throws Exception {
		delFollow(uid, followuid);
		if(followgroupids!=null && followgroupids.length>0) {
			for (Integer followgroupid:followgroupids) {
				addFollow(uid, followuid, followgroupid);
			}
		} else {
			addFollow(uid, followuid, 0);
		}
	}
	/**
	 * 是否关注
	 */
	public Boolean queryIsFollow(Integer uid, Integer followuid)throws Exception {
		Boolean flag = false;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uid", uid);
		map.put("followuid", followuid);
		List<TFollow> followlist = sqlmap.queryForList("follow.queryisFollow", map);
		if (followlist != null && followlist.size() > 0)
			flag = true;
		return flag;
	}
	// 查询用户所有关注分组
	public List<TFollowGroup> queryFollowGroup(Integer uid) throws Exception {
		return sqlmap.queryForList("follow.queryFollowgroupByUid", uid);
	}
	
	public void updateFollowGroupOrder(Integer uid,Integer[] followgroupids) throws Exception {
		sqlmap.update("follow.updateAllFollowGroupOrderToZero",uid);
		for(int i=0;i<followgroupids.length;i++) {
			TFollowGroup fg = new TFollowGroup();
			fg.setUid(uid);
			fg.setFollowgroupid(followgroupids[i]);
			fg.setDisplayorder(i+1);
			sqlmap.update("follow.updateFollowGroupOrder", fg);
		}
	}
	
	/**
	 * 查询某用户的关注，在哪几个分组里
	 * @param uid
	 * @param friendId
	 * @return
	 * @throws Exception
	 */
	public List<TFollowGroup> queryFollowGroupByFriendId(Integer uid,Integer followuid) throws Exception {
		TFollow f = new TFollow();
		f.setUid(uid);
		f.setFollowuid(followuid);
		return sqlmap.queryForList("follow.queryFollowGroupByFollowuid", f);
	}
	
	
	//分页查询粉丝
	public PageResult<FriendVO> queryFansByUid(Integer uid,String keyword,PageParam pp) throws Exception{
		UserService userService = new UserService();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uid", uid);
		map.put("pp", pp);
		map.put("keyword",keyword);
		Integer itemCount = null;
		List<FriendVO> list = new ArrayList<FriendVO>();
		if(keyword == null || "null".equals(keyword) || "".equals(keyword)) {
			itemCount =(Integer) sqlmap.queryForObject("follow.queryFansByUidCount", map);
			list = (List<FriendVO>)sqlmap.queryForList("follow.queryFansByUid", map);
		} else {
			itemCount =(Integer) sqlmap.queryForObject("follow.queryFansByKeywordCount", map);
			list = (List<FriendVO>)sqlmap.queryForList("follow.queryFansByKeyword", map);
		}	
		for(FriendVO user : list) {
			int fansuid = user.getFriendid();			
			SnsUserInfoVO userinfo = userService.queryUserInfo(uid,fansuid);
			user.setAvatarFileName(userinfo.getAvatarFileName());
			user.setOname(userinfo.getOname());
			user.setRemarkName(userinfo.getRemarkName());
			user.setZonename(userinfo.getNowZoneName());
			user.setIsfollow(userinfo.getIsfollow());
			user.setUsername(userinfo.getUsername());
			user.setFans(userinfo.getFans());
			user.setFollows(userinfo.getFollows());
			user.setGroups(userinfo.getGroups());
			user.setPubs(userinfo.getPubs());
			user.setZonename(userinfo.getNowZoneName());
			
			String text = "";
			if(user.getNewpost() != null){
				if(user.getNewpost().length() <= 200){
					text = PsfHtmlUtils.decodeText(user.getNewpost());
					user.setNewpost(Smiley.replaceSmiley(text));
				} else {
					String str = "...<a  href='/post/"+user.getPostid()+"' target='_blank'>[查看原文]</a>";
					text = PsfHtmlUtils.decodeText(user.getNewpost().substring(0, 200));
					user.setNewpost(Smiley.replaceSmiley(text)+str);
				}	
			}
		}
		return new PageResult<FriendVO>(list,itemCount,pp.getPageSize());
	}
	//分页查询分组关注人
	public  PageResult<FriendVO> queryFollowByUid(Integer uid,Integer followgroupid,String keyword,PageParam pp) throws Exception {
		UserService userService = new UserService();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uid", uid);
		map.put("followgroupid", followgroupid);
		map.put("pp", pp);
		map.put("keyword",keyword);
		Integer itemCount = null;
		List<FriendVO> list = new ArrayList<FriendVO>();
		if(keyword == null || "null".equals(keyword) || "".equals(keyword)){
			itemCount =(Integer) sqlmap.queryForObject("follow.queryFollowCount", map);
			list = (List<FriendVO>)sqlmap.queryForList("follow.queryFollowByUid", map);
		} else {
			itemCount =(Integer) sqlmap.queryForObject("follow.queryFollowByKeywordCount", map);
			list = (List<FriendVO>)sqlmap.queryForList("follow.queryFollowByKeyword", map);
		}		
		if(list.size() != 0){
			for(FriendVO user:list) {
				int followuid = user.getFriendid();
				Map m = new HashMap();
				m.put("followuid", followuid);
				m.put("uid", uid);
				List<FriendVO> groupList = sqlmap.queryForList("follow.queryFollowgroupByFollowuid", m);
				String groupname = "";
				for (int j = 0; j < groupList.size(); j++) {
					if(groupList.get(j).getFollowgroupname() == null){
						groupname += "未分组";
					} else {
						groupname += groupList.get(j).getFollowgroupname();
					}
					groupname += ",";
				}
				user.setFollowgroupname(groupname.substring(0,groupname.length()-1));
				
				SnsUserInfoVO userinfo = userService.queryUserInfo(uid,followuid);
				user.setAvatarFileName(userinfo.getAvatarFileName());
				user.setOname(userinfo.getOname());
				user.setRemarkName(userinfo.getRemarkName());
				user.setIsfans(userinfo.getIsfans());
				user.setUsername(userinfo.getUsername());
				user.setFans(userinfo.getFans());
				user.setFollows(userinfo.getFollows());
				user.setGroups(userinfo.getGroups());
				user.setPubs(userinfo.getPubs());
				user.setZonename(userinfo.getNowZoneName());
			
				String text = "";
				if(user.getNewpost() != null){
					if(user.getNewpost().length() <= 200){
						text = PsfHtmlUtils.decodeText(user.getNewpost());
						user.setNewpost(Smiley.replaceSmiley(text));
					} else {
						String str = "...<a  href='/post/"+user.getPostid()+"' target='_blank'>[查看原文]</a>";
						text = PsfHtmlUtils.decodeText(user.getNewpost().substring(0, 200));
						user.setNewpost(Smiley.replaceSmiley(text)+str);
					}	
				}
			}
		}

		return new PageResult<FriendVO>(list,itemCount,pp.getPageSize());
	}
}
