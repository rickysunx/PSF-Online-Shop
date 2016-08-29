package psf.entity;
public class EcsSuppliersCerts extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer cert_id = null;
	protected java.lang.Integer suppliers_id = null;
	protected java.lang.String cert_name = null;
	protected java.lang.String cert_org = null;
	protected java.sql.Date cert_time = null;
	protected String [] _fields = new String[]{"cert_id","suppliers_id","cert_name","cert_org","cert_time"};

	public EcsSuppliersCerts() {
	}
	public String getTableName() {
		return "ecs_suppliers_certs";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "cert_id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getCert_id() {
		return cert_id;
	}
	public void setCert_id(java.lang.Integer cert_id) {
		 this.cert_id=cert_id;
	}
	public java.lang.Integer getSuppliers_id() {
		return suppliers_id;
	}
	public void setSuppliers_id(java.lang.Integer suppliers_id) {
		 this.suppliers_id=suppliers_id;
	}
	public java.lang.String getCert_name() {
		return cert_name;
	}
	public void setCert_name(java.lang.String cert_name) {
		 this.cert_name=cert_name;
	}
	public java.lang.String getCert_org() {
		return cert_org;
	}
	public void setCert_org(java.lang.String cert_org) {
		 this.cert_org=cert_org;
	}
	public java.sql.Date getCert_time() {
		return cert_time;
	}
	public void setCert_time(java.sql.Date cert_time) {
		 this.cert_time=cert_time;
	}
}
