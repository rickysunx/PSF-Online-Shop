package psf.entity;
public class EcsAuctionLog extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer log_id = null;
	protected java.lang.Integer act_id = null;
	protected java.lang.Integer bid_user = null;
	protected java.math.BigDecimal bid_price = null;
	protected java.lang.Long bid_time = null;
	protected String [] _fields = new String[]{"log_id","act_id","bid_user","bid_price","bid_time"};

	public EcsAuctionLog() {
	}
	public String getTableName() {
		return "ecs_auction_log";
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
	public java.lang.Integer getAct_id() {
		return act_id;
	}
	public void setAct_id(java.lang.Integer act_id) {
		 this.act_id=act_id;
	}
	public java.lang.Integer getBid_user() {
		return bid_user;
	}
	public void setBid_user(java.lang.Integer bid_user) {
		 this.bid_user=bid_user;
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
