package psf.entity;
public class EcsPayLog extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Long log_id = null;
	protected java.lang.Integer order_id = null;
	protected java.math.BigDecimal order_amount = null;
	protected java.lang.Integer order_type = null;
	protected java.lang.Integer is_paid = null;
	protected String [] _fields = new String[]{"log_id","order_id","order_amount","order_type","is_paid"};

	public EcsPayLog() {
	}
	public String getTableName() {
		return "ecs_pay_log";
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
	public java.lang.Long getLog_id() {
		return log_id;
	}
	public void setLog_id(java.lang.Long log_id) {
		 this.log_id=log_id;
	}
	public java.lang.Integer getOrder_id() {
		return order_id;
	}
	public void setOrder_id(java.lang.Integer order_id) {
		 this.order_id=order_id;
	}
	public java.math.BigDecimal getOrder_amount() {
		return order_amount;
	}
	public void setOrder_amount(java.math.BigDecimal order_amount) {
		 this.order_amount=order_amount;
	}
	public java.lang.Integer getOrder_type() {
		return order_type;
	}
	public void setOrder_type(java.lang.Integer order_type) {
		 this.order_type=order_type;
	}
	public java.lang.Integer getIs_paid() {
		return is_paid;
	}
	public void setIs_paid(java.lang.Integer is_paid) {
		 this.is_paid=is_paid;
	}
}
