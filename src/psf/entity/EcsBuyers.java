package psf.entity;
public class EcsBuyers extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer id = null;
	protected java.lang.Integer job_id = null;
	protected java.lang.String name = null;
	protected java.lang.String sfz_id = null;
	protected java.lang.String address = null;
	protected java.lang.String email = null;
	protected java.lang.String phone = null;
	protected java.lang.String mobile = null;
	protected java.lang.String other = null;
	protected String [] _fields = new String[]{"id","job_id","name","sfz_id","address","email","phone","mobile","other"};

	public EcsBuyers() {
	}
	public String getTableName() {
		return "ecs_buyers";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getId() {
		return id;
	}
	public void setId(java.lang.Integer id) {
		 this.id=id;
	}
	public java.lang.Integer getJob_id() {
		return job_id;
	}
	public void setJob_id(java.lang.Integer job_id) {
		 this.job_id=job_id;
	}
	public java.lang.String getName() {
		return name;
	}
	public void setName(java.lang.String name) {
		 this.name=name;
	}
	public java.lang.String getSfz_id() {
		return sfz_id;
	}
	public void setSfz_id(java.lang.String sfz_id) {
		 this.sfz_id=sfz_id;
	}
	public java.lang.String getAddress() {
		return address;
	}
	public void setAddress(java.lang.String address) {
		 this.address=address;
	}
	public java.lang.String getEmail() {
		return email;
	}
	public void setEmail(java.lang.String email) {
		 this.email=email;
	}
	public java.lang.String getPhone() {
		return phone;
	}
	public void setPhone(java.lang.String phone) {
		 this.phone=phone;
	}
	public java.lang.String getMobile() {
		return mobile;
	}
	public void setMobile(java.lang.String mobile) {
		 this.mobile=mobile;
	}
	public java.lang.String getOther() {
		return other;
	}
	public void setOther(java.lang.String other) {
		 this.other=other;
	}
}
