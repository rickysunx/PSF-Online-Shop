package psf.vo.sns;

import java.io.Serializable;

import psf.entity.TUser;

/**
 * 检索用户对象
 * @author 肖慧
 *
 */
public class SearchUserVO extends TUser implements Serializable {
	protected String avatarFileName = null;
	protected String remarkname = null;
	protected String zonename = null;
	
	protected Integer followcount = null;
	protected Integer fanscount = null;
	protected Integer groupcount = null;
	protected Integer publiccount = null;
	
	protected Boolean isfollow = false;
	protected Boolean isfriend = false;
	protected Boolean isfans = false;
	
	protected PostListItemVO lastpost = null;	//最后一条发言

	public String getAvatarFileName() {
		return avatarFileName;
	}

	public void setAvatarFileName(String avatarFileName) {
		this.avatarFileName = avatarFileName;
	}
	
	public String getRemarkname() {
		return remarkname;
	}

	public void setRemarkname(String remarkname) {
		this.remarkname = remarkname;
	}

	public String getZonename() {
		return zonename;
	}

	public void setZonename(String zonename) {
		this.zonename = zonename;
	}

	public Integer getFollowcount() {
		return followcount;
	}

	public void setFollowcount(Integer followcount) {
		this.followcount = followcount;
	}

	public Integer getFanscount() {
		return fanscount;
	}

	public void setFanscount(Integer fanscount) {
		this.fanscount = fanscount;
	}

	public Integer getGroupcount() {
		return groupcount;
	}

	public void setGroupcount(Integer groupcount) {
		this.groupcount = groupcount;
	}

	public Integer getPubliccount() {
		return publiccount;
	}

	public void setPubliccount(Integer publiccount) {
		this.publiccount = publiccount;
	}

	public Boolean getIsfollow() {
		return isfollow;
	}

	public void setIsfollow(Boolean isfollow) {
		this.isfollow = isfollow;
	}

	public Boolean getIsfriend() {
		return isfriend;
	}

	public void setIsfriend(Boolean isfriend) {
		this.isfriend = isfriend;
	}

	public Boolean getIsfans() {
		return isfans;
	}

	public void setIsfans(Boolean isfans) {
		this.isfans = isfans;
	}

	public PostListItemVO getLastpost() {
		return lastpost;
	}

	public void setLastpost(PostListItemVO lastpost) {
		this.lastpost = lastpost;
	}


}
