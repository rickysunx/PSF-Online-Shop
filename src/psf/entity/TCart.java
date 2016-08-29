package psf.entity;
public class TCart extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.String sessionid = null;
	protected java.lang.Integer uid = null;
	protected java.lang.Integer pid = null;
	protected java.lang.Integer pcount = null;
	protected String [] _fields = new String[]{"sessionid","uid","pid","pcount"};

	public TCart() {
	}
	public String getTableName() {
		return "t_cart";
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
	public java.lang.Integer getPid() {
		return pid;
	}
	public void setPid(java.lang.Integer pid) {
		 this.pid=pid;
	}
	public java.lang.Integer getPcount() {
		return pcount;
	}
	public void setPcount(java.lang.Integer pcount) {
		 this.pcount=pcount;
	}
}
