package psf.entity;
public class TBrand extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer brandid = null;
	protected java.lang.String brandname = null;
	protected java.lang.String brandlogo = null;
	protected String [] _fields = new String[]{"brandid","brandname","brandlogo"};

	public TBrand() {
	}
	public String getTableName() {
		return "t_brand";
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
	public java.lang.Integer getBrandid() {
		return brandid;
	}
	public void setBrandid(java.lang.Integer brandid) {
		 this.brandid=brandid;
	}
	public java.lang.String getBrandname() {
		return brandname;
	}
	public void setBrandname(java.lang.String brandname) {
		 this.brandname=brandname;
	}
	public java.lang.String getBrandlogo() {
		return brandlogo;
	}
	public void setBrandlogo(java.lang.String brandlogo) {
		 this.brandlogo=brandlogo;
	}
}
