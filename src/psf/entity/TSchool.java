package psf.entity;
public class TSchool extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer schoolid = null;
	protected java.lang.Integer zoneid = null;
	protected java.lang.Integer schooltype = null;
	protected java.lang.String schoolname = null;
	protected String [] _fields = new String[]{"schoolid","zoneid","schooltype","schoolname"};

	public TSchool() {
	}
	public String getTableName() {
		return "t_school";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "schoolid";
	}
	public boolean isAutoIncrease() {
		return false;
	};
	public java.lang.Integer getSchoolid() {
		return schoolid;
	}
	public void setSchoolid(java.lang.Integer schoolid) {
		 this.schoolid=schoolid;
	}
	public java.lang.Integer getZoneid() {
		return zoneid;
	}
	public void setZoneid(java.lang.Integer zoneid) {
		 this.zoneid=zoneid;
	}
	public java.lang.Integer getSchooltype() {
		return schooltype;
	}
	public void setSchooltype(java.lang.Integer schooltype) {
		 this.schooltype=schooltype;
	}
	public java.lang.String getSchoolname() {
		return schoolname;
	}
	public void setSchoolname(java.lang.String schoolname) {
		 this.schoolname=schoolname;
	}
}
