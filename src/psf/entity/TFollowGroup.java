package psf.entity;
public class TFollowGroup extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer followgroupid = null;
	protected java.lang.String followgroupname = null;
	protected java.lang.Integer uid = null;
	protected java.lang.Integer displayorder = null;
	protected String [] _fields = new String[]{"followgroupid","followgroupname","uid","displayorder"};

	public TFollowGroup() {
	}
	public String getTableName() {
		return "t_follow_group";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "followgroupid";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getFollowgroupid() {
		return followgroupid;
	}
	public void setFollowgroupid(java.lang.Integer followgroupid) {
		 this.followgroupid=followgroupid;
	}
	public java.lang.String getFollowgroupname() {
		return followgroupname;
	}
	public void setFollowgroupname(java.lang.String followgroupname) {
		 this.followgroupname=followgroupname;
	}
	public java.lang.Integer getUid() {
		return uid;
	}
	public void setUid(java.lang.Integer uid) {
		 this.uid=uid;
	}
	public java.lang.Integer getDisplayorder() {
		return displayorder;
	}
	public void setDisplayorder(java.lang.Integer displayorder) {
		 this.displayorder=displayorder;
	}
}
