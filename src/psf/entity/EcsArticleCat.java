package psf.entity;
public class EcsArticleCat extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer cat_id = null;
	protected java.lang.String cat_name = null;
	protected java.lang.Integer cat_type = null;
	protected java.lang.String keywords = null;
	protected java.lang.String cat_desc = null;
	protected java.lang.Integer sort_order = null;
	protected java.lang.Integer show_in_nav = null;
	protected java.lang.Integer parent_id = null;
	protected String [] _fields = new String[]{"cat_id","cat_name","cat_type","keywords","cat_desc","sort_order","show_in_nav","parent_id"};

	public EcsArticleCat() {
	}
	public String getTableName() {
		return "ecs_article_cat";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "cat_id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getCat_id() {
		return cat_id;
	}
	public void setCat_id(java.lang.Integer cat_id) {
		 this.cat_id=cat_id;
	}
	public java.lang.String getCat_name() {
		return cat_name;
	}
	public void setCat_name(java.lang.String cat_name) {
		 this.cat_name=cat_name;
	}
	public java.lang.Integer getCat_type() {
		return cat_type;
	}
	public void setCat_type(java.lang.Integer cat_type) {
		 this.cat_type=cat_type;
	}
	public java.lang.String getKeywords() {
		return keywords;
	}
	public void setKeywords(java.lang.String keywords) {
		 this.keywords=keywords;
	}
	public java.lang.String getCat_desc() {
		return cat_desc;
	}
	public void setCat_desc(java.lang.String cat_desc) {
		 this.cat_desc=cat_desc;
	}
	public java.lang.Integer getSort_order() {
		return sort_order;
	}
	public void setSort_order(java.lang.Integer sort_order) {
		 this.sort_order=sort_order;
	}
	public java.lang.Integer getShow_in_nav() {
		return show_in_nav;
	}
	public void setShow_in_nav(java.lang.Integer show_in_nav) {
		 this.show_in_nav=show_in_nav;
	}
	public java.lang.Integer getParent_id() {
		return parent_id;
	}
	public void setParent_id(java.lang.Integer parent_id) {
		 this.parent_id=parent_id;
	}
}
