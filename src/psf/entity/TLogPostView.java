package psf.entity;
public class TLogPostView extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer viewid = null;
	protected java.lang.Integer postid = null;
	protected java.lang.Integer uid = null;
	protected java.lang.String sessionid = null;
	protected java.lang.Integer addtime = null;
	protected java.lang.String addip = null;
	protected String [] _fields = new String[]{"viewid","postid","uid","sessionid","addtime","addip"};

	public TLogPostView() {
	}
	public String getTableName() {
		return "t_log_post_view";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "viewid";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getViewid() {
		return viewid;
	}
	public void setViewid(java.lang.Integer viewid) {
		 this.viewid=viewid;
	}
	public java.lang.Integer getPostid() {
		return postid;
	}
	public void setPostid(java.lang.Integer postid) {
		 this.postid=postid;
	}
	public java.lang.Integer getUid() {
		return uid;
	}
	public void setUid(java.lang.Integer uid) {
		 this.uid=uid;
	}
	public java.lang.String getSessionid() {
		return sessionid;
	}
	public void setSessionid(java.lang.String sessionid) {
		 this.sessionid=sessionid;
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
}
