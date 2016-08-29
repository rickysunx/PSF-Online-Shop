/**
 * 好友管理
 * @author 于淼
 */
package psf.service.sns;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import psf.PsfService;
import psf.Smiley;
import psf.common.PageParam;
import psf.common.PageResult;
import psf.common.PsfHtmlUtils;
import psf.common.PsfTime;
import psf.entity.TFriend;
import psf.entity.TFriendGroup;
import psf.entity.TIntroduce;
import psf.entity.TPic;
import psf.entity.TPost;
import psf.entity.TUser;
import psf.entity.TUserBalance;
import psf.entity.TUserEdu;
import psf.entity.TUserJob;
import psf.entity.TZone;
import psf.service.common.UserService;
import psf.service.common.ZoneService;
import psf.vo.sns.FriendVO;
import psf.vo.sns.IntroduceVO;
import psf.vo.sns.SnsUserInfoVO;



public class FriendService extends PsfService {
	/*好友*/
	public void addFriend(Integer uid,Integer friendid,Integer friendgroupid) throws Exception {
		TFriend f = new TFriend();
		f.setFriendgroupid(friendgroupid);
		f.setFriendid(friendid);
		f.setUid(uid);
		dao.insert(f);
	}
	
	public void updateFriendGroup(Integer uid,Integer friendid,Integer [] friendgroupids) throws Exception {
		delFriend(uid, friendid);
		if(friendgroupids!=null && friendgroupids.length>0) {
			for (Integer friendgroupid:friendgroupids) {
				addFriend(uid, friendid, friendgroupid);
			}
		} else {
			addFriend(uid, friendid, 0);
		}
	}
	
	public void delFriend(Integer uid,Integer friendid) throws Exception {
		TFriend f = new TFriend();
		f.setFriendid(friendid);
		f.setUid(uid);
		sqlmap.delete("friend.delFriend", f);
	}
	/*好友*/
	
	/*好友分组*/
	public int addFriendGroup(Integer uid,String friendgroupname) throws Exception {
		TFriendGroup fg = new TFriendGroup();
		fg.setFriendgroupname(friendgroupname);
		fg.setUid(uid);
		Integer maxDisplayOrder = (Integer) sqlmap.queryForObject("friend.queryMaxDisplyOrderOfFriendGroup",uid);
		maxDisplayOrder = (maxDisplayOrder==null)?1:(maxDisplayOrder+1);
		fg.setDisplayorder(maxDisplayOrder);
		return dao.insert(fg);
	}
	
	/**
	 * 更新好友分组顺序
	 * @param uid
	 * @param friendgroupids
	 * @throws Exception
	 */
	public void updateFriendGroupOrder(Integer uid,Integer[] friendgroupids) throws Exception {
		sqlmap.update("friend.updateAllFriendGroupOrderToZero",uid);
		for(int i=0;i<friendgroupids.length;i++) {
			TFriendGroup fg = new TFriendGroup();
			fg.setUid(uid);
			fg.setFriendgroupid(friendgroupids[i]);
			fg.setDisplayorder(i+1);
			sqlmap.update("friend.updateFriendGroupOrder", fg);
		}
	}
	
	/**
	 * 更新好友分组名称
	 * @param friendgroupid
	 * @param friendgroupname
	 * @throws Exception
	 */
	public void updateFriendGroupName(Integer uid,Integer friendgroupid,String friendgroupname) throws Exception {
		Map<String,Object> m = new HashMap<String,Object>();
		m.put("friendgroupid", friendgroupid);
		m.put("friendgroupname", friendgroupname);
		m.put("uid", uid);
		sqlmap.update("friend.updateFriendGroup", m);
	}
	public void delFriendGroup(Integer friendgroupid,Integer uid) throws Exception {
		Map<String,Object> m = new HashMap<String,Object>();
		m.put("uid", uid);
		m.put("friendgroupid", friendgroupid);
		// 根据用户和要删除的组查找这个组下的全部好友
		List<Integer> fuidlist = sqlmap.queryForList("friend.queryFriendByGroupID", m);
		// 查询这个组下的好友是否是单分组，还是多分组，单分组，转移到未分组，多分组直接将这个组删除
		for (int i = 0; i < fuidlist.size(); i++) {
			int friendid = (Integer) fuidlist.get(i);
			m.put("friendid", friendid);
			List sfgs = sqlmap.queryForList("friend.queryFriendIsExist", m);
			if (sfgs.size() > 1) {
				sqlmap.delete("friend.delFriendByFriendgroupid", m);
			} else {
				m.put("friendgroupid", 0);
				sqlmap.update("friend.updateFriendgroupByFriend", m);
			}
		}
		sqlmap.delete("friend.delFriendGroup", friendgroupid);
	}
	/*好友分组*/
	
