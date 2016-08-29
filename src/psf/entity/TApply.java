package psf.entity;
public class TApply extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer applyid = null;
	protected java.lang.Integer otype = null;
	protected java.lang.Integer oid = null;
	protected java.lang.Integer fromuid = null;
	protected java.lang.Integer touid = null;
	protected java.lang.String content = null;
	protected java.lang.Integer addtime = null;
	protected java.lang.String addip = null;
	protected java.lang.Integer applytype = null;
	protected java.lang.Integer checktime = null;
	protected java.lang.Integer checkuid = null;
	protected java.lang.Integer checkstatus = null;
	protected java.lang.String checkreason = null;
	protected java.lang.Integer delbyapplier = null;
	protected java.lang.Integer delbychecker = null;
	protected String [] _fields = new String[]{"applyid","otype","oid","fromuid","touid","content","addtime","addip","applytype","checktime","checkuid","checkstatus","checkreason","delbyapplier","delbychecker"};

	public TApply() {
	}
	public String getTableName() {
		return "t_apply";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "applyid";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getApplyid() {
		return applyid;
	}
	public void setApplyid(java.lang.Integer applyid) {
		 this.applyid=applyid;
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
	public java.lang.Integer getFromuid() {
		return fromuid;
	}
	public void setFromuid(java.lang.Integer fromuid) {
		 this.fromuid=fromuid;
	}
	public java.lang.Integer getTouid() {
		return touid;
	}
	public void setTouid(java.lang.Integer touid) {
		 this.touid=touid;
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
	public java.lang.Integer getApplytype() {
		return applytype;
	}
	public void setApplytype(java.lang.Integer applytype) {
		 this.applytype=applytype;
	}
	public java.lang.Integer getChecktime() {
		return checktime;
	}
	public void setChecktime(java.lang.Integer checktime) {
		 this.checktime=checktime;
	}
	public java.lang.Integer getCheckuid() {
		return checkuid;
	}
	public void setCheckuid(java.lang.Integer checkuid) {
		 this.checkuid=checkuid;
	}
	public java.lang.Integer getCheckstatus() {
		return checkstatus;
	}
	public void setCheckstatus(java.lang.Integer checkstatus) {
		 this.checkstatus=checkstatus;
	}
	public java.lang.String getCheckreason() {
		return checkreason;
	}
	public void setCheckreason(java.lang.String checkreason) {
		 this.checkreason=checkreason;
	}
	public java.lang.Integer getDelbyapplier() {
		return delbyapplier;
	}
	public void setDelbyapplier(java.lang.Integer delbyapplier) {
		 this.delbyapplier=delbyapplier;
	}
	public java.lang.Integer getDelbychecker() {
		return delbychecker;
	}
	public void setDelbychecker(java.lang.Integer delbychecker) {
		 this.delbychecker=delbychecker;
	}
}
