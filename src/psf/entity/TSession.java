package psf.entity;
public class TSession extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.String sessionid = null;
	protected java.lang.Integer uid = null;
	protected java.lang.Integer adminid = null;
	protected java.lang.Integer starttime = null;
	protected java.lang.Integer lasttime = null;
	protected java.lang.String ip = null;
	protected java.lang.Integer valid = null;
	protected String [] _fields = new String[]{"sessionid","uid","adminid","starttime","lasttime","ip","valid"};

	public TSession() {
	}
	public String getTableName() {
		return "t_session";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "sessionid";
	}
	public boolean isAutoIncrease() {
		return false;
	};
	public java.lang.String getSessionid() {
		return sessionid;
	}
	public void setSessionid(java.lang.String sessionid) {
		 this.sessionid=sessionid;
	}
	public java.lang.Integer getUid() {
		return uid;
	}
	public void setUid(java.lang.Integer uid) {
		 this.uid=uid;
	}
	public java.lang.Integer getAdminid() {
		return adminid;
	}
	public void setAdminid(java.lang.Integer adminid) {
		 this.adminid=adminid;
	}
	public java.lang.Integer getStarttime() {
		return starttime;
	}
	public void setStarttime(java.lang.Integer starttime) {
		 this.starttime=starttime;
	}
	public java.lang.Integer getLasttime() {
		return lasttime;
	}
	public void setLasttime(java.lang.Integer lasttime) {
		 this.lasttime=lasttime;
	}
	public java.lang.String getIp() {
		return ip;
	}
	public void setIp(java.lang.String ip) {
		 this.ip=ip;
	}
	public java.lang.Integer getValid() {
		return valid;
	}
	public void setValid(java.lang.Integer valid) {
		 this.valid=valid;
	}
}