	// 查询用户所有好友分组
	public List<TFriendGroup> queryFriendGroupByUid(Integer uid) throws Exception {
		return sqlmap.queryForList("friend.queryFriendgroupByUid", uid);
	}
	
	/**
	 * 查询某用户的好友，在哪几个分组里
	 * @param uid
	 * @param friendId
	 * @return
	 * @throws Exception
	 */
	public List<TFriendGroup> queryFriendGroupByFriendId(Integer uid,Integer friendid) throws Exception {
		TFriend f = new TFriend();
		f.setUid(uid);
		f.setFriendid(friendid);
		return sqlmap.queryForList("friend.queryFriendGroupByFriendId", f);
	}
	
	// 分页查询用户全部（分组）好友
	public PageResult<FriendVO> queryFriendByUid(Integer uid, Integer friendgroupid,String keyword,PageParam pp) throws Exception {
		UserService userService = new UserService();
		SnsService snsService = new SnsService();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uid", uid);
		map.put("friendgroupid", friendgroupid);
		map.put("pp", pp);
		map.put("keyword",keyword);
		Integer itemCount = null;
		List<FriendVO> list = new ArrayList<FriendVO>();
		if(keyword == null || "null".equals(keyword) || "".equals(keyword)){
			itemCount =(Integer) sqlmap.queryForObject("friend.queryFriendCount", map);
			list = (List<FriendVO>)sqlmap.queryForList("friend.queryFriendByUid", map);
		} else {
			itemCount =(Integer) sqlmap.queryForObject("friend.queryFriendByKeywordCount", map);
			list = (List<FriendVO>)sqlmap.queryForList("friend.queryFriendByKeyword", map);
		}
		for(int i = 0; i < list.size(); i++) {
			int friendid = list.get(i).getFriendid();
			Map<String,Object> m = new HashMap<String,Object>();
			m.put("friendid", friendid);
			m.put("uid", uid);
			List<FriendVO> groupList = sqlmap.queryForList("friend.queryFriendgroupByFriendid", m);
			list.get(i).setFriendGroups(groupList);
			String groupname = "";
			for (int j = 0; j < groupList.size(); j++) {
				if(groupList.get(j).getFriendgroupid() == 0){
					groupname += "未分组";
				} else {
					groupname += groupList.get(j).getFriendgroupname();
				}
				groupname += " ";
			}
			if(groupname.length() < 7){
				list.get(i).setFriendgroupname(groupname.substring(0,groupname.length()-1));
			} else {
				list.get(i).setFriendgroupname(groupname.substring(0,7)+"..");
			}	
			
			SnsUserInfoVO userinfo = userService.queryUserInfo(uid,friendid);
			list.get(i).setAvatarFileName(userinfo.getAvatarFileName());
			list.get(i).setOname(userinfo.getOname());
			list.get(i).setRemarkName(userinfo.getRemarkName());
			list.get(i).setFans(userinfo.getFans());
			list.get(i).setFollows(userinfo.getFollows());
			list.get(i).setGroups(userinfo.getGroups());
			list.get(i).setPubs(userinfo.getPubs());
			list.get(i).setZonename(userinfo.getNowZoneName());
			
			String text = "";
			if(list.get(i).getNewpost() != null){
				if(list.get(i).getNewpost().length() <= 200){
					text = PsfHtmlUtils.decodeText(list.get(i).getNewpost());
					list.get(i).setNewpost(Smiley.replaceSmiley(text));
				} else {
					String str = "...<a  href='/post/"+list.get(i).getPostid()+"' target='_blank'>[查看原文]</a>";
					text = PsfHtmlUtils.decodeText(list.get(i).getNewpost().substring(0, 200));
					list.get(i).setNewpost(Smiley.replaceSmiley(text)+str);
				}	
			}
		}
		return new PageResult<FriendVO>(list,itemCount,pp.getPageSize());
	}
	/**
	 * 按最新，最近联系查看好友
	 * type=1 最新
	 * type=2 最近联系
	 * 
	 * tab=1 好友 tab=2 关注 tab=3 粉丝
	 */
	public PageResult<FriendVO> queryFriendByType(Integer uid,PageParam pp,Integer type,Integer tab) throws Exception {
		UserService userService = new UserService();
		SnsService snsService = new SnsService();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uid", uid);
		map.put("pp", pp);
		Integer itemCount = null;
		List<FriendVO> list = new ArrayList<FriendVO>();
		if(tab == 1){
			itemCount = (Integer) sqlmap.queryForObject("friend.queryFriendCount", map);
			if(type == 1){
				list = sqlmap.queryForList("friend.queryFriendByNew", map);
			} else {
				list = sqlmap.queryForList("friend.queryFriendByRelation", map);
			}
		} else if (tab == 2){
			itemCount = (Integer)sqlmap.queryForObject("follow.queryMyFollowCount", uid);
			if(type == 1){
				list = sqlmap.queryForList("follow.queryFollowByNew", map);
			} else {
				list = sqlmap.queryForList("follow.queryFollowByRelation", map);
			}
		} else {
			itemCount = (Integer)sqlmap.queryForObject("follow.queryMyFansCount",uid);
			if(type == 1){
				list = sqlmap.queryForList("follow.queryFansByNew", map);
			} else {
				list = sqlmap.queryForList("follow.queryFansByRelation", map);
			}
		}

		for(int i = 0; i < list.size(); i++) {
			int friendid = list.get(i).getFriendid();
			Map<String,Object> m = new HashMap<String,Object>();
			m.put("uid", uid);
			List<FriendVO> groupList = new ArrayList<FriendVO>();
			if(tab == 1){
				m.put("friendid", friendid);
				groupList = sqlmap.queryForList("friend.queryFriendgroupByFriendid", m);
				list.get(i).setFriendGroups(groupList);
				String groupname = "";
				for (int j = 0; j < groupList.size(); j++) {
					if(groupList.get(j).getFriendgroupid() == 0){
						groupname += "未分组";
					} else {
						groupname += groupList.get(j).getFriendgroupname();
					}
					groupname += " ";
				}
				if(groupname.length() < 7){
					list.get(i).setFriendgroupname(groupname.substring(0,groupname.length()-1));
				} else {
					list.get(i).setFriendgroupname(groupname.substring(0,7)+"..");
				}	
			} else if(tab == 2) {
				m.put("followuid", friendid);
				groupList = sqlmap.queryForList("follow.queryFollowgroupByFollowuid", m);
				String groupname = "";
				for (int j = 0; j < groupList.size(); j++) {
					if(groupList.get(j).getFollowgroupname() == null){
						groupname += "未分组";
					} else {
						groupname += groupList.get(j).getFollowgroupname();
					}
					groupname += ",";
				}
				list.get(i).setFollowgroupname(groupname.substring(0,groupname.length()-1));
			}

			SnsUserInfoVO userinfo = userService.queryUserInfo(uid,friendid);
			list.get(i).setAvatarFileName(userinfo.getAvatarFileName());
			list.get(i).setOname(userinfo.getOname());
			list.get(i).setRemarkName(userinfo.getRemarkName());
			list.get(i).setFans(userinfo.getFans());
			list.get(i).setFollows(userinfo.getFollows());
			list.get(i).setGroups(userinfo.getGroups());
			list.get(i).setPubs(userinfo.getPubs());
			list.get(i).setUsername(userinfo.getUsername());
			list.get(i).setIsfollow(userinfo.getIsfollow());
			list.get(i).setIsfans(userinfo.getIsfans());
			list.get(i).setZonename(userinfo.getNowZoneName());
			
			String text = "";
			if(list.get(i).getNewpost() != null){
				if(list.get(i).getNewpost().length() <= 200){
					text = PsfHtmlUtils.decodeText(list.get(i).getNewpost());
					list.get(i).setNewpost(Smiley.replaceSmiley(text));
				} else {
					String str = "...<a  href='/post/"+list.get(i).getPostid()+"' target='_blank'>[查看原文]</a>";
					text = PsfHtmlUtils.decodeText(list.get(i).getNewpost().substring(0, 200));
					list.get(i).setNewpost(Smiley.replaceSmiley(text)+str);
				}	
			}
		}
		return new PageResult<FriendVO>(list,itemCount,pp.getPageSize());
	}

