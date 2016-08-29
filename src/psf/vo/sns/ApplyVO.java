package psf.vo.sns;

import java.io.Serializable;

import psf.common.PsfTime;
import psf.entity.TApply;

public class ApplyVO extends TApply implements Serializable {
	protected String username = null;
	protected Integer usersex = null;
	protected String avatarFileName = null;
	protected Integer followCount = null;
	protected Integer friendCount = null;
	protected Integer fansCount = null;
	protected Integer pubCount = null;
	protected String zonename = null;
	protected Integer type = null; //1-好友邀请，2-关注邀请
	
	public Integer showcount = null;
	public Integer guidecount = null;
	public Integer shopexpcount = null;
	
	//圈子邀请属性
	protected Integer groupid = null;
	protected String groupname = null;
	protected String logo = null;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Integer getUsersex() {
		return usersex;
	}

	public void setUsersex(Integer usersex) {
		this.usersex = usersex;
	}

	public String getAvatarFileName() {
		return avatarFileName;
	}

	public void setAvatarFileName(String avatarFileName) {
		this.avatarFileName = avatarFileName;
	}

	public Integer getFollowCount() {
		return followCount;
	}

	public void setFollowCount(Integer followCount) {
		this.followCount = followCount;
	}

	public Integer getFriendCount() {
		return friendCount;
	}

	public void setFriendCount(Integer friendCount) {
		this.friendCount = friendCount;
	}

	public Integer getFansCount() {
		return fansCount;
	}

	public void setFansCount(Integer fansCount) {
		this.fansCount = fansCount;
	}

	public Integer getPubCount() {
		return pubCount;
	}

	public void setPubCount(Integer pubCount) {
		this.pubCount = pubCount;
	}

	public String getZonename() {
		return zonename;
	}

	public void setZonename(String zonename) {
		this.zonename = zonename;
	}

	public String getGroupname() {
		return groupname;
	}

	public void setGroupname(String groupname) {
		this.groupname = groupname;
	}
	public String getChnAddtime(){
		if(getAddtime() != null){
			PsfTime time = new PsfTime(getAddtime());
			return time.getTimePassed();
		}else{
			return null;
		}
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public Integer getGroupid() {
		return groupid;
	}

	public void setGroupid(Integer groupid) {
		this.groupid = groupid;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Integer getShowcount() {
		return showcount;
	}

	public void setShowcount(Integer showcount) {
		this.showcount = showcount;
	}

	public Integer getGuidecount() {
		return guidecount;
	}

	public void setGuidecount(Integer guidecount) {
		this.guidecount = guidecount;
	}

	public Integer getShopexpcount() {
		return shopexpcount;
	}

	public void setShopexpcount(Integer shopexpcount) {
		this.shopexpcount = shopexpcount;
	}


	
}
