package psf.entity;
public class VZone extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer zoneid = null;
	protected java.lang.String province = null;
	protected java.lang.String city = null;
	protected String [] _fields = new String[]{"zoneid","province","city"};

	public VZone() {
	}
	public String getTableName() {
		return "v_zone";
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
	public java.lang.Integer getZoneid() {
		return zoneid;
	}
	public void setZoneid(java.lang.Integer zoneid) {
		 this.zoneid=zoneid;
	}
	public java.lang.String getProvince() {
		return province;
	}
	public void setProvince(java.lang.String province) {
		 this.province=province;
	}
	public java.lang.String getCity() {
		return city;
	}
	public void setCity(java.lang.String city) {
		 this.city=city;
	}
}
