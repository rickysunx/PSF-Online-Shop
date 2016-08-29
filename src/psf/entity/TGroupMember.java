package psf.entity;
public class TGroupMember extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer groupid = null;
	protected java.lang.Integer uid = null;
	protected java.lang.String nickname = null;
	protected java.lang.Integer role = null;
	protected java.lang.Integer addtime = null;
	protected java.lang.Integer lasttime = null;
	protected java.lang.Integer postcount = null;
	protected String [] _fields = new String[]{"groupid","uid","nickname","role","addtime","lasttime","postcount"};

	public TGroupMember() {
	}
	public String getTableName() {
		return "t_group_member";
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
	public java.lang.Integer getGroupid() {
		return groupid;
	}
	public void setGroupid(java.lang.Integer groupid) {
		 this.groupid=groupid;
	}
	public java.lang.Integer getUid() {
		return uid;
	}
	public void setUid(java.lang.Integer uid) {
		 this.uid=uid;
	}
	public java.lang.String getNickname() {
		return nickname;
	}
	public void setNickname(java.lang.String nickname) {
		 this.nickname=nickname;
	}
	public java.lang.Integer getRole() {
		return role;
	}
	public void setRole(java.lang.Integer role) {
		 this.role=role;
	}
	public java.lang.Integer getAddtime() {
		return addtime;
	}
	public void setAddtime(java.lang.Integer addtime) {
		 this.addtime=addtime;
	}
	public java.lang.Integer getLasttime() {
		return lasttime;
	}
	public void setLasttime(java.lang.Integer lasttime) {
		 this.lasttime=lasttime;
	}
	public java.lang.Integer getPostcount() {
		return postcount;
	}
	public void setPostcount(java.lang.Integer postcount) {
		 this.postcount=postcount;
	}
}
