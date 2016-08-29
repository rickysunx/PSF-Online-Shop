package psf.entity;
public class EcsPayment extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer pay_id = null;
	protected java.lang.String pay_code = null;
	protected java.lang.String pay_name = null;
	protected java.lang.String pay_fee = null;
	protected java.lang.String pay_desc = null;
	protected java.lang.Integer pay_order = null;
	protected java.lang.String pay_config = null;
	protected java.lang.Integer enabled = null;
	protected java.lang.Integer is_cod = null;
	protected java.lang.Integer is_online = null;
	protected String [] _fields = new String[]{"pay_id","pay_code","pay_name","pay_fee","pay_desc","pay_order","pay_config","enabled","is_cod","is_online"};

	public EcsPayment() {
	}
	public String getTableName() {
		return "ecs_payment";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "pay_id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getPay_id() {
		return pay_id;
	}
	public void setPay_id(java.lang.Integer pay_id) {
		 this.pay_id=pay_id;
	}
	public java.lang.String getPay_code() {
		return pay_code;
	}
	public void setPay_code(java.lang.String pay_code) {
		 this.pay_code=pay_code;
	}
	public java.lang.String getPay_name() {
		return pay_name;
	}
	public void setPay_name(java.lang.String pay_name) {
		 this.pay_name=pay_name;
	}
	public java.lang.String getPay_fee() {
		return pay_fee;
	}
	public void setPay_fee(java.lang.String pay_fee) {
		 this.pay_fee=pay_fee;
	}
	public java.lang.String getPay_desc() {
		return pay_desc;
	}
	public void setPay_desc(java.lang.String pay_desc) {
		 this.pay_desc=pay_desc;
	}
	public java.lang.Integer getPay_order() {
		return pay_order;
	}
	public void setPay_order(java.lang.Integer pay_order) {
		 this.pay_order=pay_order;
	}
	public java.lang.String getPay_config() {
		return pay_config;
	}
	public void setPay_config(java.lang.String pay_config) {
		 this.pay_config=pay_config;
	}
	public java.lang.Integer getEnabled() {
		return enabled;
	}
	public void setEnabled(java.lang.Integer enabled) {
		 this.enabled=enabled;
	}
	public java.lang.Integer getIs_cod() {
		return is_cod;
	}
	public void setIs_cod(java.lang.Integer is_cod) {
		 this.is_cod=is_cod;
	}
	public java.lang.Integer getIs_online() {
		return is_online;
	}
	public void setIs_online(java.lang.Integer is_online) {
		 this.is_online=is_online;
	}
}