	//查询好友是否存在
	public Boolean queryFriendIsExist(Integer uid, Integer friendid)throws Exception {
		Boolean flag = false;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uid", uid);
		map.put("friendid", friendid);
		List<TFriend> friendlist = sqlmap.queryForList("friend.queryFriendIsExist", map);
		if (friendlist != null && friendlist.size() > 0)
			flag = true;
		return flag;
	}
	public static final Integer FriendOfFriendType_All = 0;
	public static final Integer FriendOfFriendType_Classmate = 1;
	public static final Integer FriendOfFriendType_Workmate = 2;
	public static final Integer FriendOfFriendType_SameCity = 3;
	public static final Integer FriendOfFriendType_SameHometown = 4;
	public static final Integer FriendOfFriendType_DiffSex = 5;
	
	// 二度好友，好友的好友 flag标记二度好友的类别
	public PageResult<FriendVO> queryFriendOfFriend(Integer uid, PageParam pp,Integer type) throws Exception {
		UserService userService = new UserService();	
		List<Integer> fuidList = sqlmap.queryForList("friend.queryFriend", uid);
		if(fuidList == null || fuidList.size() == 0){
			return null;
		} else {
			Map<String,Object> m = new HashMap<String,Object>();
			m.put("fuidList", fuidList);
			m.put("uid", uid);
			m.put("pp", pp);
			Integer itemCount = null;
			List<FriendVO> list = null;
			if (type == FriendOfFriendType_All) { // 全部
				itemCount = (Integer) sqlmap.queryForObject("friend.queryFriendOfFriendAllCount", m);
				list = sqlmap.queryForList("friend.queryFriendOfFriendAll", m);
			} else if (type == FriendOfFriendType_Workmate) { // 同事
				itemCount = (Integer) sqlmap.queryForObject("friend.queryFriendOfFriendWorkmateCount", m);
				list = sqlmap.queryForList("friend.queryFriendOfFriendWorkmate", m);
			} else if (type == FriendOfFriendType_Classmate) { // 同学
				itemCount = (Integer) sqlmap.queryForObject("friend.queryFriendOfFriendClassmateCount", m);
				list = sqlmap.queryForList("friend.queryFriendOfFriendClassmate", m);
			} else if (type == FriendOfFriendType_SameHometown) { // 同乡
				itemCount = (Integer) sqlmap.queryForObject("friend.queryFriendOfFriendSameHomeTownCount", m);
				list = sqlmap.queryForList("friend.queryFriendOfFriendSameHomeTown", m);
			} else if (type == FriendOfFriendType_SameCity) { // 同城
				itemCount = (Integer) sqlmap.queryForObject("friend.queryFriendOfFriendSameCityCount", m);
				list = sqlmap.queryForList("friend.queryFriendOfFriendSameCity", m);
			} else if (type == FriendOfFriendType_DiffSex) { // 异性
				itemCount = (Integer) sqlmap.queryForObject("friend.queryFriendOfFriendDiffSexCount", m);
				list = sqlmap.queryForList("friend.queryFriendOfFriendDiffSex", m);
			}
			// 统计品友的好友 的好友和我的好友共同的人和共同人的信息
			if(list != null && list.size() != 0) {
				for (int i = 0; i < list.size(); i++) {
					Set<Integer> s = new HashSet<Integer>();
					List<TUser> users = new ArrayList<TUser>();
					//品友的好友的好友
					List<Integer> friendidList = sqlmap.queryForList("friend.queryFriend",list.get(i).getFriendid());
					for (int j = 0; j < friendidList.size(); j++) {	
						if ( fuidList.contains(friendidList.get(j)) ) {
							s.add(friendidList.get(j));
							users.add(userService.queryUserByID(friendidList.get(j)));		
						}
					}
					list.get(i).setTogfriendcount(s.size());
					list.get(i).setUsers(users);

					SnsUserInfoVO userinfo = userService.queryUserInfo(uid,list.get(i).getFriendid());
					list.get(i).setAvatarFileName(userinfo.getAvatarFileName());
					list.get(i).setOname(userinfo.getOname());
					list.get(i).setRemarkName(userinfo.getRemarkName());	
					list.get(i).setZonename(userinfo.getNowZoneName());
					list.get(i).setIsfollow(userinfo.getIsfollow());
					list.get(i).setIsfriend(userinfo.getIsfriend());
				}
			}
			return new PageResult(list, itemCount, pp.getPageSize());
		}	
	}
	/**
	 * 一键关注
	 * @param uid
	 * @throws Exception
	 */
	public Boolean followAll(Integer uid) throws Exception {
		FollowService followService = new FollowService();
		List<Integer> followuidList = sqlmap.queryForList("friend.queryFriendofFriendAndNotFollow", uid);
		if(followuidList.size() == 0 || followuidList == null){
			return false;
		} else {
			for(Integer followuid:followuidList) {
				followService.addFollow(uid, followuid,0);
			}
			return true;
		}
		
	}
	/**
	 * 寻找好友 
	 *  flag 为查找类型（同学，同事等）
	 *  keyword 当前类型下的搜索
	 * */
	public static final int SearchFriendType_Workmate = 1;
	public static final int SearchFriendType_Classmate = 2;
	public static final int SearchFriendType_SameBusiness = 3;
	public static final int SearchFriendType_MayLike = 4;
	
