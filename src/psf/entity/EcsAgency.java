package psf.entity;
public class EcsAgency extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer agency_id = null;
	protected java.lang.String agency_name = null;
	protected java.lang.String agency_desc = null;
	protected String [] _fields = new String[]{"agency_id","agency_name","agency_desc"};

	public EcsAgency() {
	}
	public String getTableName() {
		return "ecs_agency";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "agency_id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getAgency_id() {
		return agency_id;
	}
	public void setAgency_id(java.lang.Integer agency_id) {
		 this.agency_id=agency_id;
	}
	public java.lang.String getAgency_name() {
		return agency_name;
	}
	public void setAgency_name(java.lang.String agency_name) {
		 this.agency_name=agency_name;
	}
	public java.lang.String getAgency_desc() {
		return agency_desc;
	}
	public void setAgency_desc(java.lang.String agency_desc) {
		 this.agency_desc=agency_desc;
	}
}
