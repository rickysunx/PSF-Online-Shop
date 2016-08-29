package psf.entity;
public class TLike extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer uid = null;
	protected java.lang.Integer otype = null;
	protected java.lang.Integer oid = null;
	protected String [] _fields = new String[]{"uid","otype","oid"};

	public TLike() {
	}
	public String getTableName() {
		return "t_like";
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
	public java.lang.Integer getUid() {
		return uid;
	}
	public void setUid(java.lang.Integer uid) {
		 this.uid=uid;
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