	public PageResult<FriendVO> searchFriend(Integer uid,PageParam pp,int flag,String keyword) throws Exception {
		Integer itemCount = null;
		List<FriendVO> list = null;
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("uid", uid);
		map.put("keyword",keyword);
		map.put("pp", pp);
		List<String> mySchool = sqlmap.queryForList("friend.queryMySchool", uid);
		List<String> myCompany = sqlmap.queryForList("friend.queryMyCompany", uid);
		map.put("mySchool", mySchool);
		map.put("myCompany", myCompany);
		if(keyword == null){
			if(flag == SearchFriendType_Workmate){
				itemCount = (Integer) sqlmap.queryForObject("friend.queryLikeWorkmateCount", map);
				list = sqlmap.queryForList("friend.queryLikeWorkmate", map);	
			}else if(flag == SearchFriendType_Classmate){
				itemCount = (Integer) sqlmap.queryForObject("friend.queryLikeSchoolmateCount", map);
				list = sqlmap.queryForList("friend.queryLikeSchoolmate", map);	
			}else if(flag == SearchFriendType_SameBusiness){
				itemCount = (Integer)sqlmap.queryForObject("friend.queryLikeSameBusinessCount", map);
				list = sqlmap.queryForList("friend.queryLikeSameBusiness", map);
			} else{
				itemCount = (Integer)sqlmap.queryForObject("friend.queryMaybeYouLikeCount", uid);
				list = sqlmap.queryForList("friend.queryMaybeYouLike", map);
			}
		} else {
			if(flag == SearchFriendType_Workmate) {
				itemCount = (Integer) sqlmap.queryForObject("friend.queryLikeWorkmateByKeywordCount", map);
				list = sqlmap.queryForList("friend.queryLikeWorkmateByKeyword", map);	
			} else if (flag == SearchFriendType_Classmate) {
				itemCount = (Integer) sqlmap.queryForObject("friend.queryLikeSchoolmateByKeywordCount", map);
				list = sqlmap.queryForList("friend.queryLikeSchoolmateByKeyword", map);
			} else if (flag == SearchFriendType_SameBusiness) {
				itemCount = (Integer) sqlmap.queryForObject("friend.queryLikeSameBusinessByKeywordCount", map);
				list = sqlmap.queryForList("friend.queryLikeSameBusinessByKeyword", map);
			} else {
				itemCount = (Integer) sqlmap.queryForObject("friend.queryMaybeYouLikeByKeywordCount", map);
				list = sqlmap.queryForList("friend.queryMaybeYouLikeByKeyword", map);
			}
		}
		
		for(FriendVO friend:list){
			friend.setAvatarFileName(this.queryAvatarFileName(friend.getAvatarFileName()));
		}
		return new PageResult<FriendVO>(list, itemCount, pp.getPageSize());
	}
	
