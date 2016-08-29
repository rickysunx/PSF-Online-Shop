package psf.entity;
public class EcsGoodsType extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer cat_id = null;
	protected java.lang.String cat_name = null;
	protected java.lang.Integer enabled = null;
	protected java.lang.String attr_group = null;
	protected String [] _fields = new String[]{"cat_id","cat_name","enabled","attr_group"};

	public EcsGoodsType() {
	}
	public String getTableName() {
		return "ecs_goods_type";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "cat_id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getCat_id() {
		return cat_id;
	}
	public void setCat_id(java.lang.Integer cat_id) {
		 this.cat_id=cat_id;
	}
	public java.lang.String getCat_name() {
		return cat_name;
	}
	public void setCat_name(java.lang.String cat_name) {
		 this.cat_name=cat_name;
	}
	public java.lang.Integer getEnabled() {
		return enabled;
	}
	public void setEnabled(java.lang.Integer enabled) {
		 this.enabled=enabled;
	}
	public java.lang.String getAttr_group() {
		return attr_group;
	}
	public void setAttr_group(java.lang.String attr_group) {
		 this.attr_group=attr_group;
	}
}
