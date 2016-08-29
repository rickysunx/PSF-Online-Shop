package psf.entity;
public class EcsAreaRegion extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer shipping_area_id = null;
	protected java.lang.Integer region_id = null;
	protected String [] _fields = new String[]{"shipping_area_id","region_id"};

	public EcsAreaRegion() {
	}
	public String getTableName() {
		return "ecs_area_region";
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
	public java.lang.Integer getShipping_area_id() {
		return shipping_area_id;
	}
	public void setShipping_area_id(java.lang.Integer shipping_area_id) {
		 this.shipping_area_id=shipping_area_id;
	}
	public java.lang.Integer getRegion_id() {
		return region_id;
	}
	public void setRegion_id(java.lang.Integer region_id) {
		 this.region_id=region_id;
	}
}
