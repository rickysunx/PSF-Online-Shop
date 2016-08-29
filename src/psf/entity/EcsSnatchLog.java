package psf.entity;
public class EcsSnatchLog extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer log_id = null;
	protected java.lang.Integer snatch_id = null;
	protected java.lang.Integer user_id = null;
	protected java.math.BigDecimal bid_price = null;
	protected java.lang.Long bid_time = null;
	protected String [] _fields = new String[]{"log_id","snatch_id","user_id","bid_price","bid_time"};

	public EcsSnatchLog() {
	}
	public String getTableName() {
		return "ecs_snatch_log";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "log_id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getLog_id() {
		return log_id;
	}
	public void setLog_id(java.lang.Integer log_id) {
		 this.log_id=log_id;
	}
	public java.lang.Integer getSnatch_id() {
		return snatch_id;
	}
	public void setSnatch_id(java.lang.Integer snatch_id) {
		 this.snatch_id=snatch_id;
	}
	public java.lang.Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(java.lang.Integer user_id) {
		 this.user_id=user_id;
	}
	public java.math.BigDecimal getBid_price() {
		return bid_price;
	}
	public void setBid_price(java.math.BigDecimal bid_price) {
		 this.bid_price=bid_price;
	}
	public java.lang.Long getBid_time() {
		return bid_time;
	}
	public void setBid_time(java.lang.Long bid_time) {
		 this.bid_time=bid_time;
	}
}
