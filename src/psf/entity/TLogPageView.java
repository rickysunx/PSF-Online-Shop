package psf.entity;
public class TLogPageView extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer viewid = null;
	protected java.lang.String pageurl = null;
	protected java.lang.String referer = null;
	protected java.lang.String useragent = null;
	protected java.lang.Integer addtime = null;
	protected java.lang.String addip = null;
	protected java.lang.Integer uid = null;
	protected java.lang.String sessionid = null;
	protected String [] _fields = new String[]{"viewid","pageurl","referer","useragent","addtime","addip","uid","sessionid"};

	public TLogPageView() {
	}
	public String getTableName() {
		return "t_log_page_view";
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
	public java.lang.String getPageurl() {
		return pageurl;
	}
	public void setPageurl(java.lang.String pageurl) {
		 this.pageurl=pageurl;
	}
	public java.lang.String getReferer() {
		return referer;
	}
	public void setReferer(java.lang.String referer) {
		 this.referer=referer;
	}
	public java.lang.String getUseragent() {
		return useragent;
	}
	public void setUseragent(java.lang.String useragent) {
		 this.useragent=useragent;
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
}
