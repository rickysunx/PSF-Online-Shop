package psf.entity;
public class EcsAdCustom extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer ad_id = null;
	protected java.lang.Integer ad_type = null;
	protected java.lang.String ad_name = null;
	protected java.lang.Long add_time = null;
	protected java.lang.String content = null;
	protected java.lang.String url = null;
	protected java.lang.Integer ad_status = null;
	protected String [] _fields = new String[]{"ad_id","ad_type","ad_name","add_time","content","url","ad_status"};

	public EcsAdCustom() {
	}
	public String getTableName() {
		return "ecs_ad_custom";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "ad_id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getAd_id() {
		return ad_id;
	}
	public void setAd_id(java.lang.Integer ad_id) {
		 this.ad_id=ad_id;
	}
	public java.lang.Integer getAd_type() {
		return ad_type;
	}
	public void setAd_type(java.lang.Integer ad_type) {
		 this.ad_type=ad_type;
	}
	public java.lang.String getAd_name() {
		return ad_name;
	}
	public void setAd_name(java.lang.String ad_name) {
		 this.ad_name=ad_name;
	}
	public java.lang.Long getAdd_time() {
		return add_time;
	}
	public void setAdd_time(java.lang.Long add_time) {
		 this.add_time=add_time;
	}
	public java.lang.String getContent() {
		return content;
	}
	public void setContent(java.lang.String content) {
		 this.content=content;
	}
	public java.lang.String getUrl() {
		return url;
	}
	public void setUrl(java.lang.String url) {
		 this.url=url;
	}
	public java.lang.Integer getAd_status() {
		return ad_status;
	}
	public void setAd_status(java.lang.Integer ad_status) {
		 this.ad_status=ad_status;
	}
}
