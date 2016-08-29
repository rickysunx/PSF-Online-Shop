package psf.entity;
public class TUserJob extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer jobid = null;
	protected java.lang.Integer uid = null;
	protected java.lang.String startdate = null;
	protected java.lang.String enddate = null;
	protected java.lang.Integer zoneid = null;
	protected java.lang.String companyname = null;
	protected java.lang.String deptname = null;
	protected java.lang.String position = null;
	protected java.lang.Integer accesspower = null;
	protected String [] _fields = new String[]{"jobid","uid","startdate","enddate","zoneid","companyname","deptname","position","accesspower"};

	public TUserJob() {
	}
	public String getTableName() {
		return "t_user_job";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "jobid";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getJobid() {
		return jobid;
	}
	public void setJobid(java.lang.Integer jobid) {
		 this.jobid=jobid;
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
	public java.lang.String getCompanyname() {
		return companyname;
	}
	public void setCompanyname(java.lang.String companyname) {
		 this.companyname=companyname;
	}
	public java.lang.String getDeptname() {
		return deptname;
	}
	public void setDeptname(java.lang.String deptname) {
		 this.deptname=deptname;
	}
	public java.lang.String getPosition() {
		return position;
	}
	public void setPosition(java.lang.String position) {
		 this.position=position;
	}
	public java.lang.Integer getAccesspower() {
		return accesspower;
	}
	public void setAccesspower(java.lang.Integer accesspower) {
		 this.accesspower=accesspower;
	}
}
