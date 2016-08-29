package psf.entity;
public class TFriendGroup extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer friendgroupid = null;
	protected java.lang.String friendgroupname = null;
	protected java.lang.Integer uid = null;
	protected java.lang.Integer displayorder = null;
	protected String [] _fields = new String[]{"friendgroupid","friendgroupname","uid","displayorder"};

	public TFriendGroup() {
	}
	public String getTableName() {
		return "t_friend_group";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "friendgroupid";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getFriendgroupid() {
		return friendgroupid;
	}
	public void setFriendgroupid(java.lang.Integer friendgroupid) {
		 this.friendgroupid=friendgroupid;
	}
	public java.lang.String getFriendgroupname() {
		return friendgroupname;
	}
	public void setFriendgroupname(java.lang.String friendgroupname) {
		 this.friendgroupname=friendgroupname;
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
