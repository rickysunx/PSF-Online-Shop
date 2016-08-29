package psf.entity;
public class EcsCategory extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer cat_id = null;
	protected java.lang.String cat_name = null;
	protected java.lang.String keywords = null;
	protected java.lang.String cat_desc = null;
	protected java.lang.Integer parent_id = null;
	protected java.lang.Integer sort_order = null;
	protected java.lang.String template_file = null;
	protected java.lang.String measure_unit = null;
	protected java.lang.Integer show_in_nav = null;
	protected java.lang.String style = null;
	protected java.lang.Integer is_show = null;
	protected java.lang.Integer grade = null;
	protected java.lang.String filter_attr = null;
	protected String [] _fields = new String[]{"cat_id","cat_name","keywords","cat_desc","parent_id","sort_order","template_file","measure_unit","show_in_nav","style","is_show","grade","filter_attr"};

	public EcsCategory() {
	}
	public String getTableName() {
		return "ecs_category";
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
	public java.lang.Integer getParent_id() {
		return parent_id;
	}
	public void setParent_id(java.lang.Integer parent_id) {
		 this.parent_id=parent_id;
	}
	public java.lang.Integer getSort_order() {
		return sort_order;
	}
	public void setSort_order(java.lang.Integer sort_order) {
		 this.sort_order=sort_order;
	}
	public java.lang.String getTemplate_file() {
		return template_file;
	}
	public void setTemplate_file(java.lang.String template_file) {
		 this.template_file=template_file;
	}
	public java.lang.String getMeasure_unit() {
		return measure_unit;
	}
	public void setMeasure_unit(java.lang.String measure_unit) {
		 this.measure_unit=measure_unit;
	}
	public java.lang.Integer getShow_in_nav() {
		return show_in_nav;
	}
	public void setShow_in_nav(java.lang.Integer show_in_nav) {
		 this.show_in_nav=show_in_nav;
	}
	public java.lang.String getStyle() {
		return style;
	}
	public void setStyle(java.lang.String style) {
		 this.style=style;
	}
	public java.lang.Integer getIs_show() {
		return is_show;
	}
	public void setIs_show(java.lang.Integer is_show) {
		 this.is_show=is_show;
	}
	public java.lang.Integer getGrade() {
		return grade;
	}
	public void setGrade(java.lang.Integer grade) {
		 this.grade=grade;
	}
	public java.lang.String getFilter_attr() {
		return filter_attr;
	}
	public void setFilter_attr(java.lang.String filter_attr) {
		 this.filter_attr=filter_attr;
	}
}
