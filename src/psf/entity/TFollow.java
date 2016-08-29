package psf.entity;
public class TFollow extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer uid = null;
	protected java.lang.Integer followuid = null;
	protected java.lang.Integer followgroupid = null;
	protected String [] _fields = new String[]{"uid","followuid","followgroupid"};

	public TFollow() {
	}
	public String getTableName() {
		return "t_follow";
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
	public java.lang.Integer getFollowuid() {
		return followuid;
	}
	public void setFollowuid(java.lang.Integer followuid) {
		 this.followuid=followuid;
	}
	public java.lang.Integer getFollowgroupid() {
		return followgroupid;
	}
	public void setFollowgroupid(java.lang.Integer followgroupid) {
		 this.followgroupid=followgroupid;
	}
}
