package psf.entity;
public class EcsSessions extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.String sesskey = null;
	protected java.lang.Long expiry = null;
	protected java.lang.Integer userid = null;
	protected java.lang.Integer adminid = null;
	protected java.lang.String ip = null;
	protected java.lang.String user_name = null;
	protected java.lang.Integer user_rank = null;
	protected java.math.BigDecimal discount = null;
	protected java.lang.String email = null;
	protected java.lang.String data = null;
	protected String [] _fields = new String[]{"sesskey","expiry","userid","adminid","ip","user_name","user_rank","discount","email","data"};

	public EcsSessions() {
	}
	public String getTableName() {
		return "ecs_sessions";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "sesskey";
	}
	public boolean isAutoIncrease() {
		return false;
	};
	public java.lang.String getSesskey() {
		return sesskey;
	}
	public void setSesskey(java.lang.String sesskey) {
		 this.sesskey=sesskey;
	}
	public java.lang.Long getExpiry() {
		return expiry;
	}
	public void setExpiry(java.lang.Long expiry) {
		 this.expiry=expiry;
	}
	public java.lang.Integer getUserid() {
		return userid;
	}
	public void setUserid(java.lang.Integer userid) {
		 this.userid=userid;
	}
	public java.lang.Integer getAdminid() {
		return adminid;
	}
	public void setAdminid(java.lang.Integer adminid) {
		 this.adminid=adminid;
	}
	public java.lang.String getIp() {
		return ip;
	}
	public void setIp(java.lang.String ip) {
		 this.ip=ip;
	}
	public java.lang.String getUser_name() {
		return user_name;
	}
	public void setUser_name(java.lang.String user_name) {
		 this.user_name=user_name;
	}
	public java.lang.Integer getUser_rank() {
		return user_rank;
	}
	public void setUser_rank(java.lang.Integer user_rank) {
		 this.user_rank=user_rank;
	}
	public java.math.BigDecimal getDiscount() {
		return discount;
	}
	public void setDiscount(java.math.BigDecimal discount) {
		 this.discount=discount;
	}
	public java.lang.String getEmail() {
		return email;
	}
	public void setEmail(java.lang.String email) {
		 this.email=email;
	}
	public java.lang.String getData() {
		return data;
	}
	public void setData(java.lang.String data) {
		 this.data=data;
	}
}
