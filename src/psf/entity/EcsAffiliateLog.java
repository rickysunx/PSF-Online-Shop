package psf.entity;
public class EcsAffiliateLog extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer log_id = null;
	protected java.lang.Integer order_id = null;
	protected java.lang.Integer time = null;
	protected java.lang.Integer user_id = null;
	protected java.lang.String user_name = null;
	protected java.math.BigDecimal money = null;
	protected java.lang.Integer point = null;
	protected java.lang.Integer separate_type = null;
	protected String [] _fields = new String[]{"log_id","order_id","time","user_id","user_name","money","point","separate_type"};

	public EcsAffiliateLog() {
	}
	public String getTableName() {
		return "ecs_affiliate_log";
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
	public java.lang.Integer getOrder_id() {
		return order_id;
	}
	public void setOrder_id(java.lang.Integer order_id) {
		 this.order_id=order_id;
	}
	public java.lang.Integer getTime() {
		return time;
	}
	public void setTime(java.lang.Integer time) {
		 this.time=time;
	}
	public java.lang.Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(java.lang.Integer user_id) {
		 this.user_id=user_id;
	}
	public java.lang.String getUser_name() {
		return user_name;
	}
	public void setUser_name(java.lang.String user_name) {
		 this.user_name=user_name;
	}
	public java.math.BigDecimal getMoney() {
		return money;
	}
	public void setMoney(java.math.BigDecimal money) {
		 this.money=money;
	}
	public java.lang.Integer getPoint() {
		return point;
	}
	public void setPoint(java.lang.Integer point) {
		 this.point=point;
	}
	public java.lang.Integer getSeparate_type() {
		return separate_type;
	}
	public void setSeparate_type(java.lang.Integer separate_type) {
		 this.separate_type=separate_type;
	}
}
