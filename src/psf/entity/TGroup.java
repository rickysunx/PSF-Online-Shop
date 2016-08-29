package psf.entity;
public class TGroup extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer groupid = null;
	protected java.lang.String groupname = null;
	protected java.lang.Integer groupclassid = null;
	protected java.lang.Integer uid = null;
	protected java.lang.Integer picid = null;
	protected java.lang.Integer grouptype = null;
	protected java.lang.Integer addtime = null;
	protected java.lang.String addip = null;
	protected java.lang.Integer membercount = null;
	protected java.lang.String intro = null;
	protected java.lang.String grouptag = null;
	protected java.lang.Integer zoneid = null;
	protected java.lang.Integer delflag = null;
	protected String [] _fields = new String[]{"groupid","groupname","groupclassid","uid","picid","grouptype","addtime","addip","membercount","intro","grouptag","zoneid","delflag"};

	public TGroup() {
	}
	public String getTableName() {
		return "t_group";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "groupid";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getGroupid() {
		return groupid;
	}
	public void setGroupid(java.lang.Integer groupid) {
		 this.groupid=groupid;
	}
	public java.lang.String getGroupname() {
		return groupname;
	}
	public void setGroupname(java.lang.String groupname) {
		 this.groupname=groupname;
	}
	public java.lang.Integer getGroupclassid() {
		return groupclassid;
	}
	public void setGroupclassid(java.lang.Integer groupclassid) {
		 this.groupclassid=groupclassid;
	}
	public java.lang.Integer getUid() {
		return uid;
	}
	public void setUid(java.lang.Integer uid) {
		 this.uid=uid;
	}
	public java.lang.Integer getPicid() {
		return picid;
	}
	public void setPicid(java.lang.Integer picid) {
		 this.picid=picid;
	}
	public java.lang.Integer getGrouptype() {
		return grouptype;
	}
	public void setGrouptype(java.lang.Integer grouptype) {
		 this.grouptype=grouptype;
	}
	public java.lang.Integer getAddtime() {
		return addtime;
	}
	public void setAddtime(java.lang.Integer addtime) {
		 this.addtime=addtime;
	}
	public java.lang.String getAddip() {
		return addip;
	}
	public void setAddip(java.lang.String addip) {
		 this.addip=addip;
	}
	public java.lang.Integer getMembercount() {
		return membercount;
	}
	public void setMembercount(java.lang.Integer membercount) {
		 this.membercount=membercount;
	}
	public java.lang.String getIntro() {
		return intro;
	}
	public void setIntro(java.lang.String intro) {
		 this.intro=intro;
	}
	public java.lang.String getGrouptag() {
		return grouptag;
	}
	public void setGrouptag(java.lang.String grouptag) {
		 this.grouptag=grouptag;
	}
	public java.lang.Integer getZoneid() {
		return zoneid;
	}
	public void setZoneid(java.lang.Integer zoneid) {
		 this.zoneid=zoneid;
	}
	public java.lang.Integer getDelflag() {
		return delflag;
	}
	public void setDelflag(java.lang.Integer delflag) {
		 this.delflag=delflag;
	}
}
