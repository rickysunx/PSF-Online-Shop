package psf.entity;
public class EcsRegion extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer region_id = null;
	protected java.lang.Integer parent_id = null;
	protected java.lang.String region_name = null;
	protected java.lang.Integer region_type = null;
	protected java.lang.Integer agency_id = null;
	protected String [] _fields = new String[]{"region_id","parent_id","region_name","region_type","agency_id"};

	public EcsRegion() {
	}
	public String getTableName() {
		return "ecs_region";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "region_id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getRegion_id() {
		return region_id;
	}
	public void setRegion_id(java.lang.Integer region_id) {
		 this.region_id=region_id;
	}
	public java.lang.Integer getParent_id() {
		return parent_id;
	}
	public void setParent_id(java.lang.Integer parent_id) {
		 this.parent_id=parent_id;
	}
	public java.lang.String getRegion_name() {
		return region_name;
	}
	public void setRegion_name(java.lang.String region_name) {
		 this.region_name=region_name;
	}
	public java.lang.Integer getRegion_type() {
		return region_type;
	}
	public void setRegion_type(java.lang.Integer region_type) {
		 this.region_type=region_type;
	}
	public java.lang.Integer getAgency_id() {
		return agency_id;
	}
	public void setAgency_id(java.lang.Integer agency_id) {
		 this.agency_id=agency_id;
	}
}