	public static final int RecommendType_Follow = 1;
	public static final int RecommendType_Fans = 2;
	public static final int RecommendType_Friend = 3;
	/**
	 * 查询推送信息可能喜欢的品友 
	 *  flag 为查找类型（关注人，粉丝，好友）
	 */
	public  PageResult<FriendVO> queryFriendRecommend(Integer uid, PageParam pp,int type)throws Exception {
		List<Integer> followuidList = sqlmap.queryForList("friend.queryMyFollow", uid);
		List<Integer> fansList = sqlmap.queryForList("friend.queryMyFans", uid);
		List<Integer> friendList = sqlmap.queryForList("friend.queryFriend", uid);
		Integer itemCount = null;
		List<FriendVO> list = null;
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("uid",uid);
		map.put("offset", pp.getOffset());
		map.put("pageSize", pp.getPageSize());
		map.put("followuidList", followuidList);
		map.put("fansList", fansList);
		map.put("fuidList", friendList);
		if(type == RecommendType_Follow) {
			if(followuidList.size() != 0) {
				itemCount = (Integer)sqlmap.queryForObject("friend.queryFriendRecommendByFollowCount",map);
				list = sqlmap.queryForList("friend.queryFriendRecommendByFollow", map);
			} else {
				itemCount = (Integer)sqlmap.queryForObject("friend.queryHotFriendCount",map);
				list = sqlmap.queryForList("friend.queryHotFriend",map);
			}		
		}else if(type == RecommendType_Fans) {
			if(fansList.size() != 0){
				itemCount = (Integer)sqlmap.queryForObject("friend.queryFriendRecommendByFollowCount",map);
				list = sqlmap.queryForList("friend.queryFriendRecommendByFollow", map);
			}else{
				itemCount = (Integer)sqlmap.queryForObject("friend.queryHotFriendCount",map);
				list = sqlmap.queryForList("friend.queryHotFriend",map);
			}
		} else if (type == RecommendType_Friend) {
			System.out.println("可能喜欢的品友");
			if(friendList.size() != 0 && friendList != null){
				System.out.println("品友好友不空");
				itemCount = (Integer)sqlmap.queryForObject("friend.queryFriendRecommendByFriendCount",map);
				list = sqlmap.queryForList("friend.queryFriendRecommendByFriend", map);
			}else{
				itemCount = (Integer)sqlmap.queryForObject("friend.queryHotFriendCount",map);
				list = sqlmap.queryForList("friend.queryHotFriend",map);
			}
		}
		for(FriendVO friend:list){
			UserService userService = new UserService();
			SnsUserInfoVO user = null;
			if(friendList.size() != 0 && friendList != null){
				user = userService.queryUserInfo(uid, friend.getFriendid());
			} else {
				user = userService.queryUserInfo(uid, friend.getUid());
			}
			 
			friend.setAvatarFileName(user.getAvatarFileName());
			friend.setZonename(user.getNowZoneName());
			friend.setRemarkName(user.getRemarkName());
		}
		return new PageResult<FriendVO>(list, itemCount, pp.getPageSize());
	}
	/**
	 * 
	 * 推荐引荐好友
	 * @param uid
	 * @param friendid
	 * @param type  好友(1)，粉丝(2),关注(3)
	 * @param pp
	 * @param keyword
	 * @return
	 * @throws Exception
	 */
	public PageResult<SnsUserInfoVO> queryTuijianFriend(Integer uid,Integer friendid,int type,PageParam pp,String keyword) throws Exception {
		Integer itemCount = null;
		List<SnsUserInfoVO> list = new ArrayList<SnsUserInfoVO>();
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("uid", uid);
		map.put("friendid", friendid);
		map.put("pp", pp);
		map.put("keyword", keyword);
		if(type == 1){
			itemCount = (Integer)sqlmap.queryForObject("friend.queryMyFriendExceptTaCount", map);
			list = sqlmap.queryForList("friend.queryMyFriendExceptTa", map);
		} else if(type == 2){
			itemCount = (Integer)sqlmap.queryForObject("friend.queryMyFansExceptTaCount", map);
			list = sqlmap.queryForList("friend.queryMyFansExceptTa", map);
		} else {
			itemCount = (Integer)sqlmap.queryForObject("friend.queryMyFollowExceptTaCount", map);
			list = sqlmap.queryForList("friend.queryMyFollowExceptTa", map);
		}
		for(SnsUserInfoVO user:list){
			if(user.getAvatarFileName() != null){
				TPic p = (TPic)sqlmap.queryForObject("sns.queryPicByPicid", Integer.parseInt(user.getAvatarFileName()));
				user.setAvatarFileName(user.getAvatarFileName()+"."+p.getFiletype());
			} else {
				user.setAvatarFileName("1.jpg");
			}
		}
		return new PageResult<SnsUserInfoVO>(list,itemCount,pp.getPageSize());
	}
	
