package psf.entity;
public class TPostBrand extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer postid = null;
	protected java.lang.Integer brandid = null;
	protected String [] _fields = new String[]{"postid","brandid"};

	public TPostBrand() {
	}
	public String getTableName() {
		return "t_post_brand";
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
	public java.lang.Integer getPostid() {
		return postid;
	}
	public void setPostid(java.lang.Integer postid) {
		 this.postid=postid;
	}
	public java.lang.Integer getBrandid() {
		return brandid;
	}
	public void setBrandid(java.lang.Integer brandid) {
		 this.brandid=brandid;
	}
}
