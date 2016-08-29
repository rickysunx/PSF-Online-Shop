package psf.entity;
public class TZone extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer zoneid = null;
	protected java.lang.Integer level = null;
	protected java.lang.Integer level1id = null;
	protected java.lang.Integer level2id = null;
	protected java.lang.String zonename = null;
	protected String [] _fields = new String[]{"zoneid","level","level1id","level2id","zonename"};

	public TZone() {
	}
	public String getTableName() {
		return "t_zone";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "zoneid";
	}
	public boolean isAutoIncrease() {
		return false;
	};
	public java.lang.Integer getZoneid() {
		return zoneid;
	}
	public void setZoneid(java.lang.Integer zoneid) {
		 this.zoneid=zoneid;
	}
	public java.lang.Integer getLevel() {
		return level;
	}
	public void setLevel(java.lang.Integer level) {
		 this.level=level;
	}
	public java.lang.Integer getLevel1id() {
		return level1id;
	}
	public void setLevel1id(java.lang.Integer level1id) {
		 this.level1id=level1id;
	}
	public java.lang.Integer getLevel2id() {
		return level2id;
	}
	public void setLevel2id(java.lang.Integer level2id) {
		 this.level2id=level2id;
	}
	public java.lang.String getZonename() {
		return zonename;
	}
	public void setZonename(java.lang.String zonename) {
		 this.zonename=zonename;
	}
}
