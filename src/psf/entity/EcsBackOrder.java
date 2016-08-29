package psf.entity;
public class EcsBackOrder extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer back_id = null;
	protected java.lang.String delivery_sn = null;
	protected java.lang.String order_sn = null;
	protected java.lang.Integer order_id = null;
	protected java.lang.String invoice_no = null;
	protected java.lang.Long add_time = null;
	protected java.lang.Integer shipping_id = null;
	protected java.lang.String shipping_name = null;
	protected java.lang.Integer user_id = null;
	protected java.lang.String action_user = null;
	protected java.lang.String consignee = null;
	protected java.lang.String address = null;
	protected java.lang.Integer country = null;
	protected java.lang.Integer province = null;
	protected java.lang.Integer city = null;
	protected java.lang.Integer district = null;
	protected java.lang.String sign_building = null;
	protected java.lang.String email = null;
	protected java.lang.String zipcode = null;
	protected java.lang.String tel = null;
	protected java.lang.String mobile = null;
	protected java.lang.String best_time = null;
	protected java.lang.String postscript = null;
	protected java.lang.String how_oos = null;
	protected java.math.BigDecimal insure_fee = null;
	protected java.math.BigDecimal shipping_fee = null;
	protected java.lang.Long update_time = null;
	protected java.lang.Integer suppliers_id = null;
	protected java.lang.Integer status = null;
	protected java.lang.Long return_time = null;
	protected java.lang.Integer agency_id = null;
	protected String [] _fields = new String[]{"back_id","delivery_sn","order_sn","order_id","invoice_no","add_time","shipping_id","shipping_name","user_id","action_user","consignee","address","country","province","city","district","sign_building","email","zipcode","tel","mobile","best_time","postscript","how_oos","insure_fee","shipping_fee","update_time","suppliers_id","status","return_time","agency_id"};

	public EcsBackOrder() {
	}
	public String getTableName() {
		return "ecs_back_order";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "back_id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getBack_id() {
		return back_id;
	}
	public void setBack_id(java.lang.Integer back_id) {
		 this.back_id=back_id;
	}
	public java.lang.String getDelivery_sn() {
		return delivery_sn;
	}
	public void setDelivery_sn(java.lang.String delivery_sn) {
		 this.delivery_sn=delivery_sn;
	}
	public java.lang.String getOrder_sn() {
		return order_sn;
	}
	public void setOrder_sn(java.lang.String order_sn) {
		 this.order_sn=order_sn;
	}
	public java.lang.Integer getOrder_id() {
		return order_id;
	}
	public void setOrder_id(java.lang.Integer order_id) {
		 this.order_id=order_id;
	}
	public java.lang.String getInvoice_no() {
		return invoice_no;
	}
	public void setInvoice_no(java.lang.String invoice_no) {
		 this.invoice_no=invoice_no;
	}
	public java.lang.Long getAdd_time() {
		return add_time;
	}
	public void setAdd_time(java.lang.Long add_time) {
		 this.add_time=add_time;
	}
	public java.lang.Integer getShipping_id() {
		return shipping_id;
	}
	public void setShipping_id(java.lang.Integer shipping_id) {
		 this.shipping_id=shipping_id;
	}
	public java.lang.String getShipping_name() {
		return shipping_name;
	}
	public void setShipping_name(java.lang.String shipping_name) {
		 this.shipping_name=shipping_name;
	}
	public java.lang.Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(java.lang.Integer user_id) {
		 this.user_id=user_id;
	}
	public java.lang.String getAction_user() {
		return action_user;
	}
	public void setAction_user(java.lang.String action_user) {
		 this.action_user=action_user;
	}
	public java.lang.String getConsignee() {
		return consignee;
	}
	public void setConsignee(java.lang.String consignee) {
		 this.consignee=consignee;
	}
	public java.lang.String getAddress() {
		return address;
	}
	public void setAddress(java.lang.String address) {
		 this.address=address;
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
	public java.lang.String getSign_building() {
		return sign_building;
	}
	public void setSign_building(java.lang.String sign_building) {
		 this.sign_building=sign_building;
	}
	public java.lang.String getEmail() {
		return email;
	}
	public void setEmail(java.lang.String email) {
		 this.email=email;
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
	public java.lang.String getBest_time() {
		return best_time;
	}
	public void setBest_time(java.lang.String best_time) {
		 this.best_time=best_time;
	}
	public java.lang.String getPostscript() {
		return postscript;
	}
	public void setPostscript(java.lang.String postscript) {
		 this.postscript=postscript;
	}
	public java.lang.String getHow_oos() {
		return how_oos;
	}
	public void setHow_oos(java.lang.String how_oos) {
		 this.how_oos=how_oos;
	}
	public java.math.BigDecimal getInsure_fee() {
		return insure_fee;
	}
	public void setInsure_fee(java.math.BigDecimal insure_fee) {
		 this.insure_fee=insure_fee;
	}
	public java.math.BigDecimal getShipping_fee() {
		return shipping_fee;
	}
	public void setShipping_fee(java.math.BigDecimal shipping_fee) {
		 this.shipping_fee=shipping_fee;
	}
	public java.lang.Long getUpdate_time() {
		return update_time;
	}
	public void setUpdate_time(java.lang.Long update_time) {
		 this.update_time=update_time;
	}
	public java.lang.Integer getSuppliers_id() {
		return suppliers_id;
	}
	public void setSuppliers_id(java.lang.Integer suppliers_id) {
		 this.suppliers_id=suppliers_id;
	}
	public java.lang.Integer getStatus() {
		return status;
	}
	public void setStatus(java.lang.Integer status) {
		 this.status=status;
	}
	public java.lang.Long getReturn_time() {
		return return_time;
	}
	public void setReturn_time(java.lang.Long return_time) {
		 this.return_time=return_time;
	}
	public java.lang.Integer getAgency_id() {
		return agency_id;
	}
	public void setAgency_id(java.lang.Integer agency_id) {
		 this.agency_id=agency_id;
	}
}
