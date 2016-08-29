package psf.entity;
public class TInviteCode extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer codeid = null;
	protected java.lang.String invitecode = null;
	protected java.lang.Integer oid = null;
	protected java.lang.Integer otype = null;
	protected java.lang.Integer uid = null;
	protected java.lang.Integer usecount = null;
	protected java.lang.Integer addtime = null;
	protected java.lang.Integer isvalid = null;
	protected String [] _fields = new String[]{"codeid","invitecode","oid","otype","uid","usecount","addtime","isvalid"};

	public TInviteCode() {
	}
	public String getTableName() {
		return "t_invite_code";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "codeid";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getCodeid() {
		return codeid;
	}
	public void setCodeid(java.lang.Integer codeid) {
		 this.codeid=codeid;
	}
	public java.lang.String getInvitecode() {
		return invitecode;
	}
	public void setInvitecode(java.lang.String invitecode) {
		 this.invitecode=invitecode;
	}
	public java.lang.Integer getOid() {
		return oid;
	}
	public void setOid(java.lang.Integer oid) {
		 this.oid=oid;
	}
	public java.lang.Integer getOtype() {
		return otype;
	}
	public void setOtype(java.lang.Integer otype) {
		 this.otype=otype;
	}
	public java.lang.Integer getUid() {
		return uid;
	}
	public void setUid(java.lang.Integer uid) {
		 this.uid=uid;
	}
	public java.lang.Integer getUsecount() {
		return usecount;
	}
	public void setUsecount(java.lang.Integer usecount) {
		 this.usecount=usecount;
	}
	public java.lang.Integer getAddtime() {
		return addtime;
	}
	public void setAddtime(java.lang.Integer addtime) {
		 this.addtime=addtime;
	}
	public java.lang.Integer getIsvalid() {
		return isvalid;
	}
	public void setIsvalid(java.lang.Integer isvalid) {
		 this.isvalid=isvalid;
	}
}
