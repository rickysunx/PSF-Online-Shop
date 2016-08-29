package psf.entity;
public class VRegion extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer province_id = null;
	protected java.lang.Integer city_id = null;
	protected java.lang.Integer district_id = null;
	protected java.lang.String province_name = null;
	protected java.lang.String city_name = null;
	protected java.lang.String district_name = null;
	protected String [] _fields = new String[]{"province_id","city_id","district_id","province_name","city_name","district_name"};

	public VRegion() {
	}
	public String getTableName() {
		return "v_region";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "null";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getProvince_id() {
		return province_id;
	}
	public void setProvince_id(java.lang.Integer province_id) {
		 this.province_id=province_id;
	}
	public java.lang.Integer getCity_id() {
		return city_id;
	}
	public void setCity_id(java.lang.Integer city_id) {
		 this.city_id=city_id;
	}
	public java.lang.Integer getDistrict_id() {
		return district_id;
	}
	public void setDistrict_id(java.lang.Integer district_id) {
		 this.district_id=district_id;
	}
	public java.lang.String getProvince_name() {
		return province_name;
	}
	public void setProvince_name(java.lang.String province_name) {
		 this.province_name=province_name;
	}
	public java.lang.String getCity_name() {
		return city_name;
	}
	public void setCity_name(java.lang.String city_name) {
		 this.city_name=city_name;
	}
	public java.lang.String getDistrict_name() {
		return district_name;
	}
	public void setDistrict_name(java.lang.String district_name) {
		 this.district_name=district_name;
	}
}
