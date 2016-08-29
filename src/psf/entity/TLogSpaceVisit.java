package psf.entity;
public class TLogSpaceVisit extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer visitid = null;
	protected java.lang.Integer spaceuid = null;
	protected java.lang.Integer visituid = null;
	protected java.lang.String sessionid = null;
	protected java.lang.String addip = null;
	protected java.lang.Integer addtime = null;
	protected String [] _fields = new String[]{"visitid","spaceuid","visituid","sessionid","addip","addtime"};

	public TLogSpaceVisit() {
	}
	public String getTableName() {
		return "t_log_space_visit";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "visitid";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getVisitid() {
		return visitid;
	}
	public void setVisitid(java.lang.Integer visitid) {
		 this.visitid=visitid;
	}
	public java.lang.Integer getSpaceuid() {
		return spaceuid;
	}
	public void setSpaceuid(java.lang.Integer spaceuid) {
		 this.spaceuid=spaceuid;
	}
	public java.lang.Integer getVisituid() {
		return visituid;
	}
	public void setVisituid(java.lang.Integer visituid) {
		 this.visituid=visituid;
	}
	public java.lang.String getSessionid() {
		return sessionid;
	}
	public void setSessionid(java.lang.String sessionid) {
		 this.sessionid=sessionid;
	}
	public java.lang.String getAddip() {
		return addip;
	}
	public void setAddip(java.lang.String addip) {
		 this.addip=addip;
	}
	public java.lang.Integer getAddtime() {
		return addtime;
	}
	public void setAddtime(java.lang.Integer addtime) {
		 this.addtime=addtime;
	}
}
