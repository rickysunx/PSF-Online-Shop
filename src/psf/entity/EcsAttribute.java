package psf.entity;
public class EcsAttribute extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer attr_id = null;
	protected java.lang.Integer cat_id = null;
	protected java.lang.String attr_name = null;
	protected java.lang.Integer attr_input_type = null;
	protected java.lang.Integer attr_type = null;
	protected java.lang.String attr_values = null;
	protected java.lang.Integer attr_index = null;
	protected java.lang.Integer sort_order = null;
	protected java.lang.Integer is_linked = null;
	protected java.lang.Integer attr_group = null;
	protected String [] _fields = new String[]{"attr_id","cat_id","attr_name","attr_input_type","attr_type","attr_values","attr_index","sort_order","is_linked","attr_group"};

	public EcsAttribute() {
	}
	public String getTableName() {
		return "ecs_attribute";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "attr_id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getAttr_id() {
		return attr_id;
	}
	public void setAttr_id(java.lang.Integer attr_id) {
		 this.attr_id=attr_id;
	}
	public java.lang.Integer getCat_id() {
		return cat_id;
	}
	public void setCat_id(java.lang.Integer cat_id) {
		 this.cat_id=cat_id;
	}
	public java.lang.String getAttr_name() {
		return attr_name;
	}
	public void setAttr_name(java.lang.String attr_name) {
		 this.attr_name=attr_name;
	}
	public java.lang.Integer getAttr_input_type() {
		return attr_input_type;
	}
	public void setAttr_input_type(java.lang.Integer attr_input_type) {
		 this.attr_input_type=attr_input_type;
	}
	public java.lang.Integer getAttr_type() {
		return attr_type;
	}
	public void setAttr_type(java.lang.Integer attr_type) {
		 this.attr_type=attr_type;
	}
	public java.lang.String getAttr_values() {
		return attr_values;
	}
	public void setAttr_values(java.lang.String attr_values) {
		 this.attr_values=attr_values;
	}
	public java.lang.Integer getAttr_index() {
		return attr_index;
	}
	public void setAttr_index(java.lang.Integer attr_index) {
		 this.attr_index=attr_index;
	}
	public java.lang.Integer getSort_order() {
		return sort_order;
	}
	public void setSort_order(java.lang.Integer sort_order) {
		 this.sort_order=sort_order;
	}
	public java.lang.Integer getIs_linked() {
		return is_linked;
	}
	public void setIs_linked(java.lang.Integer is_linked) {
		 this.is_linked=is_linked;
	}
	public java.lang.Integer getAttr_group() {
		return attr_group;
	}
	public void setAttr_group(java.lang.Integer attr_group) {
		 this.attr_group=attr_group;
	}
}
