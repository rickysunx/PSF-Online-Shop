package psf.entity;
public class TFriend extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer uid = null;
	protected java.lang.Integer friendid = null;
	protected java.lang.Integer friendgroupid = null;
	protected String [] _fields = new String[]{"uid","friendid","friendgroupid"};

	public TFriend() {
	}
	public String getTableName() {
		return "t_friend";
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
	public java.lang.Integer getFriendid() {
		return friendid;
	}
	public void setFriendid(java.lang.Integer friendid) {
		 this.friendid=friendid;
	}
	public java.lang.Integer getFriendgroupid() {
		return friendgroupid;
	}
	public void setFriendgroupid(java.lang.Integer friendgroupid) {
		 this.friendgroupid=friendgroupid;
	}
}
