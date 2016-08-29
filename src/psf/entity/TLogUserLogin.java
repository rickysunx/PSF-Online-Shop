package psf.entity;
public class TLogUserLogin extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer loginid = null;
	protected java.lang.Integer uid = null;
	protected java.lang.String username = null;
	protected java.lang.String sessionid = null;
	protected java.lang.Integer addtime = null;
	protected java.lang.String addip = null;
	protected String [] _fields = new String[]{"loginid","uid","username","sessionid","addtime","addip"};

	public TLogUserLogin() {
	}
	public String getTableName() {
		return "t_log_user_login";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "loginid";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getLoginid() {
		return loginid;
	}
	public void setLoginid(java.lang.Integer loginid) {
		 this.loginid=loginid;
	}
	public java.lang.Integer getUid() {
		return uid;
	}
	public void setUid(java.lang.Integer uid) {
		 this.uid=uid;
	}
	public java.lang.String getUsername() {
		return username;
	}
	public void setUsername(java.lang.String username) {
		 this.username=username;
	}
	public java.lang.String getSessionid() {
		return sessionid;
	}
	public void setSessionid(java.lang.String sessionid) {
		 this.sessionid=sessionid;
	}
	public java.lang.Integer getAddtime() {
		return addtime;
	}
	public void setAddtime(java.lang.Integer addtime) {
		 this.addtime=addtime;
	}
	public java.lang.String getAddip() {
		return addip;
	}
	public void setAddip(java.lang.String addip) {
		 this.addip=addip;
	}
}
