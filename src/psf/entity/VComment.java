package psf.entity;
public class VComment extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.String username = null;
	protected java.lang.String avatarpic = null;
	protected java.lang.Integer commentid = null;
	protected java.lang.Integer uid = null;
	protected java.lang.Integer replyid = null;
	protected java.lang.Integer touid = null;
	protected java.lang.Integer toid = null;
	protected java.lang.Integer otype = null;
	protected java.lang.Integer oid = null;
	protected java.lang.String content = null;
	protected java.lang.Integer addtime = null;
	protected java.lang.String addip = null;
	protected java.lang.Integer haschild = null;
	protected java.lang.Integer delflag = null;
	protected String [] _fields = new String[]{"username","avatarpic","commentid","uid","replyid","touid","toid","otype","oid","content","addtime","addip","haschild","delflag"};

	public VComment() {
	}
	public String getTableName() {
		return "v_comment";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "null";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.String getUsername() {
		return username;
	}
	public void setUsername(java.lang.String username) {
		 this.username=username;
	}
	public java.lang.String getAvatarpic() {
		return avatarpic;
	}
	public void setAvatarpic(java.lang.String avatarpic) {
		 this.avatarpic=avatarpic;
	}
	public java.lang.Integer getCommentid() {
		return commentid;
	}
	public void setCommentid(java.lang.Integer commentid) {
		 this.commentid=commentid;
	}
	public java.lang.Integer getUid() {
		return uid;
	}
	public void setUid(java.lang.Integer uid) {
		 this.uid=uid;
	}
	public java.lang.Integer getReplyid() {
		return replyid;
	}
	public void setReplyid(java.lang.Integer replyid) {
		 this.replyid=replyid;
	}
	public java.lang.Integer getTouid() {
		return touid;
	}
	public void setTouid(java.lang.Integer touid) {
		 this.touid=touid;
	}
	public java.lang.Integer getToid() {
		return toid;
	}
	public void setToid(java.lang.Integer toid) {
		 this.toid=toid;
	}
	public java.lang.Integer getOtype() {
		return otype;
	}
	public void setOtype(java.lang.Integer otype) {
		 this.otype=otype;
	}
	public java.lang.Integer getOid() {
		return oid;
	}
	public void setOid(java.lang.Integer oid) {
		 this.oid=oid;
	}
	public java.lang.String getContent() {
		return content;
	}
	public void setContent(java.lang.String content) {
		 this.content=content;
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
	public java.lang.Integer getHaschild() {
		return haschild;
	}
	public void setHaschild(java.lang.Integer haschild) {
		 this.haschild=haschild;
	}
	public java.lang.Integer getDelflag() {
		return delflag;
	}
	public void setDelflag(java.lang.Integer delflag) {
		 this.delflag=delflag;
	}
}
