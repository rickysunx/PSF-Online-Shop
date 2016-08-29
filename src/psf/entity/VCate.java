package psf.entity;
public class VCate extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer cat_id_1 = null;
	protected java.lang.Integer cat_id_2 = null;
	protected java.lang.Integer cat_id = null;
	protected java.lang.String cat_name_1 = null;
	protected java.lang.String cat_name_2 = null;
	protected java.lang.String cat_name = null;
	protected String [] _fields = new String[]{"cat_id_1","cat_id_2","cat_id","cat_name_1","cat_name_2","cat_name"};

	public VCate() {
	}
	public String getTableName() {
		return "v_cate";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "null";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getCat_id_1() {
		return cat_id_1;
	}
	public void setCat_id_1(java.lang.Integer cat_id_1) {
		 this.cat_id_1=cat_id_1;
	}
	public java.lang.Integer getCat_id_2() {
		return cat_id_2;
	}
	public void setCat_id_2(java.lang.Integer cat_id_2) {
		 this.cat_id_2=cat_id_2;
	}
	public java.lang.Integer getCat_id() {
		return cat_id;
	}
	public void setCat_id(java.lang.Integer cat_id) {
		 this.cat_id=cat_id;
	}
	public java.lang.String getCat_name_1() {
		return cat_name_1;
	}
	public void setCat_name_1(java.lang.String cat_name_1) {
		 this.cat_name_1=cat_name_1;
	}
	public java.lang.String getCat_name_2() {
		return cat_name_2;
	}
	public void setCat_name_2(java.lang.String cat_name_2) {
		 this.cat_name_2=cat_name_2;
	}
	public java.lang.String getCat_name() {
		return cat_name;
	}
	public void setCat_name(java.lang.String cat_name) {
		 this.cat_name=cat_name;
	}
}
