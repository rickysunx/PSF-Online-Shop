package psf.entity;
public class EcsStats extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Long access_time = null;
	protected java.lang.String ip_address = null;
	protected java.lang.Integer visit_times = null;
	protected java.lang.String browser = null;
	protected java.lang.String system = null;
	protected java.lang.String language = null;
	protected java.lang.String area = null;
	protected java.lang.String referer_domain = null;
	protected java.lang.String referer_path = null;
	protected java.lang.String access_url = null;
	protected String [] _fields = new String[]{"access_time","ip_address","visit_times","browser","system","language","area","referer_domain","referer_path","access_url"};

	public EcsStats() {
	}
	public String getTableName() {
		return "ecs_stats";
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
	public java.lang.Long getAccess_time() {
		return access_time;
	}
	public void setAccess_time(java.lang.Long access_time) {
		 this.access_time=access_time;
	}
	public java.lang.String getIp_address() {
		return ip_address;
	}
	public void setIp_address(java.lang.String ip_address) {
		 this.ip_address=ip_address;
	}
	public java.lang.Integer getVisit_times() {
		return visit_times;
	}
	public void setVisit_times(java.lang.Integer visit_times) {
		 this.visit_times=visit_times;
	}
	public java.lang.String getBrowser() {
		return browser;
	}
	public void setBrowser(java.lang.String browser) {
		 this.browser=browser;
	}
	public java.lang.String getSystem() {
		return system;
	}
	public void setSystem(java.lang.String system) {
		 this.system=system;
	}
	public java.lang.String getLanguage() {
		return language;
	}
	public void setLanguage(java.lang.String language) {
		 this.language=language;
	}
	public java.lang.String getArea() {
		return area;
	}
	public void setArea(java.lang.String area) {
		 this.area=area;
	}
	public java.lang.String getReferer_domain() {
		return referer_domain;
	}
	public void setReferer_domain(java.lang.String referer_domain) {
		 this.referer_domain=referer_domain;
	}
	public java.lang.String getReferer_path() {
		return referer_path;
	}
	public void setReferer_path(java.lang.String referer_path) {
		 this.referer_path=referer_path;
	}
	public java.lang.String getAccess_url() {
		return access_url;
	}
	public void setAccess_url(java.lang.String access_url) {
		 this.access_url=access_url;
	}
}
