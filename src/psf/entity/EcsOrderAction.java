package psf.entity;
public class EcsOrderAction extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer action_id = null;
	protected java.lang.Integer order_id = null;
	protected java.lang.String action_user = null;
	protected java.lang.Integer order_status = null;
	protected java.lang.Integer shipping_status = null;
	protected java.lang.Integer pay_status = null;
	protected java.lang.Integer action_place = null;
	protected java.lang.String action_note = null;
	protected java.lang.Long log_time = null;
	protected String [] _fields = new String[]{"action_id","order_id","action_user","order_status","shipping_status","pay_status","action_place","action_note","log_time"};

	public EcsOrderAction() {
	}
	public String getTableName() {
		return "ecs_order_action";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "action_id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getAction_id() {
		return action_id;
	}
	public void setAction_id(java.lang.Integer action_id) {
		 this.action_id=action_id;
	}
	public java.lang.Integer getOrder_id() {
		return order_id;
	}
	public void setOrder_id(java.lang.Integer order_id) {
		 this.order_id=order_id;
	}
	public java.lang.String getAction_user() {
		return action_user;
	}
	public void setAction_user(java.lang.String action_user) {
		 this.action_user=action_user;
	}
	public java.lang.Integer getOrder_status() {
		return order_status;
	}
	public void setOrder_status(java.lang.Integer order_status) {
		 this.order_status=order_status;
	}
	public java.lang.Integer getShipping_status() {
		return shipping_status;
	}
	public void setShipping_status(java.lang.Integer shipping_status) {
		 this.shipping_status=shipping_status;
	}
	public java.lang.Integer getPay_status() {
		return pay_status;
	}
	public void setPay_status(java.lang.Integer pay_status) {
		 this.pay_status=pay_status;
	}
	public java.lang.Integer getAction_place() {
		return action_place;
	}
	public void setAction_place(java.lang.Integer action_place) {
		 this.action_place=action_place;
	}
	public java.lang.String getAction_note() {
		return action_note;
	}
	public void setAction_note(java.lang.String action_note) {
		 this.action_note=action_note;
	}
	public java.lang.Long getLog_time() {
		return log_time;
	}
	public void setLog_time(java.lang.Long log_time) {
		 this.log_time=log_time;
	}
}
