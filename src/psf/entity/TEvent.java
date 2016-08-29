package psf.entity;
public class TEvent extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer eventid = null;
	protected java.lang.Integer uid = null;
	protected java.lang.Integer eventtype = null;
	protected java.lang.Integer starttime = null;
	protected java.lang.Integer endtime = null;
	protected java.lang.String title = null;
	protected java.lang.Integer zoneid = null;
	protected java.lang.String address = null;
	protected java.lang.String intro = null;
	protected java.lang.Integer jointype = null;
	protected java.lang.Integer invitepower = null;
	protected java.lang.Integer addtime = null;
	protected java.lang.String addip = null;
	protected java.lang.Integer clickcount = null;
	protected java.lang.Integer membercount = null;
	protected java.lang.Integer applycount = null;
	protected java.lang.Integer invitecount = null;
	protected java.lang.Integer delflag = null;
	protected String [] _fields = new String[]{"eventid","uid","eventtype","starttime","endtime","title","zoneid","address","intro","jointype","invitepower","addtime","addip","clickcount","membercount","applycount","invitecount","delflag"};

	public TEvent() {
	}
	public String getTableName() {
		return "t_event";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "eventid";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getEventid() {
		return eventid;
	}
	public void setEventid(java.lang.Integer eventid) {
		 this.eventid=eventid;
	}
	public java.lang.Integer getUid() {
		return uid;
	}
	public void setUid(java.lang.Integer uid) {
		 this.uid=uid;
	}
	public java.lang.Integer getEventtype() {
		return eventtype;
	}
	public void setEventtype(java.lang.Integer eventtype) {
		 this.eventtype=eventtype;
	}
	public java.lang.Integer getStarttime() {
		return starttime;
	}
	public void setStarttime(java.lang.Integer starttime) {
		 this.starttime=starttime;
	}
	public java.lang.Integer getEndtime() {
		return endtime;
	}
	public void setEndtime(java.lang.Integer endtime) {
		 this.endtime=endtime;
	}
	public java.lang.String getTitle() {
		return title;
	}
	public void setTitle(java.lang.String title) {
		 this.title=title;
	}
	public java.lang.Integer getZoneid() {
		return zoneid;
	}
	public void setZoneid(java.lang.Integer zoneid) {
		 this.zoneid=zoneid;
	}
	public java.lang.String getAddress() {
		return address;
	}
	public void setAddress(java.lang.String address) {
		 this.address=address;
	}
	public java.lang.String getIntro() {
		return intro;
	}
	public void setIntro(java.lang.String intro) {
		 this.intro=intro;
	}
	public java.lang.Integer getJointype() {
		return jointype;
	}
	public void setJointype(java.lang.Integer jointype) {
		 this.jointype=jointype;
	}
	public java.lang.Integer getInvitepower() {
		return invitepower;
	}
	public void setInvitepower(java.lang.Integer invitepower) {
		 this.invitepower=invitepower;
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
	public java.lang.Integer getClickcount() {
		return clickcount;
	}
	public void setClickcount(java.lang.Integer clickcount) {
		 this.clickcount=clickcount;
	}
	public java.lang.Integer getMembercount() {
		return membercount;
	}
	public void setMembercount(java.lang.Integer membercount) {
		 this.membercount=membercount;
	}
	public java.lang.Integer getApplycount() {
		return applycount;
	}
	public void setApplycount(java.lang.Integer applycount) {
		 this.applycount=applycount;
	}
	public java.lang.Integer getInvitecount() {
		return invitecount;
	}
	public void setInvitecount(java.lang.Integer invitecount) {
		 this.invitecount=invitecount;
	}
	public java.lang.Integer getDelflag() {
		return delflag;
	}
	public void setDelflag(java.lang.Integer delflag) {
		 this.delflag=delflag;
	}
}