	public int addIntroduct(TIntroduce introduce) throws Exception {
		return dao.insert(introduce);
	}
	
	public String queryAvatarFileName(String avatarFileName) throws Exception {
		if(avatarFileName != null){
			TPic p = (TPic)sqlmap.queryForObject("sns.queryPicByPicid", Integer.parseInt(avatarFileName));
			return avatarFileName+"."+p.getFiletype();
		} else {
			return "1.jpg";
		}
	}
	
	public PageResult<IntroduceVO> queryMyGetIntroduce(Integer touid,PageParam pp) throws Exception{
		ZoneService zoneService = new ZoneService();
		List<Integer> myFriends = sqlmap.queryForList("friend.queryFriend", touid);
		List<Integer> myFollows = sqlmap.queryForList("friend.queryMyFollow", touid);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("touid", touid);
		map.put("pp", pp);
	
		Integer itemCount = (Integer)sqlmap.queryForObject("friend.queryMyGetIntroduceCount", touid);
		List<IntroduceVO> list = sqlmap.queryForList("friend.queryMyGetIntroduce", map);
		if(itemCount == null || itemCount == 0){
			return null;
		} else {
		for(IntroduceVO introduce : list){
			String uids = "";
			
			introduce.setTime(new PsfTime(introduce.getAddtime()).toChnDateString());
			introduce.setAvatarFileName(queryAvatarFileName(introduce.getAvatarFileName()));
			
			map.put("uid", introduce.getUid());
			List<SnsUserInfoVO> users = sqlmap.queryForList("friend.queryMyIntroduceFriends", map);
			for(SnsUserInfoVO user : users){
				List<Integer> taFriends = sqlmap.queryForList("friend.queryFriend", user.getUid());
				
				user.setAvatarFileName(queryAvatarFileName(user.getAvatarFileName()));
				
				TZone z = zoneService.queryZoneByID(Integer.parseInt(user.getNowZoneName()));
				String provice = "";
				if(z.getLevel1id()!=0){
					TZone tz = zoneService.queryZoneByID(z.getLevel1id());
					provice = tz.getZonename();
				}
				user.setNowZoneName(provice+"，"+z.getZonename());
				
	
				Set<Integer> s = new HashSet<Integer>();
				for(Integer j:taFriends){
					if ( myFriends.contains(j) ) {
						s.add(j);
					}
				}
				user.setTogFriendCount(s.size());
				
				if(myFriends.contains(user.getUid())){
					user.setIsfriend(true);		//是好友
				} else {
					user.setIsfriend(false);
				}
				
				if(myFollows.contains(user.getUid())){
					user.setIsfollow(true);
				} else {
					user.setIsfollow(false);
				}
				
				uids += user.getUid();
				uids += ",";
			}
			
			introduce.setUids(uids.substring(0, uids.length()-1));
			introduce.setUsers(users);
		}
		
		return new PageResult<IntroduceVO>(list,itemCount,pp.getPageSize());
		}
	}
	
