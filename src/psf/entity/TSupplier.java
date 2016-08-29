package psf.entity;
public class TSupplier extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer supplierid = null;
	protected java.lang.String suppliercode = null;
	protected java.lang.String suppliername = null;
	protected java.lang.Integer expresszoneid = null;
	protected java.lang.String phone1 = null;
	protected java.lang.String phone2 = null;
	protected java.lang.String fax1 = null;
	protected java.lang.String fax2 = null;
	protected java.lang.String email = null;
	protected java.lang.String manager = null;
	protected java.lang.String person1 = null;
	protected java.lang.String person2 = null;
	protected java.lang.String taobaoid = null;
	protected String [] _fields = new String[]{"supplierid","suppliercode","suppliername","expresszoneid","phone1","phone2","fax1","fax2","email","manager","person1","person2","taobaoid"};

	public TSupplier() {
	}
	public String getTableName() {
		return "t_supplier";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "supplierid";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getSupplierid() {
		return supplierid;
	}
	public void setSupplierid(java.lang.Integer supplierid) {
		 this.supplierid=supplierid;
	}
	public java.lang.String getSuppliercode() {
		return suppliercode;
	}
	public void setSuppliercode(java.lang.String suppliercode) {
		 this.suppliercode=suppliercode;
	}
	public java.lang.String getSuppliername() {
		return suppliername;
	}
	public void setSuppliername(java.lang.String suppliername) {
		 this.suppliername=suppliername;
	}
	public java.lang.Integer getExpresszoneid() {
		return expresszoneid;
	}
	public void setExpresszoneid(java.lang.Integer expresszoneid) {
		 this.expresszoneid=expresszoneid;
	}
	public java.lang.String getPhone1() {
		return phone1;
	}
	public void setPhone1(java.lang.String phone1) {
		 this.phone1=phone1;
	}
	public java.lang.String getPhone2() {
		return phone2;
	}
	public void setPhone2(java.lang.String phone2) {
		 this.phone2=phone2;
	}
	public java.lang.String getFax1() {
		return fax1;
	}
	public void setFax1(java.lang.String fax1) {
		 this.fax1=fax1;
	}
	public java.lang.String getFax2() {
		return fax2;
	}
	public void setFax2(java.lang.String fax2) {
		 this.fax2=fax2;
	}
	public java.lang.String getEmail() {
		return email;
	}
	public void setEmail(java.lang.String email) {
		 this.email=email;
	}
	public java.lang.String getManager() {
		return manager;
	}
	public void setManager(java.lang.String manager) {
		 this.manager=manager;
	}
	public java.lang.String getPerson1() {
		return person1;
	}
	public void setPerson1(java.lang.String person1) {
		 this.person1=person1;
	}
	public java.lang.String getPerson2() {
		return person2;
	}
	public void setPerson2(java.lang.String person2) {
		 this.person2=person2;
	}
	public java.lang.String getTaobaoid() {
		return taobaoid;
	}
	public void setTaobaoid(java.lang.String taobaoid) {
		 this.taobaoid=taobaoid;
	}
}
