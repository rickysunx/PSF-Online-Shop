package psf.entity;
public class EcsShopConfig extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer id = null;
	protected java.lang.Integer parent_id = null;
	protected java.lang.String code = null;
	protected java.lang.String type = null;
	protected java.lang.String store_range = null;
	protected java.lang.String store_dir = null;
	protected java.lang.String value = null;
	protected java.lang.Integer sort_order = null;
	protected String [] _fields = new String[]{"id","parent_id","code","type","store_range","store_dir","value","sort_order"};

	public EcsShopConfig() {
	}
	public String getTableName() {
		return "ecs_shop_config";
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
	public java.lang.Integer getParent_id() {
		return parent_id;
	}
	public void setParent_id(java.lang.Integer parent_id) {
		 this.parent_id=parent_id;
	}
	public java.lang.String getCode() {
		return code;
	}
	public void setCode(java.lang.String code) {
		 this.code=code;
	}
	public java.lang.String getType() {
		return type;
	}
	public void setType(java.lang.String type) {
		 this.type=type;
	}
	public java.lang.String getStore_range() {
		return store_range;
	}
	public void setStore_range(java.lang.String store_range) {
		 this.store_range=store_range;
	}
	public java.lang.String getStore_dir() {
		return store_dir;
	}
	public void setStore_dir(java.lang.String store_dir) {
		 this.store_dir=store_dir;
	}
	public java.lang.String getValue() {
		return value;
	}
	public void setValue(java.lang.String value) {
		 this.value=value;
	}
	public java.lang.Integer getSort_order() {
		return sort_order;
	}
	public void setSort_order(java.lang.Integer sort_order) {
		 this.sort_order=sort_order;
	}
}
