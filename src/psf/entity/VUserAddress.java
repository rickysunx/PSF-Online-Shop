package psf.entity;
public class VUserAddress extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer user_id = null;
	protected java.lang.Integer address_id = null;
	protected java.lang.String address_name = null;
	protected java.lang.String consignee = null;
	protected java.lang.String email = null;
	protected java.lang.Integer province = null;
	protected java.lang.Integer city = null;
	protected java.lang.Integer district = null;
	protected java.lang.String province_name = null;
	protected java.lang.String city_name = null;
	protected java.lang.String district_name = null;
	protected java.lang.String address = null;
	protected java.lang.String zipcode = null;
	protected java.lang.String tel = null;
	protected java.lang.String mobile = null;
	protected java.lang.Long isdefault = null;
	protected String [] _fields = new String[]{"user_id","address_id","address_name","consignee","email","province","city","district","province_name","city_name","district_name","address","zipcode","tel","mobile","isdefault"};

	public VUserAddress() {
	}
	public String getTableName() {
		return "v_user_address";
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
	public java.lang.Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(java.lang.Integer user_id) {
		 this.user_id=user_id;
	}
	public java.lang.Integer getAddress_id() {
		return address_id;
	}
	public void setAddress_id(java.lang.Integer address_id) {
		 this.address_id=address_id;
	}
	public java.lang.String getAddress_name() {
		return address_name;
	}
	public void setAddress_name(java.lang.String address_name) {
		 this.address_name=address_name;
	}
	public java.lang.String getConsignee() {
		return consignee;
	}
	public void setConsignee(java.lang.String consignee) {
		 this.consignee=consignee;
	}
	public java.lang.String getEmail() {
		return email;
	}
	public void setEmail(java.lang.String email) {
		 this.email=email;
	}
	public java.lang.Integer getProvince() {
		return province;
	}
	public void setProvince(java.lang.Integer province) {
		 this.province=province;
	}
	public java.lang.Integer getCity() {
		return city;
	}
	public void setCity(java.lang.Integer city) {
		 this.city=city;
	}
	public java.lang.Integer getDistrict() {
		return district;
	}
	public void setDistrict(java.lang.Integer district) {
		 this.district=district;
	}
	public java.lang.String getProvince_name() {
		return province_name;
	}
	public void setProvince_name(java.lang.String province_name) {
		 this.province_name=province_name;
	}
	public java.lang.String getCity_name() {
		return city_name;
	}
	public void setCity_name(java.lang.String city_name) {
		 this.city_name=city_name;
	}
	public java.lang.String getDistrict_name() {
		return district_name;
	}
	public void setDistrict_name(java.lang.String district_name) {
		 this.district_name=district_name;
	}
	public java.lang.String getAddress() {
		return address;
	}
	public void setAddress(java.lang.String address) {
		 this.address=address;
	}
	public java.lang.String getZipcode() {
		return zipcode;
	}
	public void setZipcode(java.lang.String zipcode) {
		 this.zipcode=zipcode;
	}
	public java.lang.String getTel() {
		return tel;
	}
	public void setTel(java.lang.String tel) {
		 this.tel=tel;
	}
	public java.lang.String getMobile() {
		return mobile;
	}
	public void setMobile(java.lang.String mobile) {
		 this.mobile=mobile;
	}
	public java.lang.Long getIsdefault() {
		return isdefault;
	}
	public void setIsdefault(java.lang.Long isdefault) {
		 this.isdefault=isdefault;
	}
}
