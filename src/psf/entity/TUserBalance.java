package psf.entity;
public class TUserBalance extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer uid = null;
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
	protected java.lang.Integer groupcount = null;
	protected java.lang.Integer visitcount = null;
	protected java.lang.Integer medal = null;
	protected String [] _fields = new String[]{"uid","coins","cash","exps","points","coupon","fans","follows","friends","groupfriends","blogcount","showcount","guidecount","shopexpcount","groupcount","visitcount","medal"};

	public TUserBalance() {
	}
	public String getTableName() {
		return "t_user_balance";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "uid";
	}
	public boolean isAutoIncrease() {
		return false;
	};
	public java.lang.Integer getUid() {
		return uid;
	}
	public void setUid(java.lang.Integer uid) {
		 this.uid=uid;
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
	public java.lang.Integer getGroupcount() {
		return groupcount;
	}
	public void setGroupcount(java.lang.Integer groupcount) {
		 this.groupcount=groupcount;
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
}
