package psf.entity;
public class TProductCate extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer cateid = null;
	protected java.lang.Integer parentid = null;
	protected java.lang.String catename = null;
	protected java.lang.Integer level = null;
	protected String [] _fields = new String[]{"cateid","parentid","catename","level"};

	public TProductCate() {
	}
	public String getTableName() {
		return "t_product_cate";
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
	public java.lang.Integer getCateid() {
		return cateid;
	}
	public void setCateid(java.lang.Integer cateid) {
		 this.cateid=cateid;
	}
	public java.lang.Integer getParentid() {
		return parentid;
	}
	public void setParentid(java.lang.Integer parentid) {
		 this.parentid=parentid;
	}
	public java.lang.String getCatename() {
		return catename;
	}
	public void setCatename(java.lang.String catename) {
		 this.catename=catename;
	}
	public java.lang.Integer getLevel() {
		return level;
	}
	public void setLevel(java.lang.Integer level) {
		 this.level=level;
	}
}
