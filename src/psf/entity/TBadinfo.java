package psf.entity;
public class TBadinfo extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer badinfoid = null;
	protected java.lang.Integer otype = null;
	protected java.lang.Integer oid = null;
	protected java.lang.Integer badinfotype = null;
	protected java.lang.String badinfo = null;
	protected String [] _fields = new String[]{"badinfoid","otype","oid","badinfotype","badinfo"};

	public TBadinfo() {
	}
	public String getTableName() {
		return "t_badinfo";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "badinfoid";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getBadinfoid() {
		return badinfoid;
	}
	public void setBadinfoid(java.lang.Integer badinfoid) {
		 this.badinfoid=badinfoid;
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
	public java.lang.Integer getBadinfotype() {
		return badinfotype;
	}
	public void setBadinfotype(java.lang.Integer badinfotype) {
		 this.badinfotype=badinfotype;
	}
	public java.lang.String getBadinfo() {
		return badinfo;
	}
	public void setBadinfo(java.lang.String badinfo) {
		 this.badinfo=badinfo;
	}
}
