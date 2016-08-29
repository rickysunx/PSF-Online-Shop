package psf.filter;

import psf.PsfFilter;
import psf.entity.TPic;
import psf.entity.TUser;
import psf.entity.TUserBalance;
import psf.vo.sns.SnsUserInfoVO;

public class SnsCommonFilter extends PsfFilter {

	public boolean checkSession() throws Exception {
		String uri = getURI();
		if(uri.startsWith("/sns")) {
			if(getLoginUserId()==null) {
				redirect("/login");
				return false;
			}
		}
		return true;
	}
	
	/**
	 * 获取SNS当前登录人的信息，set到snsUserInfo中
	 * @throws Exception
	 */
	public void snsUserInfo() throws Exception {
		SnsUserInfoVO snsUserInfo = new SnsUserInfoVO();
		TUser user = userService.queryUserByID(getLoginUser().getUid());
		TUserBalance  userBalance = userService.queryUserBalanceByUid(getLoginUserId());
		snsUserInfo.setCash(userBalance.getCash());
		snsUserInfo.setCoins(userBalance.getCoins());
		snsUserInfo.setCoupon(userBalance.getCoupon());
		snsUserInfo.setExps(userBalance.getExps());
		snsUserInfo.setFans(userBalance.getFans());
		snsUserInfo.setFollows(userBalance.getFollows());
		snsUserInfo.setFriends(userBalance.getFriends());
		snsUserInfo.setGroupfriends(userBalance.getGroupfriends());
		snsUserInfo.setPoints(userBalance.getPoints());
		snsUserInfo.setVisits(userBalance.getVisitcount());
		snsUserInfo.setUsername(user.getUsername());
		if(userBalance != null){
			Integer blogcount = userBalance.getBlogcount() == null ? 0 : userBalance.getBlogcount();
			Integer showcount = userBalance.getShowcount() == null ? 0 : userBalance.getShowcount();
			Integer shopexpcount = userBalance.getShopexpcount() == null ? 0 : userBalance.getShopexpcount();
			Integer guidecount = userBalance.getGuidecount() == null ? 0 : userBalance.getGuidecount();
			snsUserInfo.setPubliccount(blogcount+showcount+shopexpcount+guidecount);
		}
		if(user.getAvatarid() != null){
			TPic p = (TPic)picService.queryPicByPicId(user.getAvatarid());
			snsUserInfo.setAvatarFileName(user.getAvatarid()+"."+p.getFiletype());
		}else{
			snsUserInfo.setAvatarFileName("1.jpg");
		}
		set("snsUserInfo",snsUserInfo);
	}
	
	public boolean doFilter() throws Exception {
		if(!checkSession()) return false;
		snsUserInfo();
		
		
		return true;
	}

}
