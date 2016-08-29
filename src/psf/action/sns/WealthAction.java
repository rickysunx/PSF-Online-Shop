package psf.action.sns;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import psf.Psf;
import psf.PsfAction;
import psf.common.PageParam;
import psf.common.PageResult;
import psf.common.PsfTime;
import psf.entity.TProductCate;
import psf.entity.TUser;
import psf.framework.PsfException;
import psf.service.sns.PostService;
import psf.vo.sns.SnsUserInfoVO;
import psf.vo.sns.UserCoinVO;
import psf.vo.sns.UserCouponVO;
import psf.vo.sns.UserPointVO;
import psf.vo.sns.WealthVO;
import psf.vo.sns.right.SnsRightProductVO;

public class WealthAction extends PsfAction {
	
	public void myWealth() throws Exception {
		set("wealthTab","mywealth");
		set("mywealthTab","mywealthlist");
		Integer uid = getLoginUserId();
		BigDecimal sumCoin = userService.querySumCoinByUid(uid);
		BigDecimal balanceCoin = userService.queryBalanceCoinByUid(uid);
		BigDecimal sumPoint = userService.querySumPointByUid(uid);
		BigDecimal balancePoint = userService.queryBalancePointByUid(uid);
		BigDecimal sumCoupon = userService.querySumCouponByUid(uid);
		BigDecimal balanceCoupon = userService.queryBalanceCouponByUid(uid);
		TUser user = userService.queryUserByID(uid);
		if(sumCoin != null){
			set("sumCoin",sumCoin);
		} else {
			set("sumCoin",0);
		}
		if(balanceCoin != null){
			set("balanceCoin",balanceCoin);
		} else {
			set("balanceCoin",0);
		}
		if(sumPoint != null){
			set("sumPoint",sumPoint);
		} else {
			set("sumPoint",0);
		}
		if(balancePoint != null){
			set("balancePoint",balancePoint);
		} else {
			set("balancePoint",0);
		}
		if(sumCoupon != null){
			set("sumCoupon",sumCoupon);
		} else {
			set("sumCoupon",0);
		}
		if(balanceCoupon != null){
			set("balanceCoupon",balanceCoupon);
		} else {
			set("balanceCoupon",0);
		}
		if(user.getAp_wealth() != null){
			set("ap_wealth",user.getAp_wealth());
		} else {
			set("ap_wealth",1);
		}
		Integer year = new PsfTime().getYear();
		Integer month = new PsfTime().getMonth();
		List<WealthVO> coinList = userService.queryPicByWealth(uid,year,month, 1,1);
		List<WealthVO> pointList = userService.queryPicByWealth(uid,year,month, 2,1);
		List<WealthVO> couponList = userService.queryPicByWealth(uid,year,month, 3,1);
		List<WealthVO> coinSumList = userService.queryPicByWealth(uid, year, month, 1, 2);
		set("coinList",coinList);
		set("pointList",pointList);
		set("couponList",couponList);
		set("coinSumList",coinSumList);
	}
	public void myWealthUpdateApwealth() throws Exception {
		try{
			Integer ap = p2int("ap");
			Integer uid = getLoginUserId();
			userService.updateApWealth(uid, ap);
			set("success",1);
		}catch(Exception e){
			set("success",0);
			set("info",e.getMessage());
		}
	}
	public void myWealthCoin() throws Exception {
		set("wealthTab","mywealth");
		set("mywealthTab","mywealthcoin");
		Integer uid = getLoginUserId();
		Integer type = p2int("type");
		Integer page = p2int("page");
		if(type == null)
			type = 1;
		if(page == null)
			page = 1;
		PageParam pp = new PageParam(page,20);
		BigDecimal sumCoin = userService.querySumCoinByUid(uid);
		BigDecimal balanceCoin = userService.queryBalanceCoinByUid(uid);
		PageResult<UserCoinVO> coinList = userService.queryCoinByUid(uid, pp, type);
		set("coinList",coinList.getList());
		set("pageCount",coinList.getPageCount());
		set("curPage",page);
		set("type",type);
		if(sumCoin != null){
			set("sumCoin",sumCoin);
		} else {
			set("sumCoin",0);
		}
		if(balanceCoin != null){
			set("balanceCoin",balanceCoin);
		} else {
			set("balanceCoin",0);
		}
	}
	public void myWealthCoupon() throws Exception {
		set("wealthTab","mywealth");
		set("mywealthTab","mywealthcoupon");
		Integer page = p2int("page");
		Integer type = p2int("type");
		Integer uid = getLoginUserId();
		int nowdate = new PsfTime().getTimeInSeconds();
		if(type == null)
			type = 1;
		if(page == null)
			page = 1;
		PageParam pp = new PageParam(page,20);
		PageResult<UserCouponVO> couponList = userService.queryCouponByUid(uid, pp, type, nowdate);
		List<UserCouponVO> list = userService.queryValidCouponByUid(uid, nowdate);
		set("validCoupon",list);
		set("validCouponCount",list.size());
		if(list != null && list.size() > 0){
			set("validCouponSumAmount",list.get(0).getSumAllAmount());
		} else {
			set("validCouponSumAmount",0);
		}	
		set("couponList",couponList.getList());
		set("pageCount",couponList.getPageCount());
		set("curPage",page);
		set("type",type);	
	}
	public void myWealthPoint() throws Exception {
		set("wealthTab","mywealth");
		set("mywealthTab","mywealthpoint");
		Integer page = p2int("page");
		Integer type = p2int("type");
		Integer uid = getLoginUserId();
		int nowdate = new PsfTime().getTimeInSeconds();
		if(type == null)
			type = 1;
		if(page == null)
			page = 1;
		PageParam pp = new PageParam(page,20);
		PageResult<UserPointVO> pointList = userService.queryPointByUid(uid, pp, nowdate, type);
		set("pointList",pointList.getList());
		set("pageCount",pointList.getPageCount());
		set("curPage",page);
		set("type",type);
	}
	public void psffriendWealth() throws Exception {
		set("wealthTab","psffriendwealth");
		Integer page = p2int("page");
		Integer type = p2int("type");
		Integer uid = getLoginUserId();
		if(type == null)
			type = 1;
		if(page == null)
			page = 1;
		PageParam pp = new PageParam(page,20);
		PageResult<SnsUserInfoVO> userList = userService.queryPsffriendWealth(uid, pp, type);
		set("userList",userList.getList());
		set("pageCount",userList.getPageCount());
		set("curPage",page);
		set("type",type);
	}
	public void rankingWealth() throws Exception {
		set("wealthTab","rankingwealth");
		Integer page = p2int("page");
		Integer type = p2int("type");
		if(type == null)
			type = 1;
		if(page == null)
			page = 1;
		PageParam pp = new PageParam(page,20);
		PageResult<SnsUserInfoVO> userList = userService.queryRankWealth(pp, type);
		set("userList",userList.getList());
		set("pageCount",userList.getPageCount());
		set("curPage",page);
		set("type",type);
	}
}
