package psf.entity;
public class EcsUserAddress extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer address_id = null;
	protected java.lang.String address_name = null;
	protected java.lang.Integer user_id = null;
	protected java.lang.String consignee = null;
	protected java.lang.String email = null;
	protected java.lang.Integer country = null;
	protected java.lang.Integer province = null;
	protected java.lang.Integer city = null;
	protected java.lang.Integer district = null;
	protected java.lang.String address = null;
	protected java.lang.String zipcode = null;
	protected java.lang.String tel = null;
	protected java.lang.String mobile = null;
	protected java.lang.String sign_building = null;
	protected java.lang.String best_time = null;
	protected String [] _fields = new String[]{"address_id","address_name","user_id","consignee","email","country","province","city","district","address","zipcode","tel","mobile","sign_building","best_time"};

	public EcsUserAddress() {
	}
	public String getTableName() {
		return "ecs_user_address";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "address_id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
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
	public java.lang.Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(java.lang.Integer user_id) {
		 this.user_id=user_id;
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
	public java.lang.Integer getCountry() {
		return country;
	}
	public void setCountry(java.lang.Integer country) {
		 this.country=country;
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
	public java.lang.String getSign_building() {
		return sign_building;
	}
	public void setSign_building(java.lang.String sign_building) {
		 this.sign_building=sign_building;
	}
	public java.lang.String getBest_time() {
		return best_time;
	}
	public void setBest_time(java.lang.String best_time) {
		 this.best_time=best_time;
	}
}
