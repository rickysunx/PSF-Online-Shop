package psf.entity;
public class TRemarklist extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer uid = null;
	protected java.lang.Integer remarkuid = null;
	protected java.lang.String remarkname = null;
	protected String [] _fields = new String[]{"uid","remarkuid","remarkname"};

	public TRemarklist() {
	}
	public String getTableName() {
		return "t_remarklist";
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
	public java.lang.Integer getRemarkuid() {
		return remarkuid;
	}
	public void setRemarkuid(java.lang.Integer remarkuid) {
		 this.remarkuid=remarkuid;
	}
	public java.lang.String getRemarkname() {
		return remarkname;
	}
	public void setRemarkname(java.lang.String remarkname) {
		 this.remarkname=remarkname;
	}
}
