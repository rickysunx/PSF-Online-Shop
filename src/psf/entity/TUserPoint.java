package psf.entity;
public class TUserPoint extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer pointid = null;
	protected java.lang.Integer uid = null;
	protected java.lang.Integer addtime = null;
	protected java.math.BigDecimal amount = null;
	protected java.lang.String summary = null;
	protected java.lang.Integer actionid = null;
	protected java.lang.Integer otype = null;
	protected java.lang.Integer oid = null;
	protected String [] _fields = new String[]{"pointid","uid","addtime","amount","summary","actionid","otype","oid"};

	public TUserPoint() {
	}
	public String getTableName() {
		return "t_user_point";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "pointid";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getPointid() {
		return pointid;
	}
	public void setPointid(java.lang.Integer pointid) {
		 this.pointid=pointid;
	}
	public java.lang.Integer getUid() {
		return uid;
	}
	public void setUid(java.lang.Integer uid) {
		 this.uid=uid;
	}
	public java.lang.Integer getAddtime() {
		return addtime;
	}
	public void setAddtime(java.lang.Integer addtime) {
		 this.addtime=addtime;
	}
	public java.math.BigDecimal getAmount() {
		return amount;
	}
	public void setAmount(java.math.BigDecimal amount) {
		 this.amount=amount;
	}
	public java.lang.String getSummary() {
		return summary;
	}
	public void setSummary(java.lang.String summary) {
		 this.summary=summary;
	}
	public java.lang.Integer getActionid() {
		return actionid;
	}
	public void setActionid(java.lang.Integer actionid) {
		 this.actionid=actionid;
	}
	public java.lang.Integer getOtype() {
		return otype;
	}
	public void setOtype(java.lang.Integer otype) {
		 this.otype=otype;
	}
	public java.lang.Integer getOid() {
		return oid;
	}
	public void setOid(java.lang.Integer oid) {
		 this.oid=oid;
	}
}
