package psf.vo.sns;

import java.io.Serializable;
import java.util.List;

import psf.entity.TFriend;
import psf.entity.TFriendGroup;
import psf.entity.TUser;

public class FriendVO extends TFriend implements Serializable {
	
	protected String username = null;
	protected String remarkName = null;
	protected String avatarFileName = null;
	protected Integer sex = null;
	protected Integer snsstatus = null;
	protected String oname = null;
	protected Integer zoneid = null;
	protected String zonename = null;
	
	protected String friendgroupname = null;
	protected String followgroupname = null;


	protected Integer fans = null;
	protected Integer follows = null;
	protected Integer mblog = null;
	protected Integer groups = null;
	protected Integer pubs = null;
	
	protected Boolean isfriend = false;
	protected Boolean isfollow = false;
	protected Boolean isfans = false;
	
	protected List<FriendVO> friendGroups = null;	//每个用户会有多个分组
	protected String newpost = null;	//最新一条微博，秀场，指南，体验
	protected String subnewpost = null; //缩略newpost
	protected Integer postid = null;
	
	protected Integer togfriendcount = null;	//共同好友数
	protected List<TUser> users = null; 	//共同好友信息
	
	protected String schoolname = null;
	protected String companyname = null;
	protected String industryname = null;
	
	
	public Integer getPostid() {
		return postid;
	}
	public void setPostid(Integer postid) {
		this.postid = postid;
	}
	public String getSubnewpost() {
		return subnewpost;
	}
	public void setSubnewpost(String subnewpost) {
		this.subnewpost = subnewpost;
	}
	public String getSchoolname() {
		return schoolname;
	}
	public void setSchoolname(String schoolname) {
		this.schoolname = schoolname;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getAvatarFileName() {
		return avatarFileName;
	}
	public void setAvatarFileName(String avatarFileName) {
		this.avatarFileName = avatarFileName;
	}
	public Integer getSex() {
		return sex;
	}
	public void setSex(Integer sex) {
		this.sex = sex;
	}
	public Integer getSnsstatus() {
		return snsstatus;
	}
	public void setSnsstatus(Integer snsstatus) {
		this.snsstatus = snsstatus;
	}
	public String getOname() {
		return oname;
	}
	public void setOname(String oname) {
		this.oname = oname;
	}
	public Integer getZoneid() {
		return zoneid;
	}
	public void setZoneid(Integer zoneid) {
		this.zoneid = zoneid;
	}
	public String getZonename() {
		return zonename;
	}
	public void setZonename(String zonename) {
		this.zonename = zonename;
	}
	public String getFriendgroupname() {
		return friendgroupname;
	}
	public void setFriendgroupname(String friendgroupname) {
		this.friendgroupname = friendgroupname;
	}
	public Integer getFans() {
		return fans;
	}
	public void setFans(Integer fans) {
		this.fans = fans;
	}
	public Integer getFollows() {
		return follows;
	}
	public void setFollows(Integer follows) {
		this.follows = follows;
	}
	public Integer getMblog() {
		return mblog;
	}
	public void setMblog(Integer mblog) {
		this.mblog = mblog;
	}
	public Integer getGroups() {
		return groups;
	}
	public void setGroups(Integer groups) {
		this.groups = groups;
	}
	public Integer getPubs() {
		return pubs;
	}
	public void setPubs(Integer pubs) {
		this.pubs = pubs;
	}
	public Boolean getIsfriend() {
		return isfriend;
	}
	public void setIsfriend(Boolean isfriend) {
		this.isfriend = isfriend;
	}
	public Boolean getIsfollow() {
		return isfollow;
	}
	public void setIsfollow(Boolean isfollow) {
		this.isfollow = isfollow;
	}
	public List<FriendVO> getFriendGroups() {
		return friendGroups;
	}
	public void setFriendGroups(List<FriendVO> friendGroups) {
		this.friendGroups = friendGroups;
	}
	public String getNewpost() {
		return newpost;
	}
	public void setNewpost(String newpost) {
		this.newpost = newpost;
	}
	public Integer getTogfriendcount() {
		return togfriendcount;
	}
	public void setTogfriendcount(Integer togfriendcount) {
		this.togfriendcount = togfriendcount;
	}
	public List<TUser> getUsers() {
		return users;
	}
	public void setUsers(List<TUser> users) {
		this.users = users;
	}
	public String getFollowgroupname() {
		return followgroupname;
	}
	public void setFollowgroupname(String followgroupname) {
		this.followgroupname = followgroupname;
	}
	public Boolean getIsfans() {
		return isfans;
	}
	public void setIsfans(Boolean isfans) {
		this.isfans = isfans;
	}
	public String getRemarkName() {
		return remarkName;
	}
	public void setRemarkName(String remarkName) {
		this.remarkName = remarkName;
	}
	public String getCompanyname() {
		return companyname;
	}
	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}
	public String getIndustryname() {
		return industryname;
	}
	public void setIndustryname(String industryname) {
		this.industryname = industryname;
	}
	

}
