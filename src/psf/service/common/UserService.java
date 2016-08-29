/**
 * @author 于淼
 */
package psf.service.common;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import psf.PsfService;
import psf.common.PageParam;
import psf.common.PageResult;
import psf.common.PsfTime;
import psf.entity.EcsUsers;
import psf.entity.TIndustry;
import psf.entity.TPic;
import psf.entity.TUser;
import psf.entity.TUser0;
import psf.entity.TUserAccount;
import psf.entity.TUserAddress;
import psf.entity.TUserBalance;
import psf.entity.TUserCash;
import psf.entity.TUserCoin;
import psf.entity.TUserCoupon;
import psf.entity.TUserEdu;
import psf.entity.TUserExp;
import psf.entity.TUserJob;
import psf.entity.TUserPoint;
import psf.entity.TZone;
import psf.service.sns.FollowService;
import psf.service.sns.FriendService;
import psf.service.sns.PostService;
import psf.service.sns.SnsService;
import psf.vo.sns.IndustryVO;
import psf.vo.sns.SearchUserVO;
import psf.vo.sns.SnsUserInfoVO;
import psf.vo.sns.UserAddressVO;
import psf.vo.sns.UserCoinVO;
import psf.vo.sns.UserCouponVO;
import psf.vo.sns.UserPointVO;
import psf.vo.sns.WealthVO;
import psf.vo.sns.right.SnsRightUserVO;

public class UserService extends PsfService {
	/**
	 * 根据uid查询用户
	 */
	public TUser queryUserByID(int uid) throws Exception {
		return (TUser) sqlmap.queryForObject("user.queryUserByUid", uid);
	}
	
	public TUser0 queryUser0ByID(int uid) throws Exception {
		return (TUser0) sqlmap.queryForObject("user.queryUser0ByUid",uid);
	}
	
	public boolean usernameExists(Integer uid,String username) throws Exception {
		if(uid != null){
			Map m = new HashMap();
			m.put("uid", uid);
			m.put("username", username);
			Integer n = (Integer)sqlmap.queryForObject("user.usernameExists", m);
			return n!=null;
		} else {
			TUser user = (TUser)sqlmap.queryForObject("user.regUsernameCheck", username);
			return user!=null;
		}
	
	}
	
