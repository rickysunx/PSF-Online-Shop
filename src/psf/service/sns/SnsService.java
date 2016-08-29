/**
 * SNS公共
 * @author 于淼
 */
package psf.service.sns;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import psf.Psf;
import psf.PsfService;
import psf.common.PageParam;
import psf.common.PageResult;
import psf.common.PsfShortUrl;
import psf.entity.TBlacklist;
import psf.entity.TInviteCode;
import psf.entity.TLike;
import psf.entity.TRemarklist;
import psf.entity.TUrl;
import psf.service.common.UserService;
import psf.vo.sns.AtUserVO;
import psf.vo.sns.LikeUserVO;
import psf.vo.sns.SnsUserInfoVO;
import psf.vo.sns.right.SnsRightUserVO;

public class SnsService extends PsfService {
	/**
	 * 加喜欢
	 */
	public void addLike(int uid, int otype, int oid) throws Exception {
		TLike like = new TLike();
		like.setOid(oid);
		like.setOtype(otype);
		like.setUid(uid);
		dao.insert(like);
	}
	
	public void saveLike(int uid,int otype,int oid) throws Exception {
		
		delLike(uid, otype, oid);
		addLike(uid, otype, oid);
		if(otype==Psf.OTYPE_Blog || otype==Psf.OTYPE_Show || 
				otype==Psf.OTYPE_Guide || otype==Psf.OTYPE_Shopexp) {
			PostService postService = new PostService();
			postService.updatePostCounts(oid);
		}
	}
	

	/**
	 * 取消喜欢
	 */
	public void delLike(int uid, int otype, int oid) throws Exception {
		TLike like = new TLike();
		like.setOid(oid);
		like.setOtype(otype);
		like.setUid(uid);
		sqlmap.delete("sns.delLike", like);
	}
	
	/**
	 * 是否已喜欢
	 */
	public boolean isLikedByUid(int uid,int otype,int oid) throws Exception {
		TLike like = new TLike();
		like.setOid(oid);
		like.setOtype(otype);
		like.setUid(uid);
		Integer count = (Integer)sqlmap.queryForObject("sns.isLikedByUid", like);
		return count!=null&&count>0;
	}

