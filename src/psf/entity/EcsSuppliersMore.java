package psf.entity;
public class EcsSuppliersMore extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer suppliers_id = null;
	protected java.lang.String suppliers_name = null;
	protected java.lang.String suppliers_desc = null;
	protected java.lang.Integer is_check = null;
	protected java.lang.Integer buyers_id = null;
	protected java.lang.String suppliers_type = null;
	protected java.lang.String suppliers_license = null;
	protected java.lang.String suppliers_boss = null;
	protected java.lang.String suppliers_address = null;
	protected java.lang.String suppliers_phone = null;
	protected java.lang.String suppliers_mobile = null;
	protected String [] _fields = new String[]{"suppliers_id","suppliers_name","suppliers_desc","is_check","buyers_id","suppliers_type","suppliers_license","suppliers_boss","suppliers_address","suppliers_phone","suppliers_mobile"};

	public EcsSuppliersMore() {
	}
	public String getTableName() {
		return "ecs_suppliers_more";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "suppliers_id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getSuppliers_id() {
		return suppliers_id;
	}
	public void setSuppliers_id(java.lang.Integer suppliers_id) {
		 this.suppliers_id=suppliers_id;
	}
	public java.lang.String getSuppliers_name() {
		return suppliers_name;
	}
	public void setSuppliers_name(java.lang.String suppliers_name) {
		 this.suppliers_name=suppliers_name;
	}
	public java.lang.String getSuppliers_desc() {
		return suppliers_desc;
	}
	public void setSuppliers_desc(java.lang.String suppliers_desc) {
		 this.suppliers_desc=suppliers_desc;
	}
	public java.lang.Integer getIs_check() {
		return is_check;
	}
	public void setIs_check(java.lang.Integer is_check) {
		 this.is_check=is_check;
	}
	public java.lang.Integer getBuyers_id() {
		return buyers_id;
	}
	public void setBuyers_id(java.lang.Integer buyers_id) {
		 this.buyers_id=buyers_id;
	}
	public java.lang.String getSuppliers_type() {
		return suppliers_type;
	}
	public void setSuppliers_type(java.lang.String suppliers_type) {
		 this.suppliers_type=suppliers_type;
	}
	public java.lang.String getSuppliers_license() {
		return suppliers_license;
	}
	public void setSuppliers_license(java.lang.String suppliers_license) {
		 this.suppliers_license=suppliers_license;
	}
	public java.lang.String getSuppliers_boss() {
		return suppliers_boss;
	}
	public void setSuppliers_boss(java.lang.String suppliers_boss) {
		 this.suppliers_boss=suppliers_boss;
	}
	public java.lang.String getSuppliers_address() {
		return suppliers_address;
	}
	public void setSuppliers_address(java.lang.String suppliers_address) {
		 this.suppliers_address=suppliers_address;
	}
	public java.lang.String getSuppliers_phone() {
		return suppliers_phone;
	}
	public void setSuppliers_phone(java.lang.String suppliers_phone) {
		 this.suppliers_phone=suppliers_phone;
	}
	public java.lang.String getSuppliers_mobile() {
		return suppliers_mobile;
	}
	public void setSuppliers_mobile(java.lang.String suppliers_mobile) {
		 this.suppliers_mobile=suppliers_mobile;
	}
}
