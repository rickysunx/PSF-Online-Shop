package psf.entity;
public class TUrl extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer urlid = null;
	protected java.lang.Integer urltype = null;
	protected java.lang.String ourl = null;
	protected java.lang.String swfurl = null;
	protected java.lang.String thumburl = null;
	protected java.lang.String title = null;
	protected String [] _fields = new String[]{"urlid","urltype","ourl","swfurl","thumburl","title"};

	public TUrl() {
	}
	public String getTableName() {
		return "t_url";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "urlid";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getUrlid() {
		return urlid;
	}
	public void setUrlid(java.lang.Integer urlid) {
		 this.urlid=urlid;
	}
	public java.lang.Integer getUrltype() {
		return urltype;
	}
	public void setUrltype(java.lang.Integer urltype) {
		 this.urltype=urltype;
	}
	public java.lang.String getOurl() {
		return ourl;
	}
	public void setOurl(java.lang.String ourl) {
		 this.ourl=ourl;
	}
	public java.lang.String getSwfurl() {
		return swfurl;
	}
	public void setSwfurl(java.lang.String swfurl) {
		 this.swfurl=swfurl;
	}
	public java.lang.String getThumburl() {
		return thumburl;
	}
	public void setThumburl(java.lang.String thumburl) {
		 this.thumburl=thumburl;
	}
	public java.lang.String getTitle() {
		return title;
	}
	public void setTitle(java.lang.String title) {
		 this.title=title;
	}
}
