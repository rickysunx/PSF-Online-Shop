package psf.entity;
public class EcsShippingArea extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer shipping_area_id = null;
	protected java.lang.String shipping_area_name = null;
	protected java.lang.Integer shipping_id = null;
	protected java.lang.String configure = null;
	protected String [] _fields = new String[]{"shipping_area_id","shipping_area_name","shipping_id","configure"};

	public EcsShippingArea() {
	}
	public String getTableName() {
		return "ecs_shipping_area";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "shipping_area_id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getShipping_area_id() {
		return shipping_area_id;
	}
	public void setShipping_area_id(java.lang.Integer shipping_area_id) {
		 this.shipping_area_id=shipping_area_id;
	}
	public java.lang.String getShipping_area_name() {
		return shipping_area_name;
	}
	public void setShipping_area_name(java.lang.String shipping_area_name) {
		 this.shipping_area_name=shipping_area_name;
	}
	public java.lang.Integer getShipping_id() {
		return shipping_id;
	}
	public void setShipping_id(java.lang.Integer shipping_id) {
		 this.shipping_id=shipping_id;
	}
	public java.lang.String getConfigure() {
		return configure;
	}
	public void setConfigure(java.lang.String configure) {
		 this.configure=configure;
	}
}
