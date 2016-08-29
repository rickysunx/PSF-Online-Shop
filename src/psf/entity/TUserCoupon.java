package psf.entity;
public class TUserCoupon extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer couponid = null;
	protected java.lang.Integer uid = null;
	protected java.lang.Integer validstart = null;
	protected java.lang.Integer validend = null;
	protected java.math.BigDecimal amount = null;
	protected java.lang.String summary = null;
	protected java.lang.Integer isused = null;
	protected java.lang.Integer isvalid = null;
	protected String [] _fields = new String[]{"couponid","uid","validstart","validend","amount","summary","isused","isvalid"};

	public TUserCoupon() {
	}
	public String getTableName() {
		return "t_user_coupon";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "couponid";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getCouponid() {
		return couponid;
	}
	public void setCouponid(java.lang.Integer couponid) {
		 this.couponid=couponid;
	}
	public java.lang.Integer getUid() {
		return uid;
	}
	public void setUid(java.lang.Integer uid) {
		 this.uid=uid;
	}
	public java.lang.Integer getValidstart() {
		return validstart;
	}
	public void setValidstart(java.lang.Integer validstart) {
		 this.validstart=validstart;
	}
	public java.lang.Integer getValidend() {
		return validend;
	}
	public void setValidend(java.lang.Integer validend) {
		 this.validend=validend;
	}
	public java.math.BigDecimal getAmount() {
		return amount;
	}
	public void setAmount(java.math.BigDecimal amount) {
		 this.amount=amount;
	}
	public java.lang.String getSummary() {
		return summary;
	}
	public void setSummary(java.lang.String summary) {
		 this.summary=summary;
	}
	public java.lang.Integer getIsused() {
		return isused;
	}
	public void setIsused(java.lang.Integer isused) {
		 this.isused=isused;
	}
	public java.lang.Integer getIsvalid() {
		return isvalid;
	}
	public void setIsvalid(java.lang.Integer isvalid) {
		 this.isvalid=isvalid;
	}
}
