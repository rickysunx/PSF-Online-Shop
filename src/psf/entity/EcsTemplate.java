package psf.entity;
public class EcsTemplate extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.String filename = null;
	protected java.lang.String region = null;
	protected java.lang.String library = null;
	protected java.lang.Integer sort_order = null;
	protected java.lang.Integer id = null;
	protected java.lang.Integer number = null;
	protected java.lang.Integer type = null;
	protected java.lang.String theme = null;
	protected java.lang.String remarks = null;
	protected String [] _fields = new String[]{"filename","region","library","sort_order","id","number","type","theme","remarks"};

	public EcsTemplate() {
	}
	public String getTableName() {
		return "ecs_template";
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
	public java.lang.String getFilename() {
		return filename;
	}
	public void setFilename(java.lang.String filename) {
		 this.filename=filename;
	}
	public java.lang.String getRegion() {
		return region;
	}
	public void setRegion(java.lang.String region) {
		 this.region=region;
	}
	public java.lang.String getLibrary() {
		return library;
	}
	public void setLibrary(java.lang.String library) {
		 this.library=library;
	}
	public java.lang.Integer getSort_order() {
		return sort_order;
	}
	public void setSort_order(java.lang.Integer sort_order) {
		 this.sort_order=sort_order;
	}
	public java.lang.Integer getId() {
		return id;
	}
	public void setId(java.lang.Integer id) {
		 this.id=id;
	}
	public java.lang.Integer getNumber() {
		return number;
	}
	public void setNumber(java.lang.Integer number) {
		 this.number=number;
	}
	public java.lang.Integer getType() {
		return type;
	}
	public void setType(java.lang.Integer type) {
		 this.type=type;
	}
	public java.lang.String getTheme() {
		return theme;
	}
	public void setTheme(java.lang.String theme) {
		 this.theme=theme;
	}
	public java.lang.String getRemarks() {
		return remarks;
	}
	public void setRemarks(java.lang.String remarks) {
		 this.remarks=remarks;
	}
}
