package psf.entity;
public class EcsShipping extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer shipping_id = null;
	protected java.lang.String shipping_code = null;
	protected java.lang.String shipping_name = null;
	protected java.lang.String shipping_desc = null;
	protected java.lang.String insure = null;
	protected java.lang.Integer support_cod = null;
	protected java.lang.Integer enabled = null;
	protected java.lang.String shipping_print = null;
	protected java.lang.String print_bg = null;
	protected java.lang.String config_lable = null;
	protected java.lang.Integer print_model = null;
	protected String [] _fields = new String[]{"shipping_id","shipping_code","shipping_name","shipping_desc","insure","support_cod","enabled","shipping_print","print_bg","config_lable","print_model"};

	public EcsShipping() {
	}
	public String getTableName() {
		return "ecs_shipping";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "shipping_id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getShipping_id() {
		return shipping_id;
	}
	public void setShipping_id(java.lang.Integer shipping_id) {
		 this.shipping_id=shipping_id;
	}
	public java.lang.String getShipping_code() {
		return shipping_code;
	}
	public void setShipping_code(java.lang.String shipping_code) {
		 this.shipping_code=shipping_code;
	}
	public java.lang.String getShipping_name() {
		return shipping_name;
	}
	public void setShipping_name(java.lang.String shipping_name) {
		 this.shipping_name=shipping_name;
	}
	public java.lang.String getShipping_desc() {
		return shipping_desc;
	}
	public void setShipping_desc(java.lang.String shipping_desc) {
		 this.shipping_desc=shipping_desc;
	}
	public java.lang.String getInsure() {
		return insure;
	}
	public void setInsure(java.lang.String insure) {
		 this.insure=insure;
	}
	public java.lang.Integer getSupport_cod() {
		return support_cod;
	}
	public void setSupport_cod(java.lang.Integer support_cod) {
		 this.support_cod=support_cod;
	}
	public java.lang.Integer getEnabled() {
		return enabled;
	}
	public void setEnabled(java.lang.Integer enabled) {
		 this.enabled=enabled;
	}
	public java.lang.String getShipping_print() {
		return shipping_print;
	}
	public void setShipping_print(java.lang.String shipping_print) {
		 this.shipping_print=shipping_print;
	}
	public java.lang.String getPrint_bg() {
		return print_bg;
	}
	public void setPrint_bg(java.lang.String print_bg) {
		 this.print_bg=print_bg;
	}
	public java.lang.String getConfig_lable() {
		return config_lable;
	}
	public void setConfig_lable(java.lang.String config_lable) {
		 this.config_lable=config_lable;
	}
	public java.lang.Integer getPrint_model() {
		return print_model;
	}
	public void setPrint_model(java.lang.Integer print_model) {
		 this.print_model=print_model;
	}
}
