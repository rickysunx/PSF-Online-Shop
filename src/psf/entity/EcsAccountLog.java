package psf.entity;
public class EcsAccountLog extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer log_id = null;
	protected java.lang.Integer user_id = null;
	protected java.math.BigDecimal user_money = null;
	protected java.math.BigDecimal frozen_money = null;
	protected java.lang.Integer rank_points = null;
	protected java.lang.Integer pay_points = null;
	protected java.lang.Long change_time = null;
	protected java.lang.String change_desc = null;
	protected java.lang.Integer change_type = null;
	protected String [] _fields = new String[]{"log_id","user_id","user_money","frozen_money","rank_points","pay_points","change_time","change_desc","change_type"};

	public EcsAccountLog() {
	}
	public String getTableName() {
		return "ecs_account_log";
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
	public java.lang.Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(java.lang.Integer user_id) {
		 this.user_id=user_id;
	}
	public java.math.BigDecimal getUser_money() {
		return user_money;
	}
	public void setUser_money(java.math.BigDecimal user_money) {
		 this.user_money=user_money;
	}
	public java.math.BigDecimal getFrozen_money() {
		return frozen_money;
	}
	public void setFrozen_money(java.math.BigDecimal frozen_money) {
		 this.frozen_money=frozen_money;
	}
	public java.lang.Integer getRank_points() {
		return rank_points;
	}
	public void setRank_points(java.lang.Integer rank_points) {
		 this.rank_points=rank_points;
	}
	public java.lang.Integer getPay_points() {
		return pay_points;
	}
	public void setPay_points(java.lang.Integer pay_points) {
		 this.pay_points=pay_points;
	}
	public java.lang.Long getChange_time() {
		return change_time;
	}
	public void setChange_time(java.lang.Long change_time) {
		 this.change_time=change_time;
	}
	public java.lang.String getChange_desc() {
		return change_desc;
	}
	public void setChange_desc(java.lang.String change_desc) {
		 this.change_desc=change_desc;
	}
	public java.lang.Integer getChange_type() {
		return change_type;
	}
	public void setChange_type(java.lang.Integer change_type) {
		 this.change_type=change_type;
	}
}
