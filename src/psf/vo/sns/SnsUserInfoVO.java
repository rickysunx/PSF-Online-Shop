package psf.vo.sns;

import java.io.Serializable;
import java.math.BigDecimal;

import psf.common.PsfTime;

public class SnsUserInfoVO implements Serializable {
	protected int uid = 0;
	protected String username = null;
	protected String avatarFileName = null;
	protected String remarkName = null;
	protected Integer sex = null;
	protected Integer snsstatus = null;
	protected String nowZoneName = null;
	protected String oname = null;
	protected String signature = null;
	
	protected BigDecimal coins = null;
	protected BigDecimal cash = null;
	protected BigDecimal exps = null;
	protected BigDecimal points = null;
	protected BigDecimal coupon = null;
	protected Integer medal = null;
	
	protected Integer fans = null;
	protected Integer follows = null;
	protected Integer friends = null;
	protected Integer groupfriends = null;
	protected Integer groups = null;
	protected Integer pubs = null;
	protected Integer visits = null;
	
	protected Boolean isfollow = false;
	protected Boolean isfriend = false;
	protected Boolean isfans = false;
	
	protected int fuid = 0;
	protected String aboutInfo = null; //品论我的，在什么地方品论的
	protected Integer commentid = null;
	protected Integer otype = null;
	protected Integer oid = null;
	protected Integer addtime = null;
	
	protected Integer togFriendCount = null; //共同好友数量
	protected Integer publiccount= null;	//发表数=广播+秀场+体验+指南
	
	public Integer getCommentid() {
		return commentid;
	}
	public void setCommentid(Integer commentid) {
		this.commentid = commentid;
	}
	public Integer getAddtime() {
		return addtime;
	}
	public void setAddtime(Integer addtime) {
		this.addtime = addtime;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
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
	public String getNowZoneName() {
		return nowZoneName;
	}
	public void setNowZoneName(String nowZoneName) {
		this.nowZoneName = nowZoneName;
	}
	public BigDecimal getCoins() {
		return coins;
	}
	public void setCoins(BigDecimal coins) {
		this.coins = coins;
	}
	public BigDecimal getCash() {
		return cash;
	}
	public void setCash(BigDecimal cash) {
		this.cash = cash;
	}
	public BigDecimal getExps() {
		return exps;
	}
	public void setExps(BigDecimal exps) {
		this.exps = exps;
	}
	public BigDecimal getPoints() {
		return points;
	}
	public void setPoints(BigDecimal points) {
		this.points = points;
	}
	public BigDecimal getCoupon() {
		return coupon;
	}
	public void setCoupon(BigDecimal coupon) {
		this.coupon = coupon;
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
	public Integer getFriends() {
		return friends;
	}
	public void setFriends(Integer friends) {
		this.friends = friends;
	}
	public Integer getGroupfriends() {
		return groupfriends;
	}
	public void setGroupfriends(Integer groupfriends) {
		this.groupfriends = groupfriends;
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
	public Integer getVisits() {
		return visits;
	}
	public void setVisits(Integer visits) {
		this.visits = visits;
	}
	public Integer getMedal() {
		return medal;
	}
	public void setMedal(Integer medal) {
		this.medal = medal;
	}
	public String getOname() {
		return oname;
	}
	public void setOname(String oname) {
		this.oname = oname;
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
	public String getSignature() {
		return signature;
	}
	public void setSignature(String signature) {
		this.signature = signature;
	}
	public String getRemarkName() {
		return remarkName;
	}
	public void setRemarkName(String remarkName) {
		this.remarkName = remarkName;
	}
	public String getAboutInfo() {
		return aboutInfo;
	}
	public void setAboutInfo(String aboutInfo) {
		this.aboutInfo = aboutInfo;
	}
	public Integer getOtype() {
		return otype;
	}
	public void setOtype(Integer otype) {
		this.otype = otype;
	}
	public Integer getOid() {
		return oid;
	}
	public void setOid(Integer oid) {
		this.oid = oid;
	}
	public int getFuid() {
		return fuid;
	}
	public void setFuid(int fuid) {
		this.fuid = fuid;
	}
	public String getChnTime() {
		if(getAddtime() != null){
			return new PsfTime(getAddtime()).toChnDateString();
		}else{
			return null;
		}
	}
	public Integer getTogFriendCount() {
		return togFriendCount;
	}
	public void setTogFriendCount(Integer togFriendCount) {
		this.togFriendCount = togFriendCount;
	}
	public Integer getPubliccount() {
		return publiccount;
	}
	public void setPubliccount(Integer publiccount) {
		this.publiccount = publiccount;
	}
	
}
