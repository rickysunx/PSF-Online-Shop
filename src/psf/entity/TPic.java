package psf.entity;
public class TPic extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer picid = null;
	protected java.lang.Integer otype = null;
	protected java.lang.Integer oid = null;
	protected java.lang.Integer uid = null;
	protected java.lang.String filename = null;
	protected java.lang.String filetype = null;
	protected java.lang.Integer filesize = null;
	protected java.lang.Integer addtime = null;
	protected java.lang.String pictitle = null;
	protected java.lang.Integer iscover = null;
	protected java.lang.String addip = null;
	protected String [] _fields = new String[]{"picid","otype","oid","uid","filename","filetype","filesize","addtime","pictitle","iscover","addip"};

	public TPic() {
	}
	public String getTableName() {
		return "t_pic";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "picid";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getPicid() {
		return picid;
	}
	public void setPicid(java.lang.Integer picid) {
		 this.picid=picid;
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
	public java.lang.Integer getUid() {
		return uid;
	}
	public void setUid(java.lang.Integer uid) {
		 this.uid=uid;
	}
	public java.lang.String getFilename() {
		return filename;
	}
	public void setFilename(java.lang.String filename) {
		 this.filename=filename;
	}
	public java.lang.String getFiletype() {
		return filetype;
	}
	public void setFiletype(java.lang.String filetype) {
		 this.filetype=filetype;
	}
	public java.lang.Integer getFilesize() {
		return filesize;
	}
	public void setFilesize(java.lang.Integer filesize) {
		 this.filesize=filesize;
	}
	public java.lang.Integer getAddtime() {
		return addtime;
	}
	public void setAddtime(java.lang.Integer addtime) {
		 this.addtime=addtime;
	}
	public java.lang.String getPictitle() {
		return pictitle;
	}
	public void setPictitle(java.lang.String pictitle) {
		 this.pictitle=pictitle;
	}
	public java.lang.Integer getIscover() {
		return iscover;
	}
	public void setIscover(java.lang.Integer iscover) {
		 this.iscover=iscover;
	}
	public java.lang.String getAddip() {
		return addip;
	}
	public void setAddip(java.lang.String addip) {
		 this.addip=addip;
	}
}
