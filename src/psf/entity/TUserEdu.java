package psf.entity;
public class TUserEdu extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer eduid = null;
	protected java.lang.Integer uid = null;
	protected java.lang.String startdate = null;
	protected java.lang.String enddate = null;
	protected java.lang.Integer zoneid = null;
	protected java.lang.Integer schooltype = null;
	protected java.lang.String schoolname = null;
	protected java.lang.String majorname = null;
	protected java.lang.String classname = null;
	protected java.lang.Integer accesspower = null;
	protected String [] _fields = new String[]{"eduid","uid","startdate","enddate","zoneid","schooltype","schoolname","majorname","classname","accesspower"};

	public TUserEdu() {
	}
	public String getTableName() {
		return "t_user_edu";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "eduid";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getEduid() {
		return eduid;
	}
	public void setEduid(java.lang.Integer eduid) {
		 this.eduid=eduid;
	}
	public java.lang.Integer getUid() {
		return uid;
	}
	public void setUid(java.lang.Integer uid) {
		 this.uid=uid;
	}
	public java.lang.String getStartdate() {
		return startdate;
	}
	public void setStartdate(java.lang.String startdate) {
		 this.startdate=startdate;
	}
	public java.lang.String getEnddate() {
		return enddate;
	}
	public void setEnddate(java.lang.String enddate) {
		 this.enddate=enddate;
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
	public java.lang.String getMajorname() {
		return majorname;
	}
	public void setMajorname(java.lang.String majorname) {
		 this.majorname=majorname;
	}
	public java.lang.String getClassname() {
		return classname;
	}
	public void setClassname(java.lang.String classname) {
		 this.classname=classname;
	}
	public java.lang.Integer getAccesspower() {
		return accesspower;
	}
	public void setAccesspower(java.lang.Integer accesspower) {
		 this.accesspower=accesspower;
	}
}
