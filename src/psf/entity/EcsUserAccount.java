package psf.entity;
public class EcsUserAccount extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer id = null;
	protected java.lang.Integer user_id = null;
	protected java.lang.String admin_user = null;
	protected java.math.BigDecimal amount = null;
	protected java.lang.Integer add_time = null;
	protected java.lang.Integer paid_time = null;
	protected java.lang.String admin_note = null;
	protected java.lang.String user_note = null;
	protected java.lang.Integer process_type = null;
	protected java.lang.String payment = null;
	protected java.lang.Integer is_paid = null;
	protected String [] _fields = new String[]{"id","user_id","admin_user","amount","add_time","paid_time","admin_note","user_note","process_type","payment","is_paid"};

	public EcsUserAccount() {
	}
	public String getTableName() {
		return "ecs_user_account";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getId() {
		return id;
	}
	public void setId(java.lang.Integer id) {
		 this.id=id;
	}
	public java.lang.Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(java.lang.Integer user_id) {
		 this.user_id=user_id;
	}
	public java.lang.String getAdmin_user() {
		return admin_user;
	}
	public void setAdmin_user(java.lang.String admin_user) {
		 this.admin_user=admin_user;
	}
	public java.math.BigDecimal getAmount() {
		return amount;
	}
	public void setAmount(java.math.BigDecimal amount) {
		 this.amount=amount;
	}
	public java.lang.Integer getAdd_time() {
		return add_time;
	}
	public void setAdd_time(java.lang.Integer add_time) {
		 this.add_time=add_time;
	}
	public java.lang.Integer getPaid_time() {
		return paid_time;
	}
	public void setPaid_time(java.lang.Integer paid_time) {
		 this.paid_time=paid_time;
	}
	public java.lang.String getAdmin_note() {
		return admin_note;
	}
	public void setAdmin_note(java.lang.String admin_note) {
		 this.admin_note=admin_note;
	}
	public java.lang.String getUser_note() {
		return user_note;
	}
	public void setUser_note(java.lang.String user_note) {
		 this.user_note=user_note;
	}
	public java.lang.Integer getProcess_type() {
		return process_type;
	}
	public void setProcess_type(java.lang.Integer process_type) {
		 this.process_type=process_type;
	}
	public java.lang.String getPayment() {
		return payment;
	}
	public void setPayment(java.lang.String payment) {
		 this.payment=payment;
	}
	public java.lang.Integer getIs_paid() {
		return is_paid;
	}
	public void setIs_paid(java.lang.Integer is_paid) {
		 this.is_paid=is_paid;
	}
}