	public TUser queryPrivateByUid(Integer uid) throws Exception {
		return (TUser)sqlmap.queryForObject("user.queryPrivateByUid", uid);
	}
	public void updatePrivateByUid(Integer uid,Integer ap_msg,Integer ap_wealthtype) throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("uid", uid);
		map.put("ap_msg", ap_msg);
		map.put("ap_wealthtype", ap_wealthtype);
		sqlmap.update("user.updatePrivateByUid", map);
	}
	public boolean emailExists(Integer uid,String email) throws Exception {
		if(uid != null){
			Map m = new HashMap();
			m.put("uid", uid);
			m.put("email", email);
			Integer n = (Integer)sqlmap.queryForObject("user.emailExists", m);
			return n!=null;
		} else {
			TUser user = (TUser)sqlmap.queryForObject("user.regEmailCheck",email);
			return user!=null;
		}

	}
	public void addBalance(TUserBalance balance) throws Exception {
		dao.insert(balance);
	}
	/**
	 * 查询所有行业
	 * 
	 */
	public List<IndustryVO> queryAllIndustry() throws Exception {
		List<TIndustry> listAllIndustry = sqlmap.queryForList("user.queryAllIndustry");
		List<IndustryVO> listIndustryVO = new ArrayList<IndustryVO>();
		
		for (TIndustry t:listAllIndustry) {
			if(t.getParentid() == 0) {
				IndustryVO ivo = new IndustryVO();
				ivo.setIndustryid(t.getIndustryid());
				ivo.setParentid(0);
				ivo.setIndustryname(t.getIndustryname());
				ivo.setChildren(new ArrayList());
				listIndustryVO.add(ivo);
			}
		}
		
		
		for(TIndustry t:listAllIndustry) {
			if(t.getParentid() != 0) {
				for(IndustryVO parivo:listIndustryVO) {
					if(parivo.getIndustryid().equals(t.getParentid())) {
						IndustryVO ivo = new IndustryVO();
						ivo.setIndustryid(t.getIndustryid());
						ivo.setIndustryname(t.getIndustryname());
						ivo.setParentid(parivo.getIndustryid());
						parivo.getChildren().add(ivo);
					}
				}
			}
		}
		return listIndustryVO;
	}
	
	public void updateIndustryByUid(Integer uid,Integer industryid,Integer ap_industry) throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("uid", uid);
		map.put("industryid", industryid);
		map.put("ap_industry", ap_industry);
		sqlmap.update("user.updateIndustryByUid",map);
	}
	public TIndustry queryIndustryByIndustryid(Integer industryid) throws Exception {
		return (TIndustry)sqlmap.queryForObject("user.queryIndustryByIndustryid", industryid);
	}
	/**
	 * 
	 * @param uid 当前登录的用户ID
	 * @param ouid 需要查询的用户ID
	 * @return
	 * @throws Exception
	 */
	public SnsUserInfoVO queryUserInfo(Integer uid,Integer ouid) throws Exception {
		SnsService snsService = new SnsService();
		ZoneService zoneService = new ZoneService();
		FriendService friendService = new FriendService();
		FollowService followService = new FollowService();
		
		TUser user = queryUserByID(ouid);
		TUserBalance balance = queryUserBalanceByUid(ouid);
		SnsUserInfoVO userInfo = new SnsUserInfoVO();
		userInfo.setFans(balance.getFans());
		userInfo.setFollows(balance.getFollows());
		userInfo.setFriends(balance.getFriends());
		userInfo.setGroups(balance.getGroupcount());
		userInfo.setGroupfriends(balance.getGroupfriends());
		userInfo.setVisits(balance.getVisitcount());
		userInfo.setPoints(balance.getPoints());
		userInfo.setCoins(balance.getCoins());
		userInfo.setCoupon(balance.getCoupon());
		userInfo.setMedal(balance.getMedal());
		userInfo.setUsername(user.getUsername());
		userInfo.setSignature(user.getSignature());
		userInfo.setSex(user.getSex());
		userInfo.setSnsstatus(user.getSnsstatus());
		userInfo.setUid(ouid);
		userInfo.setPubs(balance.getGuidecount()+balance.getShopexpcount()+balance.getShowcount());
		
		if(user.getNowzoneid() != null){
			TZone z = zoneService.queryZoneByID(user.getNowzoneid());
			String provice = "";
			if(z.getLevel1id()!=0){
				TZone tz = zoneService.queryZoneByID(z.getLevel1id());
				provice = tz.getZonename();
			}
			userInfo.setNowZoneName(provice+"，"+z.getZonename());
		}
		if(user.getAvatarid() != null){
			TPic p = (TPic)sqlmap.queryForObject("sns.queryPicByPicid", user.getAvatarid());
			userInfo.setAvatarFileName(user.getAvatarid()+"."+p.getFiletype());
		}else{
			userInfo.setAvatarFileName("1.jpg");
		}
		
		if(uid != null){	//登录用户可获取的用户信息
			String oname = snsService.queryRemarkName(uid, ouid);
			userInfo.setOname(oname);
			if(oname != null && oname.length() > 0){
				userInfo.setRemarkName(oname);
			}
			
			//是否关注，是否为好友
			userInfo.setIsfollow(followService.queryIsFollow(uid, ouid));
			userInfo.setIsfriend(friendService.queryFriendIsExist(uid, ouid));
			userInfo.setIsfans(followService.queryIsFollow(ouid, uid));
		}
		
		return userInfo;
	}

	/**
	 * 根据用户名查询用户
	 */
	public TUser queryUserByName(String username) throws Exception {
		return (TUser) sqlmap.queryForObject("user.queryUserByName", username);
	}
	public TUser queryUserByEamil(String email) throws Exception {
		return (TUser) sqlmap.queryForObject("user.queryUserByEmail", email);
	}
	public TUser queryUserByPhone(String phone) throws Exception {
		return (TUser) sqlmap.queryForObject("user.queryUserByPhone", phone);
	}
	

	/*添加用户*/
	public int addEcsUsers(EcsUsers users) throws Exception {
		return dao.insert(users);
	}
	public void addTUser(TUser0 user) throws Exception {
		dao.insert(user);
	}
	/*添加用户*/
	
	public void updateUser(TUser0 user) throws Exception {
		dao.update(user);
	}
	public void updateUserPass(Integer uid,String userpass) throws Exception{
		Map<String,Object> m = new HashMap<String,Object>();
		m.put("uid", uid);
		m.put("userpass", userpass);
		sqlmap.update("user.updateUserPassword",m);
	}
	
	public void updateApWealth(Integer uid,Integer ap) throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("uid",uid);
		map.put("ap", ap);
		sqlmap.update("user.updateApwealth", map);
	}
	/**
	 * 根据用户ID更新所有余额值
	 */
	public void updateBalance(Integer uid) throws Exception {
		TUserBalance userBalance = (TUserBalance)sqlmap.queryForObject("user.TUserBalance", uid);
		TUserBalance tub = new TUserBalance();
		tub.setCash((BigDecimal) sqlmap.queryForObject("user.queryCashCount",uid));
		tub.setCoins((BigDecimal) sqlmap.queryForObject("user.queryCoinCount",uid));
		tub.setCoupon((BigDecimal) sqlmap.queryForObject("user.queryCouponCount", uid));
		tub.setExps((BigDecimal) sqlmap.queryForObject("user.queryExpCount",uid));
		tub.setFans((Integer) sqlmap.queryForObject("user.queryFansCount", uid));
		tub.setFollows((Integer) sqlmap.queryForObject("user.queryFollowCount",uid));
		tub.setFriends((Integer)sqlmap.queryForObject("user.queryFriendCount", uid));
		tub.setGroupcount((Integer)sqlmap.queryForObject("user.queryGroupCount", uid));
		tub.setGroupfriends((Integer)sqlmap.queryForObject("user.queryGroupMemberCount", uid));
		tub.setPoints((BigDecimal) sqlmap.queryForObject("user.queryPointCount", uid));
		tub.setGuidecount((Integer) sqlmap.queryForObject("user.queryGuideCount", uid));
		tub.setMedal(tub.getMedal());
		tub.setVisitcount((Integer)sqlmap.queryForObject("user.queryVisitCount", uid));
		tub.setShopexpcount((Integer) sqlmap.queryForObject("user.queryShopExpCount", uid));
		tub.setShowcount((Integer) sqlmap.queryForObject("user.queryShowCount",uid));
		tub.setUid(uid);
		if(userBalance != null) {
			dao.update(tub);
		} else {
			dao.insert(tub);
		}
		
	}
	
	public List<TUser> queryAllUsers() throws Exception {
		return sqlmap.queryForList("user.queryAllUsers");
	}

	public void addCash(TUserCash cash) throws Exception {
		dao.insert(cash);
	}

	public void addCoins(TUserCoin coin) throws Exception {
		dao.insert(coin);
	}

	public void addPoints(TUserPoint point) throws Exception {
		dao.insert(point);
	}

	public void addExp(TUserExp exp) throws Exception {
		dao.insert(exp);
	}

	public void addCoupon(TUserCoupon coupon) throws Exception {
		dao.insert(coupon);
	}

	public int addEdu(TUserEdu edu) throws Exception {
		return dao.insert(edu);
	}

	public void delEdu(int eduid) throws Exception {
		sqlmap.delete("user.delEdu", eduid);
	}

	public void updateEdu(TUserEdu edu) throws Exception {
		dao.update(edu);
	}

	public int addJob(TUserJob job) throws Exception {
		return dao.insert(job);
	}

	public void delJob(int jobid) throws Exception {
		sqlmap.delete("user.delJob", jobid);
	}

	public int addAccount(TUserAccount account) throws Exception {
		return dao.insert(account);
	}

	public void delAccount(int accountid) throws Exception {
		sqlmap.delete("user.delAccount", accountid);
	}

	public void updateJob(TUserJob job) throws Exception {
		dao.update(job);
	}

	public void updateAccount(TUserAccount account) throws Exception {
		dao.update(account);
	}

	public TUserBalance queryUserBalanceByUid(Integer uid) throws Exception {
		return (TUserBalance) sqlmap.queryForObject("user.TUserBalance", uid);
	}
	
	
	/**
	 * 查询人气品友
	 * @param uid 当前登录 用户的ID
	 * @param topCount 前topCount位用户
	 * @param pp 分页参数
	 * @return
	 * @throws Exception
	 */
	public PageResult<SnsRightUserVO> queryTopUser(Integer uid, Integer topCount, PageParam pp) throws Exception {
		UserService userService = new UserService();
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("uid", uid);
		param.put("topCount", topCount);
		param.put("offset", pp.getOffset());
		param.put("pageSize", pp.getPageSize());
		List<SnsRightUserVO> userlist = sqlmap.queryForList("user.queryTopUser", param);
		//设置用户显示名、头像名和关注与否
		for(SnsRightUserVO user : userlist) {
			SnsUserInfoVO userinfo = userService.queryUserInfo(uid, user.getUid());
			user.setUsername(userinfo.getUsername());
			user.setAvatarFileName(userinfo.getAvatarFileName());
			user.setIsFollow(userinfo.getIsfollow());
		}
		return new PageResult<SnsRightUserVO>(userlist, topCount, pp.getPageSize());
	}
	
	/**
	 * 秀场、体验、指南享金排行榜
	 * @param uid
	 * @param otype
	 * @param topCount
	 * @param pp
	 * @return
	 * @throws Exception
	 */
	public PageResult<SnsRightUserVO> queryTopUserByType(Integer uid, Integer otype, Integer topCount, PageParam pp) throws Exception {
		UserService userService = new UserService();
		
		Integer count = (Integer) sqlmap.queryForObject("user.countTopUserByType", otype);
		count = (count > topCount) ? topCount : count;
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("otype", otype);
		param.put("topCount", count);
		param.put("offset", pp.getOffset());
		param.put("pageSize", pp.getPageSize());
		List<SnsRightUserVO> userlist = sqlmap.queryForList("user.queryTopUserByType", param);
		//设置用户显示名、头像名和关注与否
		for(SnsRightUserVO user : userlist) {
			SnsUserInfoVO userinfo = userService.queryUserInfo(uid, user.getUid());
			user.setUsername(userinfo.getUsername());
			user.setAvatarFileName(userinfo.getAvatarFileName());
			user.setIsFollow(userinfo.getIsfollow());
			
			//设置享金整数显示
			if(user.getCoins() != null){
				user.setCoins(user.getCoins().setScale(0));
			}else{
				user.setCoins(new BigDecimal("0"));
			}
		}
		return new PageResult<SnsRightUserVO>(userlist, count, pp.getPageSize());
	}
	
	public PageResult<TUserAccount> queryAccountByUid(Integer uid,PageParam pp) throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("uid", uid);
		map.put("pp", pp);
		Integer itemCount = (Integer)sqlmap.queryForObject("user.queryAccountByUidCount", uid);
		List<TUserAccount> list = sqlmap.queryForList("user.queryAccountByUid", map);		
		return new PageResult<TUserAccount>(list,itemCount,pp.getPageSize());
	}
	public List<TUserJob> queryJobByUid(Integer uid) throws Exception {
		List<TUserJob> jobList = sqlmap.queryForList("user.queryJobByUid", uid);
		for(TUserJob job:jobList){
			String s = job.getStartdate().substring(4, job.getStartdate().length());
			if(s.startsWith("0")){
				s = s.substring(1);
			}
			String e = job.getEnddate().substring(4, job.getEnddate().length());
			if(e.startsWith("0")){
				e = e.substring(1);
			}
			String startdate = job.getStartdate().substring(0,4)+"年"+s+"月";
			String enddate = job.getEnddate().substring(0,4)+"年"+e+"月";
			job.setStartdate(startdate);
			job.setEnddate(enddate);		
		}
		return jobList;
	}
	public void updateJobAccesspower(Integer accesspower,Integer uid) throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("accesspower", accesspower);
		map.put("uid", uid);
		sqlmap.update("user.updateJobAccesspower", map);
	}
	public List<TUserEdu> queryEduByUidAndSchooltype(Integer uid,Integer schooltype) throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("uid", uid);
		map.put("schooltype", schooltype);
		List<TUserEdu> eduList = sqlmap.queryForList("user.queryEduByUidAndSchooltype", map);
		for(TUserEdu edu : eduList) {
			String s = edu.getStartdate().substring(4, edu.getStartdate().length());
			if(s.startsWith("0")){
				s = s.substring(1);
			}
			String e = edu.getEnddate().substring(4, edu.getEnddate().length());
			if(e.startsWith("0")){
				e = e.substring(1);
			}
			String startdate = edu.getStartdate().substring(0,4)+"年"+s+"月";
			String enddate = edu.getEnddate().substring(0,4)+"年"+e+"月";
			edu.setStartdate(startdate);
			edu.setEnddate(enddate);		
		}	
		return eduList;
	}
	public void updateEduAccesspower(Integer eduid,Integer accesspower) throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("accesspower", accesspower);
		map.put("eduid", eduid);
		sqlmap.update("user.updateEduAccesspower", map);
	}

	public List<UserAddressVO> queryUserAddressByUid(Integer uid) throws Exception {
		ZoneService zoneService = new ZoneService();
		List<UserAddressVO> userAddressList = sqlmap.queryForList("user.queryUserAddressByUid", uid);
		for(UserAddressVO address:userAddressList){
			int zoneid = address.getExpresszoneid();
			TZone cityZone = zoneService.queryZoneByID(zoneid);
			TZone pZone = zoneService.queryZoneByID(cityZone.getLevel1id());
			address.setZoneName(pZone.getZonename()+" "+cityZone.getZonename());
			address.setParentZoneid(pZone.getZoneid());
		}
		return userAddressList;
	}
	
	public int addUserAddress (TUserAddress userAddress) throws Exception {
		return dao.insert(userAddress);
	}
	public void updateDefaultAddress(Integer addressid,Integer uid) throws Exception {
		sqlmap.update("user.updateToNotDefaultAddress", uid);
		sqlmap.update("user.updateDefaultAddress", addressid);
	}
	public void delAddress(Integer addressid) throws Exception {
		sqlmap.delete("user.delAddress", addressid);
	}
	public void updateAddress(TUserAddress userAddress) throws Exception {
		dao.update(userAddress);
	}
	public TUserAddress queryUserAddressByAddressid(Integer addressid) throws Exception {
		return (TUserAddress)sqlmap.queryForObject("user.queryUserAddressByAddressid", addressid);
	}
	
	/**
	 * 财富部分
	 */
	//享金累计，享金余额
	public BigDecimal querySumCoinByUid(Integer uid) throws Exception {
		return (BigDecimal)sqlmap.queryForObject("user.querySumCoinByUid", uid);
	}
	public BigDecimal queryBalanceCoinByUid(Integer uid) throws Exception {
		return (BigDecimal)sqlmap.queryForObject("user.queryBalanceCoinByUid", uid);
	}
	//积分累计，余额
	public BigDecimal querySumPointByUid(Integer uid) throws Exception {
		return (BigDecimal)sqlmap.queryForObject("user.querySumPointByUid", uid);
	}
	public BigDecimal queryBalancePointByUid(Integer uid) throws Exception {
		return (BigDecimal)sqlmap.queryForObject("user.queryBalancePointByUid", uid);
	}
	//礼券累计，余额
	public BigDecimal querySumCouponByUid(Integer uid) throws Exception {
		return (BigDecimal)sqlmap.queryForObject("user.querySumCouponByUid", uid);
	}
	public BigDecimal queryBalanceCouponByUid(Integer uid) throws Exception {
		return (BigDecimal)sqlmap.queryForObject("user.queryBalanceCouponByUid", uid);
	}
	//走势图
	/**
	 * type = 0 --享金
	 * type = 1 --积分
	 * type = 2 --礼券
	 * 
	 * amountType = 1 -- 余额
	 * amountType = 2 -- 累计
	 */
	public List<WealthVO> queryPicByWealth(Integer uid,int year,int month,int type,int amountType) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		List<WealthVO> result = new ArrayList<WealthVO>();
		BigDecimal b = new BigDecimal(0);
		map.put("uid", uid);
		int fromyear = 0;
		int frommonth = 0;
		int fromdate = 0;
		int enddate = 0;
		month -= 12;
		if(month >= 0){
			fromyear = year;
			frommonth = month+1;
		} else {
			fromyear = year-1;
			frommonth = month+13;
		}
		for(int i=0 ; i<12 ; i++){
			fromdate = new PsfTime(fromyear,frommonth,1,0,0,0).getTimeInSeconds();
			enddate = new PsfTime(fromyear,frommonth,31,0,0,0).getTimeInSeconds();
			map.put("fromdate", fromdate);
			map.put("enddate", enddate);
			if(type == 1){	
				if(amountType == 1){
					b = (BigDecimal)sqlmap.queryForObject("user.queryCoinByMonth", map);
				} else {
					b = (BigDecimal)sqlmap.queryForObject("user.querySumCoinByMonth", map);
				}		
			} else if(type == 2){
				b = (BigDecimal)sqlmap.queryForObject("user.queryPointByMonth", map);
			} else {
				b = (BigDecimal)sqlmap.queryForObject("user.queryCouponByMonth", map);
			}
			if(b == null){
				b = new BigDecimal(0);
			}
			WealthVO w = new WealthVO();
			w.setDate(fromyear+"."+frommonth);
			w.setAmount(b);
			if(frommonth < 12){
				frommonth += 1;
			} else {
				frommonth = 1;
				fromyear += 1;
			}	
			result.add(w);
		}
		return result;
	}
	/**
	 * 用户享金明细
	 * @param uid
	 * @param pp
	 * @param type -1（全部） 2（收入） 3（支出）
	 * @return
	 * @throws Exception
	 */
	public PageResult<UserCoinVO> queryCoinByUid(Integer uid,PageParam pp,int type) throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("uid", uid);
		map.put("type", type);
		map.put("pp", pp);
		Integer itemCount = (Integer)sqlmap.queryForObject("user.queryCoinByUidCount", map);
		List<UserCoinVO> list = sqlmap.queryForList("user.queryCoinByUid", map);
		for(UserCoinVO coin :list){
			List<UserCoinVO> products = sqlmap.queryForList("user.queryCoinProduct", coin.getOid());
			String s = "";
			for(UserCoinVO coinProduct : products){
				s += coinProduct.getPname()+" ";
			}
			coin.setPname(s);
			map.put("coinid", coin.getCoinid());
			coin.setBalance((BigDecimal)sqlmap.queryForObject("user.queryCoinByUidAndBalance", map));
				
			if(coin.getAmount().doubleValue()>0){
				coin.setType("收入");
			} else {
				coin.setType("支出");
			}
			if(coin.getAmount().doubleValue() < 0){
				coin.setAmount(coin.getAmount().abs());
			}
		}
		return new PageResult<UserCoinVO>(list,itemCount,pp.getPageSize());
	}
	public List<UserCouponVO> queryValidCouponByUid(Integer uid,Integer nowdate) throws Exception{
		BigDecimal a = new BigDecimal(0);
		BigDecimal b = new BigDecimal(0);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("uid", uid);
		map.put("nowdate", nowdate);
		List<UserCouponVO> list = sqlmap.queryForList("user.queryValidCouponByUid", map);	
		for(UserCouponVO coupon : list){
			b = b.add(coupon.getSumAmount());
		}
		if(list != null && list.size() != 0){
			list.get(0).setSumAllAmount(b);
		}
		return list;
	}
	/**
	 * 优惠券明细
	 * @param uid
	 * @param pp
	 * @param type 1（我的优惠券） 2（未使用的优惠券） 3（已使用的优惠券） 4（过期的优惠券）
	 * @return
	 * @throws Exception
	 */
	public PageResult<UserCouponVO> queryCouponByUid(Integer uid,PageParam pp,int type,int nowdate) throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("uid", uid);
		map.put("type", type);
		map.put("nowdate", nowdate);
		map.put("pp", pp);
		Integer itemCount = (Integer)sqlmap.queryForObject("user.queryCouponByUidCount", map);
		List<UserCouponVO> list = sqlmap.queryForList("user.queryCouponByUid", map);
		for(UserCouponVO coupon : list){
			coupon.setStartTime(new PsfTime(coupon.getValidstart()).toChnDateString());
			coupon.setEndTime(new PsfTime(coupon.getValidend()).toChnDateString());
		}
		return new PageResult<UserCouponVO>(list,itemCount,pp.getPageSize());
	}
	/**
	 * 
	 * 积分明细
	 * @param uid
	 * @param pp
	 * @param nowdate
	 * @param type 1(当月记录) 2（1个月前） 3（2个月前） 4（3个月前）
	 * @return
	 * @throws Exception
	 */
	public PageResult<UserPointVO> queryPointByUid(Integer uid,PageParam pp,int nowdate,int type) throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("uid", uid);
		map.put("pp", pp);
		String nowDate = new PsfTime(nowdate).toChnDateString();
		String[] str = nowDate.split("-");
		int year = Integer.parseInt(str[0]);
		int month = Integer.parseInt(str[1]);
		Integer fromdate = 0;
		Integer enddate = 0;
		if(type == 1){
			fromdate = new PsfTime(year,month,1,0,0,0).getTimeInSeconds();
			enddate = new PsfTime(year,month,31,0,0,0).getTimeInSeconds();	
		} else if(type == 2){
			if(month == 1){
				fromdate = new PsfTime(year-1,12,1,0,0,0).getTimeInSeconds();
				enddate = new PsfTime(year-1,12,31,0,0,0).getTimeInSeconds();	
			} else {
				fromdate = new PsfTime(year,month-1,1,0,0,0).getTimeInSeconds();
				enddate = new PsfTime(year,month-1,31,0,0,0).getTimeInSeconds();	
			}	
		} else if(type == 3){
			if(month == 1){
				fromdate = new PsfTime(year-1,11,1,0,0,0).getTimeInSeconds();
				enddate = new PsfTime(year-1,11,31,0,0,0).getTimeInSeconds();	
			} else if(month == 2){
				fromdate = new PsfTime(year-1,12,1,0,0,0).getTimeInSeconds();
				enddate = new PsfTime(year-1,12,31,0,0,0).getTimeInSeconds();	
			} else {
				fromdate = new PsfTime(year,month-2,1,0,0,0).getTimeInSeconds();
				enddate = new PsfTime(year,month-2,31,0,0,0).getTimeInSeconds();	
			}		
		} else {
			if(month == 1){
				fromdate = new PsfTime(year-1,10,1,0,0,0).getTimeInSeconds();
				enddate = new PsfTime(year-1,10,31,0,0,0).getTimeInSeconds();	
			} else if(month == 2){
				fromdate = new PsfTime(year-1,11,1,0,0,0).getTimeInSeconds();
				enddate = new PsfTime(year-1,11,31,0,0,0).getTimeInSeconds();	
			} else if(month == 3){
				fromdate = new PsfTime(year-1,12,1,0,0,0).getTimeInSeconds();
				enddate = new PsfTime(year-1,12,31,0,0,0).getTimeInSeconds();	
			} else {
				fromdate = new PsfTime(year,month-3,1,0,0,0).getTimeInSeconds();
				enddate = new PsfTime(year,month-3,31,0,0,0).getTimeInSeconds();	
			}	
		}
		map.put("fromdate",fromdate);
		map.put("enddate", enddate);
		Integer itemCount = (Integer)sqlmap.queryForObject("user.queryPointByUidCount", map);
		List<UserPointVO> list = sqlmap.queryForList("user.queryPointByUid", map);
		for(UserPointVO point : list){
			if(point.getAmount().doubleValue() > 0){
				point.setGetPoint(point.getAmount());
				point.setExpPoint(new BigDecimal(0));
			} else {
				point.setGetPoint(new BigDecimal(0));
				point.setExpPoint(point.getAmount().abs());
			}
			point.setTime(new PsfTime(point.getAddtime()).toChnDateString());
		}
		return new PageResult<UserPointVO>(list,itemCount,pp.getPageSize());
	}
	/**
	 * 品友财富
	 * @param uid
	 * @param pp
	 * @param type 1(全部) 2（品友） 3（关注） 4（粉丝）
	 * @return
	 * @throws Exception
	 */
	public PageResult<SnsUserInfoVO> queryPsffriendWealth(Integer uid,PageParam pp,int type) throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("uid", uid);
		map.put("pp", pp);
		Integer itemCount = 0;
		List<SnsUserInfoVO> list = new ArrayList<SnsUserInfoVO>();
		if(type == 1){
			itemCount = (Integer)sqlmap.queryForObject("user.queryPsffriendAllWealthCount", uid);
			list = sqlmap.queryForList("user.queryPsffriendAllWealth", map);
		} else if(type == 2){
			itemCount = (Integer)sqlmap.queryForObject("user.queryFriendWealthCount", uid);
			list = sqlmap.queryForList("user.queryFriendWealth", map);
		} else if(type == 3){
			itemCount = (Integer)sqlmap.queryForObject("user.queryFollowWealthCount", uid);
			list = sqlmap.queryForList("user.queryFollowWealth", map);
		} else{
			itemCount = (Integer)sqlmap.queryForObject("user.queryFansWealthCount", uid);
			list = sqlmap.queryForList("user.queryFansWealth", map);
		}
		for(SnsUserInfoVO user : list){
			if(user.getAvatarFileName() == null){
				user.setAvatarFileName("1.jpg");
			} else {
				TPic p = (TPic)sqlmap.queryForObject("sns.queryPicByPicid", user.getAvatarFileName());
				user.setAvatarFileName(user.getAvatarFileName()+"."+p.getFiletype());
			}
			if(user.getCoins() == null){
				user.setCoins(new BigDecimal(0));
			}
		}
		return new PageResult<SnsUserInfoVO>(list,itemCount,pp.getPageSize());
	}
	/**
	 * 财富排行榜 
	 * @param pp
	 * @param type 1（享金排行） 2（积分排行）
	 * @return
	 * @throws Exception 
	 */
	public PageResult<SnsUserInfoVO> queryRankWealth(PageParam pp,int type) throws Exception{
		Integer itemCount = 0;
		List<SnsUserInfoVO> list = new ArrayList<SnsUserInfoVO>();
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("pp", pp);
		if(type == 1){
			itemCount = (Integer)sqlmap.queryForObject("user.queryCoinRankCount");
			list = sqlmap.queryForList("user.queryCoinRank",map);
		} else {
			itemCount = (Integer)sqlmap.queryForObject("user.queryPointRankCount");
			list = sqlmap.queryForList("user.queryPointRank",map);
		}
		for(SnsUserInfoVO user : list){
			if(user.getAvatarFileName() == null){
				user.setAvatarFileName("1.jpg");
			} else {
				TPic p = (TPic)sqlmap.queryForObject("sns.queryPicByPicid", Integer.parseInt(user.getAvatarFileName()));
				user.setAvatarFileName(user.getAvatarFileName()+"."+p.getFiletype());
			}
		}
		return new PageResult<SnsUserInfoVO>(list,itemCount,pp.getPageSize());
	}
	

	/**
	 * 查询检索用户
	 * @param uid 当前登录用户ID
	 * @param uids
	 * @param pp
	 * @return
	 * @throws Exception
	 */
	public PageResult<SearchUserVO> querySearchUserVOByIDs(Integer uid, Integer[] uids, PageParam pp) throws Exception {
		ZoneService zoneService = new ZoneService();
		SnsService snsService = new SnsService();
		FollowService followService = new FollowService();
		FriendService friendService = new FriendService();
		PostService postService = new PostService();
		
		PageResult<SearchUserVO> users = null;
		if(uids.length > 0){
			Map<String,Object> param = new HashMap<String,Object>();
			param.put("uids", uids);
			param.put("offset", pp.getOffset());
			param.put("pageSize", pp.getPageSize());
			List<SearchUserVO> userlist = sqlmap.queryForList("user.querySearchUserVOByIDs", param);
			for(SearchUserVO user : userlist){
				TUserBalance balance = queryUserBalanceByUid(user.getUid());
				user.setFollowcount(balance.getFollows());
				user.setFanscount(balance.getFans());
				user.setGroupcount(balance.getGroupcount());
				Integer blogCount = balance.getBlogcount() == null ? 0 : balance.getBlogcount();
				Integer showCount = balance.getShowcount() == null ? 0 : balance.getShowcount();
				Integer shopexpCount = balance.getShopexpcount() == null ? 0 : balance.getShopexpcount();
				Integer guideCount = balance.getGuidecount() == null ? 0 : balance.getGuidecount();
				user.setPubliccount(blogCount + showCount + shopexpCount + guideCount);
				
				if(user.getNowzoneid() != null){
					TZone z = zoneService.queryZoneByID(user.getNowzoneid());
					String provice = "";
					if(z.getLevel1id()!=0){
						TZone tz = zoneService.queryZoneByID(z.getLevel1id());
						provice = tz.getZonename();
					}
					user.setZonename(provice+"，"+z.getZonename());
				}
				
				if(uid != null){	//登录用户可获取的用户信息
					String remarkname = snsService.queryRemarkName(uid, user.getUid());
					if(remarkname != null && remarkname.length() > 0){
						user.setRemarkname(remarkname);
					}
					
					//是否关注，是否为好友
					user.setIsfollow(followService.queryIsFollow(uid, user.getUid()));
					user.setIsfriend(friendService.queryFriendIsExist(uid, user.getUid()));
					user.setIsfans(followService.queryIsFollow(user.getUid(), uid));
				}
				
				//最后一条发言
				user.setLastpost(postService.queryLastPostByUid(user.getUid()));
			}
			users = new PageResult<SearchUserVO>(userlist, uids.length, pp.getPageSize());
		}
		return users;
	}

	public EcsUsers queryEcsUser(Integer user_id) throws Exception {
		return (EcsUsers) sqlmap.queryForObject("user.queryEcsUser",user_id);
	}
	
	public void updateEcsUser(EcsUsers user) throws Exception {
		dao.update(user);
	}
	
}