	public void delIntroduce(Integer uid,Integer touid) throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("uid", uid);
		map.put("touid", touid);
		sqlmap.delete("friend.delMyIntroduce", map);
	}
	public void delSendIntroduce(Integer uid,Integer touid) throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("uid", uid);
		map.put("touid", touid);
		sqlmap.delete("friend.delMySendIntroduce", map);
	}
	
	public PageResult<IntroduceVO> queryMySendIntroduce(Integer uid,PageParam pp) throws Exception{
		ZoneService zoneService = new ZoneService();
		List<Integer> myFriends = sqlmap.queryForList("friend.queryFriend", uid);
		List<Integer> myFollows = sqlmap.queryForList("friend.queryMyFollow", uid);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("uid", uid);
		map.put("pp", pp);
	
		Integer itemCount = (Integer)sqlmap.queryForObject("friend.queryMySendIntroduceCount", uid);
		List<IntroduceVO> list = sqlmap.queryForList("friend.queryMySendIntroduce", map);
		if(itemCount == null || itemCount == 0){
			return null;
		} else {
			
			for(IntroduceVO introduce : list){
				String uids = "";	
				introduce.setTime(new PsfTime(introduce.getAddtime()).toChnDateString());
				introduce.setAvatarFileName(queryAvatarFileName(introduce.getAvatarFileName()));		
				map.put("touid", introduce.getTouid());
				List<SnsUserInfoVO> users = sqlmap.queryForList("friend.queryMyIntroduceFriends", map);
				
				for(SnsUserInfoVO user : users){
					List<Integer> taFriends = sqlmap.queryForList("friend.queryFriend", user.getUid());	
					user.setAvatarFileName(queryAvatarFileName(user.getAvatarFileName()));			
					TZone z = zoneService.queryZoneByID(Integer.parseInt(user.getNowZoneName()));
					String provice = "";
					if(z.getLevel1id()!=0){
						TZone tz = zoneService.queryZoneByID(z.getLevel1id());
						provice = tz.getZonename();
					}
					user.setNowZoneName(provice+","+z.getZonename());
					
					Set<Integer> s = new HashSet<Integer>();
					for(Integer j:taFriends){
						if ( myFriends.contains(j) ) {
							s.add(j);
						}
					}
					user.setTogFriendCount(s.size());
					
					if(myFriends.contains(user.getUid())){
						user.setIsfriend(true);		//是好友
					} else {
						user.setIsfriend(false);
					}
					
					if(myFollows.contains(user.getUid())){
						user.setIsfollow(true);
					} else {
						user.setIsfollow(false);
					}
					
					uids += user.getUid();
					uids += ",";
				}
				
				introduce.setUids(uids.substring(0, uids.length()-1));
				introduce.setUsers(users);
			}
			
			return new PageResult<IntroduceVO>(list,itemCount,pp.getPageSize());
		}
	}
	
	public List<Integer> queryFriendByType(Integer uid,Integer friendid,Integer type) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("uid", uid);
		map.put("friendid", friendid);
		List<Integer> list = new ArrayList<Integer>();
		if(type == 1){
			list = sqlmap.queryForList("friend.queryMyFriend", map);
		} else if(type == 2){
			list = sqlmap.queryForList("friend.queryMyFan", map);
		} else {
			list = sqlmap.queryForList("friend.queryMyFol", map);
		}
		return list;
	}
	
	public List<Integer> queryMyFriendAndFollow(Integer uid) throws Exception {
		return sqlmap.queryForList("friend.queryMyFriendAndFollow", uid);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
