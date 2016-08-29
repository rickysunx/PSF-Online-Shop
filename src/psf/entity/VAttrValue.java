package psf.entity;
public class VAttrValue extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Long attr_value_id = null;
	protected java.lang.Integer attr_id = null;
	protected java.lang.String attr_name = null;
	protected java.lang.String attr_value = null;
	protected String [] _fields = new String[]{"attr_value_id","attr_id","attr_name","attr_value"};

	public VAttrValue() {
	}
	public String getTableName() {
		return "v_attr_value";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "null";
	}
	public boolean isAutoIncrease() {
		return false;
	};
	public java.lang.Long getAttr_value_id() {
		return attr_value_id;
	}
	public void setAttr_value_id(java.lang.Long attr_value_id) {
		 this.attr_value_id=attr_value_id;
	}
	public java.lang.Integer getAttr_id() {
		return attr_id;
	}
	public void setAttr_id(java.lang.Integer attr_id) {
		 this.attr_id=attr_id;
	}
	public java.lang.String getAttr_name() {
		return attr_name;
	}
	public void setAttr_name(java.lang.String attr_name) {
		 this.attr_name=attr_name;
	}
	public java.lang.String getAttr_value() {
		return attr_value;
	}
	public void setAttr_value(java.lang.String attr_value) {
		 this.attr_value=attr_value;
	}
}
