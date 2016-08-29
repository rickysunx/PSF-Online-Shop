package psf.entity;
public class VSession extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.String sessionid = null;
	protected java.lang.Integer uid = null;
	protected java.lang.Integer adminid = null;
	protected java.lang.Integer starttime = null;
	protected java.lang.Integer lasttime = null;
	protected java.lang.String ip = null;
	protected java.lang.Integer valid = null;
	protected java.lang.String username = null;
	protected java.lang.Integer homezoneid = null;
	protected java.lang.String homeprovince = null;
	protected java.lang.String homecity = null;
	protected java.lang.Integer nowzoneid = null;
	protected java.lang.String nowprovince = null;
	protected java.lang.String nowcity = null;
	protected java.lang.Integer sex = null;
	protected java.lang.String email = null;
	protected java.lang.String signature = null;
	protected java.math.BigDecimal coins = null;
	protected java.math.BigDecimal cash = null;
	protected java.math.BigDecimal exps = null;
	protected java.math.BigDecimal points = null;
	protected java.math.BigDecimal coupon = null;
	protected java.lang.Integer fans = null;
	protected java.lang.Integer follows = null;
	protected java.lang.Integer friends = null;
	protected java.lang.Integer groupfriends = null;
	protected java.lang.Integer blogcount = null;
	protected java.lang.Integer showcount = null;
	protected java.lang.Integer guidecount = null;
	protected java.lang.Integer shopexpcount = null;
	protected java.lang.Integer visitcount = null;
	protected java.lang.Integer medal = null;
	protected java.lang.Long postcount = null;
	protected java.lang.String avatarpic = null;
	protected String [] _fields = new String[]{"sessionid","uid","adminid","starttime","lasttime","ip","valid","username","homezoneid","homeprovince","homecity","nowzoneid","nowprovince","nowcity","sex","email","signature","coins","cash","exps","points","coupon","fans","follows","friends","groupfriends","blogcount","showcount","guidecount","shopexpcount","visitcount","medal","postcount","avatarpic"};

	public VSession() {
	}
	public String getTableName() {
		return "v_session";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "null";
	}
	public boolean isAutoIncrease() {
		return false;
	};
	public java.lang.String getSessionid() {
		return sessionid;
	}
	public void setSessionid(java.lang.String sessionid) {
		 this.sessionid=sessionid;
	}
	public java.lang.Integer getUid() {
		return uid;
	}
	public void setUid(java.lang.Integer uid) {
		 this.uid=uid;
	}
	public java.lang.Integer getAdminid() {
		return adminid;
	}
	public void setAdminid(java.lang.Integer adminid) {
		 this.adminid=adminid;
	}
	public java.lang.Integer getStarttime() {
		return starttime;
	}
	public void setStarttime(java.lang.Integer starttime) {
		 this.starttime=starttime;
	}
	public java.lang.Integer getLasttime() {
		return lasttime;
	}
	public void setLasttime(java.lang.Integer lasttime) {
		 this.lasttime=lasttime;
	}
	public java.lang.String getIp() {
		return ip;
	}
	public void setIp(java.lang.String ip) {
		 this.ip=ip;
	}
	public java.lang.Integer getValid() {
		return valid;
	}
	public void setValid(java.lang.Integer valid) {
		 this.valid=valid;
	}
	public java.lang.String getUsername() {
		return username;
	}
	public void setUsername(java.lang.String username) {
		 this.username=username;
	}
	public java.lang.Integer getHomezoneid() {
		return homezoneid;
	}
	public void setHomezoneid(java.lang.Integer homezoneid) {
		 this.homezoneid=homezoneid;
	}
	public java.lang.String getHomeprovince() {
		return homeprovince;
	}
	public void setHomeprovince(java.lang.String homeprovince) {
		 this.homeprovince=homeprovince;
	}
	public java.lang.String getHomecity() {
		return homecity;
	}
	public void setHomecity(java.lang.String homecity) {
		 this.homecity=homecity;
	}
	public java.lang.Integer getNowzoneid() {
		return nowzoneid;
	}
	public void setNowzoneid(java.lang.Integer nowzoneid) {
		 this.nowzoneid=nowzoneid;
	}
	public java.lang.String getNowprovince() {
		return nowprovince;
	}
	public void setNowprovince(java.lang.String nowprovince) {
		 this.nowprovince=nowprovince;
	}
	public java.lang.String getNowcity() {
		return nowcity;
	}
	public void setNowcity(java.lang.String nowcity) {
		 this.nowcity=nowcity;
	}
	public java.lang.Integer getSex() {
		return sex;
	}
	public void setSex(java.lang.Integer sex) {
		 this.sex=sex;
	}
	public java.lang.String getEmail() {
		return email;
	}
	public void setEmail(java.lang.String email) {
		 this.email=email;
	}
	public java.lang.String getSignature() {
		return signature;
	}
	public void setSignature(java.lang.String signature) {
		 this.signature=signature;
	}
	public java.math.BigDecimal getCoins() {
		return coins;
	}
	public void setCoins(java.math.BigDecimal coins) {
		 this.coins=coins;
	}
	public java.math.BigDecimal getCash() {
		return cash;
	}
	public void setCash(java.math.BigDecimal cash) {
		 this.cash=cash;
	}
	public java.math.BigDecimal getExps() {
		return exps;
	}
	public void setExps(java.math.BigDecimal exps) {
		 this.exps=exps;
	}
	public java.math.BigDecimal getPoints() {
		return points;
	}
	public void setPoints(java.math.BigDecimal points) {
		 this.points=points;
	}
	public java.math.BigDecimal getCoupon() {
		return coupon;
	}
	public void setCoupon(java.math.BigDecimal coupon) {
		 this.coupon=coupon;
	}
	public java.lang.Integer getFans() {
		return fans;
	}
	public void setFans(java.lang.Integer fans) {
		 this.fans=fans;
	}
	public java.lang.Integer getFollows() {
		return follows;
	}
	public void setFollows(java.lang.Integer follows) {
		 this.follows=follows;
	}
	public java.lang.Integer getFriends() {
		return friends;
	}
	public void setFriends(java.lang.Integer friends) {
		 this.friends=friends;
	}
	public java.lang.Integer getGroupfriends() {
		return groupfriends;
	}
	public void setGroupfriends(java.lang.Integer groupfriends) {
		 this.groupfriends=groupfriends;
	}
	public java.lang.Integer getBlogcount() {
		return blogcount;
	}
	public void setBlogcount(java.lang.Integer blogcount) {
		 this.blogcount=blogcount;
	}
	public java.lang.Integer getShowcount() {
		return showcount;
	}
	public void setShowcount(java.lang.Integer showcount) {
		 this.showcount=showcount;
	}
	public java.lang.Integer getGuidecount() {
		return guidecount;
	}
	public void setGuidecount(java.lang.Integer guidecount) {
		 this.guidecount=guidecount;
	}
	public java.lang.Integer getShopexpcount() {
		return shopexpcount;
	}
	public void setShopexpcount(java.lang.Integer shopexpcount) {
		 this.shopexpcount=shopexpcount;
	}
	public java.lang.Integer getVisitcount() {
		return visitcount;
	}
	public void setVisitcount(java.lang.Integer visitcount) {
		 this.visitcount=visitcount;
	}
	public java.lang.Integer getMedal() {
		return medal;
	}
	public void setMedal(java.lang.Integer medal) {
		 this.medal=medal;
	}
	public java.lang.Long getPostcount() {
		return postcount;
	}
	public void setPostcount(java.lang.Long postcount) {
		 this.postcount=postcount;
	}
	public java.lang.String getAvatarpic() {
		return avatarpic;
	}
	public void setAvatarpic(java.lang.String avatarpic) {
		 this.avatarpic=avatarpic;
	}
}
