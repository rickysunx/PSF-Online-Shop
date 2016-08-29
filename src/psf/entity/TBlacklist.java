package psf.entity;
public class TBlacklist extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer uid = null;
	protected java.lang.Integer blockuid = null;
	protected String [] _fields = new String[]{"uid","blockuid"};

	public TBlacklist() {
	}
	public String getTableName() {
		return "t_blacklist";
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
	public java.lang.Integer getBlockuid() {
		return blockuid;
	}
	public void setBlockuid(java.lang.Integer blockuid) {
		 this.blockuid=blockuid;
	}
}
