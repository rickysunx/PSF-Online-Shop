package psf.entity;
public class EcsBrand extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer brand_id = null;
	protected java.lang.String brand_name = null;
	protected java.lang.String brand_logo = null;
	protected java.lang.String brand_desc = null;
	protected java.lang.String site_url = null;
	protected java.lang.Integer sort_order = null;
	protected java.lang.Integer is_show = null;
	protected java.lang.String blog_url = null;
	protected String [] _fields = new String[]{"brand_id","brand_name","brand_logo","brand_desc","site_url","sort_order","is_show","blog_url"};

	public EcsBrand() {
	}
	public String getTableName() {
		return "ecs_brand";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "brand_id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getBrand_id() {
		return brand_id;
	}
	public void setBrand_id(java.lang.Integer brand_id) {
		 this.brand_id=brand_id;
	}
	public java.lang.String getBrand_name() {
		return brand_name;
	}
	public void setBrand_name(java.lang.String brand_name) {
		 this.brand_name=brand_name;
	}
	public java.lang.String getBrand_logo() {
		return brand_logo;
	}
	public void setBrand_logo(java.lang.String brand_logo) {
		 this.brand_logo=brand_logo;
	}
	public java.lang.String getBrand_desc() {
		return brand_desc;
	}
	public void setBrand_desc(java.lang.String brand_desc) {
		 this.brand_desc=brand_desc;
	}
	public java.lang.String getSite_url() {
		return site_url;
	}
	public void setSite_url(java.lang.String site_url) {
		 this.site_url=site_url;
	}
	public java.lang.Integer getSort_order() {
		return sort_order;
	}
	public void setSort_order(java.lang.Integer sort_order) {
		 this.sort_order=sort_order;
	}
	public java.lang.Integer getIs_show() {
		return is_show;
	}
	public void setIs_show(java.lang.Integer is_show) {
		 this.is_show=is_show;
	}
	public java.lang.String getBlog_url() {
		return blog_url;
	}
	public void setBlog_url(java.lang.String blog_url) {
		 this.blog_url=blog_url;
	}
}