	/**
	 * 根据对象类型和对象ID查询其被喜欢
	 * 
	 * @param otype
	 * @param oid
	 * @return
	 * @throws Exception
	 */
	public Integer queryLikeCountByOid(Integer otype, Integer oid) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("otype", otype);
		param.put("oid", oid);
		return (Integer) sqlmap.queryForObject("sns.queryLikeCountByOid", param);
	}
	
	/**
	 * 
	 * @param otype
	 * @param oid
	 * @param pp
	 * @return
	 * @throws Exception
	 */
	public PageResult<LikeUserVO> queryLikeUserByOid(Integer otype, Integer oid, PageParam pp) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("otype", otype);
		param.put("oid", oid);
		Integer count  = (Integer) sqlmap.queryForObject("sns.queryLikeCountByOid", param);
		param.put("offset", pp.getOffset());
		param.put("pageSize", pp.getPageSize());
		List<LikeUserVO> list = sqlmap.queryForList("sns.queryLikeUserByOid", param);
		for(LikeUserVO userVO : list){
			userVO.setAvatarFileName(userVO.getAvatarFileName()+".jpg");
		}
		return new PageResult<LikeUserVO>(list, count, pp.getPageSize());
	}



	/**
	 * 加黑名单
	 */
	public void addBlacklist(int uid, int blockuid) throws Exception {
		FollowService followService = new FollowService();
		FriendService friendService = new FriendService();
		
		//判断是否已在黑名单。
		if(queryIsBlacklist(uid, blockuid)){
			return;
		}
		
		//取消关注、取消好友。
		followService.delFollow(uid, blockuid);
		friendService.delFriend(uid, blockuid);
		
		TBlacklist b = new TBlacklist();
		b.setBlockuid(blockuid);
		b.setUid(uid);
		dao.insert(b);
	}

	/**
	 * 取消黑名单
	 */
	public void delBlackList(int uid, int blockuid) throws Exception {
		TBlacklist b = new TBlacklist();
		b.setBlockuid(blockuid);
		b.setUid(uid);
		sqlmap.delete("sns.delBlackList", b);
	}

	/**
	 * 是否黑名单
	 */
	public Boolean queryIsBlacklist(int uid, int blockuid)throws Exception {
		Boolean flag = false;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uid", uid);
		map.put("blockuid", blockuid);
		Integer count = (Integer) sqlmap.queryForObject("sns.queryBlacklistCount", map);
		if (count > 0)
			flag = true;
		return flag;
	}
	/**
	 * 查询用户黑名单
	 */
	public PageResult<SnsUserInfoVO> queryBlacklistByUid(Integer uid,PageParam pp) throws Exception {
		UserService userService = new UserService();
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("uid", uid);
		Integer itemCount = (Integer)sqlmap.queryForObject("sns.queryBlackListByUidCount", uid);
		List<SnsUserInfoVO> list = new ArrayList<SnsUserInfoVO>();
		if(pp == null){
			list = sqlmap.queryForList("sns.queryBlacklistByUid", map);
		}	
		for(SnsUserInfoVO user:list){
			SnsUserInfoVO userinfo = userService.queryUserInfo(uid, user.getUid());
			user.setAvatarFileName(userinfo.getAvatarFileName());
		}
		return new PageResult<SnsUserInfoVO>(list,itemCount);
	}

	/**
	 * 修改备注
	 */
	public void updateRemark(int uid, int remarkuid, String remarkname) throws Exception {
		TRemarklist r = new TRemarklist();
		r.setUid(uid);
		r.setRemarkuid(remarkuid);
		r.setRemarkname(remarkname);
		delRemark(uid, remarkuid);
		if (remarkname!=null && remarkname.trim().length() > 0) {
			dao.insert(r);
		}
	}

	/**
	 * 删除备注
	 */
	public void delRemark(int uid, int remarkuid) throws Exception {
		TRemarklist r = new TRemarklist();
		r.setUid(uid);
		r.setRemarkuid(remarkuid);
		sqlmap.delete("sns.delRemark", r);
	}
	/**
	 * 查询备注
	 */
	public String queryRemarkName(Integer loginUid,Integer remarkuid) throws Exception {
		Map m = new HashMap();
		m.put("uid", loginUid);
		m.put("remarkuid", remarkuid);
		return (String)sqlmap.queryForObject("sns.queryRemarkName", m);
	}
	
	
	private void setSnsRightUserVO(SnsRightUserVO uvo, Integer uid) throws Exception {
		UserService userService =  new UserService();
		SnsUserInfoVO userinfo = userService.queryUserInfo(uid, uvo.getUid());
		uvo.setAvatarFileName(userinfo.getAvatarFileName());
		uvo.setUsername(userinfo.getUsername());
		uvo.setIsFollow(userinfo.getIsfollow());
	}
	/**
	 * 推荐可能喜欢的品友，推荐具有共同关注人的品友，且尚未建立关系的品友
	 * @param uid 当前用户的ID
	 * @param pp 分页参数
	 * @return
	 * @throws Exception
	 */
	public PageResult<SnsRightUserVO> queryRecommendUser(Integer uid, PageParam pp) throws Exception {
		
		
		Integer count = (Integer) sqlmap.queryForObject("sns.countRecommendUser", uid);
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("uid", uid);
		param.put("offset", pp.getOffset());
		param.put("pageSize", pp.getPageSize());
		List<SnsRightUserVO> userlist = null;
		if(count > 0){
			userlist = sqlmap.queryForList("sns.queryRecommendUser", param);
		}else{	//如果没有推荐的品友，则推荐用户没有关注的热门品友
			count = (Integer) sqlmap.queryForObject("sns.countHotUserByUid", uid);
			userlist = sqlmap.queryForList("sns.queryHotUserByUid", param);
		}
		//设置用户的显示名、用户头像名，是否关注
		for(SnsRightUserVO user : userlist) {
			setSnsRightUserVO(user, uid);
		}
		return new PageResult<SnsRightUserVO>(userlist, count, pp.getPageSize());
	}
	
	/**
	 * 查询喜欢秀品的品友，体验发布商品的品友
	 * @param uid
	 * @param postid
	 * @param pp
	 * @return
	 * @throws Exception
	 */
	public PageResult<SnsRightUserVO> queryPostProductUser(Integer uid, Integer postid, PageParam pp) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("uid", uid);
		param.put("postid", postid);
		Integer count = (Integer)sqlmap.queryForObject("sns.countPostProductUser",param);
		PageResult<SnsRightUserVO> result = null;
		if(count > 0){
			param.put("offset", pp.getOffset());
			param.put("pageSize", pp.getPageSize());
			List<SnsRightUserVO> userlist = sqlmap.queryForList("sns.queryPostProductUser", param);
			//设置用户的显示名、用户头像名
			for(SnsRightUserVO user : userlist) {
				setSnsRightUserVO(user, uid);
			}
			result = new PageResult<SnsRightUserVO>(userlist, count, pp.getPageSize());
		}
		return result;
	}
	
	/**
	 * 查询喜欢指南品牌的品友
	 * @param uid
	 * @param postid
	 * @param pp
	 * @return
	 * @throws Exception
	 */
	public PageResult<SnsRightUserVO> queryPostBrandUser(Integer uid, Integer postid, PageParam pp) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("uid", uid);
		param.put("postid", postid);
		Integer count = (Integer)sqlmap.queryForObject("sns.countPostBrandUser",param);
		PageResult<SnsRightUserVO> result = null;
		if(count > 0){
			param.put("offset", pp.getOffset());
			param.put("pageSize", pp.getPageSize());
			List<SnsRightUserVO> userlist = sqlmap.queryForList("sns.queryPostBrandUser", param);
			//设置用户的显示名、用户头像名
			for(SnsRightUserVO user : userlist) {
				setSnsRightUserVO(user, uid);
			}
			result = new PageResult<SnsRightUserVO>(userlist, count, pp.getPageSize());
		}
		return result;
	}
	
	/**
	 * 新增短域名
	 * @param url
	 * @return http://t.psf100.com/deX23
	 * @throws Exception
	 */
	public String addUrl(TUrl url) throws Exception {
		Integer urlid = dao.insert(url);
		return Psf.ShortUrlPrefix+PsfShortUrl.int2strid(urlid);
	}
	
	/**
	 * 查询短域名
	 * @param url
	 * @return
	 * @throws Exception
	 */
	public TUrl queryUrl(String url) throws Exception {
		if(url.startsWith(Psf.ShortUrlPrefix)) {
			String strid = url.substring(Psf.ShortUrlPrefix.length());
			Integer urlid = PsfShortUrl.strid2int(strid);
			TUrl turl = (TUrl)sqlmap.queryForObject("sns.queryUrlById", urlid);
			return turl;
		}
		return null;
	}
	
	public TUrl queryUrlById(Integer urlid) throws Exception {
		return (TUrl)sqlmap.queryForObject("sns.queryUrlById", urlid);
	}	
	
	public PageResult<AtUserVO> queryAtUser(Integer uid,String name,PageParam pp) throws Exception {
		
		Map m = new HashMap();
		m.put("uid", uid);
		m.put("name", name);
		m.put("offset", pp.getOffset());
		m.put("size", pp.getPageSize());
		
		Integer atUserCount = (Integer) sqlmap.queryForObject("sns.queryAtUserCount",m);
		List<AtUserVO> atUserList = (List<AtUserVO>) sqlmap.queryForList("sns.queryAtUser", m);
		
		PageResult<AtUserVO> pr = new PageResult<AtUserVO>(atUserList,atUserCount,pp.getPageSize());
		
		return pr;
	}
	
	/**
	 * 根据type参数查询用户
	 * @param uid
	 * @param type 1-好友，2-关注，3-好友+关注，4-粉丝，5-好友+粉丝，6-粉丝+关注，7-好友+粉丝+关注
	 * @param keyword
	 * @param pp
	 * @return
	 * @throws Exception
	 */
	public PageResult<LikeUserVO> queryUserByType(Integer uid, Integer type, String keyword, PageParam pp) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("uid", uid);
		param.put("type", type);
		param.put("keyword", keyword);
		Integer count = (Integer)sqlmap.queryForObject("sns.countUserByType",param);
		PageResult<LikeUserVO> result = null;
		if(count > 0){
			param.put("offset", pp.getOffset());
			param.put("pageSize", pp.getPageSize());
			List<LikeUserVO> userlist = sqlmap.queryForList("sns.queryUserByType",param);
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
	 * 查询广播详细页右侧的用户信息
	 * @param curUid 当前登录用户ID
	 * @param uid 广播发布人ID
	 * @param type 1-好友，2-粉丝，3-关注，4-关注TA的还关注
	 * @param pp
	 * @return
	 * @throws Exception
	 */
	public PageResult<SnsRightUserVO> queryRightUserVO(Integer curUid, Integer uid, Integer type, PageParam pp) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("uid", uid);
		param.put("type", type);
		Integer count = (Integer)sqlmap.queryForObject("sns.countRightUserVO", param);
		PageResult<SnsRightUserVO> result = null;
		if(count > 0){
			param.put("offset", pp.getOffset());
			param.put("pageSize", pp.getPageSize());
			List<SnsRightUserVO> userlist = sqlmap.queryForList("sns.queryRightUserVO", param);
			for(SnsRightUserVO user : userlist) {
				setSnsRightUserVO(user, curUid);
			}
			result = new PageResult<SnsRightUserVO>(userlist, count, pp.getPageSize());
		}
		return result;
	}
	
	/**
	 * 增加邀请码
	 * @param code
	 * @throws Exception
	 */
	public void addInviteCode(TInviteCode code) throws Exception {
		dao.insert(code);
	}
	
	/**
	 * 更新邀请码
	 * @param code
	 * @throws Exception
	 */
	public void updateInviteCode(TInviteCode code) throws Exception {
		dao.update(code);
	}
	
	/**
	 * 查询邀请码
	 * @param invitecode
	 * @param oid
	 * @param otype
	 * @param uid 邀请发起人ID
	 * @throws Exception
	 */
	public TInviteCode queryInviteCode(String invitecode, Integer oid, Integer otype, Integer uid) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("invitecode", invitecode);
		param.put("oid", oid);
		param.put("otype", otype);
		param.put("uid", uid);
		return (TInviteCode)sqlmap.queryForObject("sns.queryInviteCode", param);
	}
}
