package psf.entity;
public class EcsOrderInfo extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer order_id = null;
	protected java.lang.String order_sn = null;
	protected java.lang.Integer user_id = null;
	protected java.lang.Integer order_status = null;
	protected java.lang.Integer shipping_status = null;
	protected java.lang.Integer pay_status = null;
	protected java.lang.String consignee = null;
	protected java.lang.Integer country = null;
	protected java.lang.Integer province = null;
	protected java.lang.Integer city = null;
	protected java.lang.Integer district = null;
	protected java.lang.String address = null;
	protected java.lang.String zipcode = null;
	protected java.lang.String tel = null;
	protected java.lang.String mobile = null;
	protected java.lang.String email = null;
	protected java.lang.String best_time = null;
	protected java.lang.String sign_building = null;
	protected java.lang.String postscript = null;
	protected java.lang.Integer shipping_id = null;
	protected java.lang.String shipping_name = null;
	protected java.lang.Integer pay_id = null;
	protected java.lang.String pay_name = null;
	protected java.lang.String how_oos = null;
	protected java.lang.String how_surplus = null;
	protected java.lang.String pack_name = null;
	protected java.lang.String card_name = null;
	protected java.lang.String card_message = null;
	protected java.lang.String inv_payee = null;
	protected java.lang.String inv_content = null;
	protected java.math.BigDecimal goods_amount = null;
	protected java.math.BigDecimal shipping_fee = null;
	protected java.math.BigDecimal insure_fee = null;
	protected java.math.BigDecimal pay_fee = null;
	protected java.math.BigDecimal pack_fee = null;
	protected java.math.BigDecimal card_fee = null;
	protected java.math.BigDecimal money_paid = null;
	protected java.math.BigDecimal surplus = null;
	protected java.lang.Long integral = null;
	protected java.math.BigDecimal integral_money = null;
	protected java.math.BigDecimal bonus = null;
	protected java.math.BigDecimal order_amount = null;
	protected java.lang.Integer from_ad = null;
	protected java.lang.String referer = null;
	protected java.lang.Long add_time = null;
	protected java.lang.Long confirm_time = null;
	protected java.lang.Long pay_time = null;
	protected java.lang.Long shipping_time = null;
	protected java.lang.Integer pack_id = null;
	protected java.lang.Integer card_id = null;
	protected java.lang.Integer bonus_id = null;
	protected java.lang.String invoice_no = null;
	protected java.lang.String extension_code = null;
	protected java.lang.Integer extension_id = null;
	protected java.lang.String to_buyer = null;
	protected java.lang.String pay_note = null;
	protected java.lang.Integer agency_id = null;
	protected java.lang.String inv_type = null;
	protected java.math.BigDecimal tax = null;
	protected java.lang.Integer is_separate = null;
	protected java.lang.Integer parent_id = null;
	protected java.math.BigDecimal discount = null;
	protected String [] _fields = new String[]{"order_id","order_sn","user_id","order_status","shipping_status","pay_status","consignee","country","province","city","district","address","zipcode","tel","mobile","email","best_time","sign_building","postscript","shipping_id","shipping_name","pay_id","pay_name","how_oos","how_surplus","pack_name","card_name","card_message","inv_payee","inv_content","goods_amount","shipping_fee","insure_fee","pay_fee","pack_fee","card_fee","money_paid","surplus","integral","integral_money","bonus","order_amount","from_ad","referer","add_time","confirm_time","pay_time","shipping_time","pack_id","card_id","bonus_id","invoice_no","extension_code","extension_id","to_buyer","pay_note","agency_id","inv_type","tax","is_separate","parent_id","discount"};

	public EcsOrderInfo() {
	}
	public String getTableName() {
		return "ecs_order_info";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "order_id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getOrder_id() {
		return order_id;
	}
	public void setOrder_id(java.lang.Integer order_id) {
		 this.order_id=order_id;
	}
	public java.lang.String getOrder_sn() {
		return order_sn;
	}
	public void setOrder_sn(java.lang.String order_sn) {
		 this.order_sn=order_sn;
	}
	public java.lang.Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(java.lang.Integer user_id) {
		 this.user_id=user_id;
	}
	public java.lang.Integer getOrder_status() {
		return order_status;
	}
	public void setOrder_status(java.lang.Integer order_status) {
		 this.order_status=order_status;
	}
	public java.lang.Integer getShipping_status() {
		return shipping_status;
	}
	public void setShipping_status(java.lang.Integer shipping_status) {
		 this.shipping_status=shipping_status;
	}
	public java.lang.Integer getPay_status() {
		return pay_status;
	}
	public void setPay_status(java.lang.Integer pay_status) {
		 this.pay_status=pay_status;
	}
	public java.lang.String getConsignee() {
		return consignee;
	}
	public void setConsignee(java.lang.String consignee) {
		 this.consignee=consignee;
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
	public java.lang.String getEmail() {
		return email;
	}
	public void setEmail(java.lang.String email) {
		 this.email=email;
	}
	public java.lang.String getBest_time() {
		return best_time;
	}
	public void setBest_time(java.lang.String best_time) {
		 this.best_time=best_time;
	}
	public java.lang.String getSign_building() {
		return sign_building;
	}
	public void setSign_building(java.lang.String sign_building) {
		 this.sign_building=sign_building;
	}
	public java.lang.String getPostscript() {
		return postscript;
	}
	public void setPostscript(java.lang.String postscript) {
		 this.postscript=postscript;
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
	public java.lang.Integer getPay_id() {
		return pay_id;
	}
	public void setPay_id(java.lang.Integer pay_id) {
		 this.pay_id=pay_id;
	}
	public java.lang.String getPay_name() {
		return pay_name;
	}
	public void setPay_name(java.lang.String pay_name) {
		 this.pay_name=pay_name;
	}
	public java.lang.String getHow_oos() {
		return how_oos;
	}
	public void setHow_oos(java.lang.String how_oos) {
		 this.how_oos=how_oos;
	}
	public java.lang.String getHow_surplus() {
		return how_surplus;
	}
	public void setHow_surplus(java.lang.String how_surplus) {
		 this.how_surplus=how_surplus;
	}
	public java.lang.String getPack_name() {
		return pack_name;
	}
	public void setPack_name(java.lang.String pack_name) {
		 this.pack_name=pack_name;
	}
	public java.lang.String getCard_name() {
		return card_name;
	}
	public void setCard_name(java.lang.String card_name) {
		 this.card_name=card_name;
	}
	public java.lang.String getCard_message() {
		return card_message;
	}
	public void setCard_message(java.lang.String card_message) {
		 this.card_message=card_message;
	}
	public java.lang.String getInv_payee() {
		return inv_payee;
	}
	public void setInv_payee(java.lang.String inv_payee) {
		 this.inv_payee=inv_payee;
	}
	public java.lang.String getInv_content() {
		return inv_content;
	}
	public void setInv_content(java.lang.String inv_content) {
		 this.inv_content=inv_content;
	}
	public java.math.BigDecimal getGoods_amount() {
		return goods_amount;
	}
	public void setGoods_amount(java.math.BigDecimal goods_amount) {
		 this.goods_amount=goods_amount;
	}
	public java.math.BigDecimal getShipping_fee() {
		return shipping_fee;
	}
	public void setShipping_fee(java.math.BigDecimal shipping_fee) {
		 this.shipping_fee=shipping_fee;
	}
	public java.math.BigDecimal getInsure_fee() {
		return insure_fee;
	}
	public void setInsure_fee(java.math.BigDecimal insure_fee) {
		 this.insure_fee=insure_fee;
	}
	public java.math.BigDecimal getPay_fee() {
		return pay_fee;
	}
	public void setPay_fee(java.math.BigDecimal pay_fee) {
		 this.pay_fee=pay_fee;
	}
	public java.math.BigDecimal getPack_fee() {
		return pack_fee;
	}
	public void setPack_fee(java.math.BigDecimal pack_fee) {
		 this.pack_fee=pack_fee;
	}
	public java.math.BigDecimal getCard_fee() {
		return card_fee;
	}
	public void setCard_fee(java.math.BigDecimal card_fee) {
		 this.card_fee=card_fee;
	}
	public java.math.BigDecimal getMoney_paid() {
		return money_paid;
	}
	public void setMoney_paid(java.math.BigDecimal money_paid) {
		 this.money_paid=money_paid;
	}
	public java.math.BigDecimal getSurplus() {
		return surplus;
	}
	public void setSurplus(java.math.BigDecimal surplus) {
		 this.surplus=surplus;
	}
	public java.lang.Long getIntegral() {
		return integral;
	}
	public void setIntegral(java.lang.Long integral) {
		 this.integral=integral;
	}
	public java.math.BigDecimal getIntegral_money() {
		return integral_money;
	}
	public void setIntegral_money(java.math.BigDecimal integral_money) {
		 this.integral_money=integral_money;
	}
	public java.math.BigDecimal getBonus() {
		return bonus;
	}
	public void setBonus(java.math.BigDecimal bonus) {
		 this.bonus=bonus;
	}
	public java.math.BigDecimal getOrder_amount() {
		return order_amount;
	}
	public void setOrder_amount(java.math.BigDecimal order_amount) {
		 this.order_amount=order_amount;
	}
	public java.lang.Integer getFrom_ad() {
		return from_ad;
	}
	public void setFrom_ad(java.lang.Integer from_ad) {
		 this.from_ad=from_ad;
	}
	public java.lang.String getReferer() {
		return referer;
	}
	public void setReferer(java.lang.String referer) {
		 this.referer=referer;
	}
	public java.lang.Long getAdd_time() {
		return add_time;
	}
	public void setAdd_time(java.lang.Long add_time) {
		 this.add_time=add_time;
	}
	public java.lang.Long getConfirm_time() {
		return confirm_time;
	}
	public void setConfirm_time(java.lang.Long confirm_time) {
		 this.confirm_time=confirm_time;
	}
	public java.lang.Long getPay_time() {
		return pay_time;
	}
	public void setPay_time(java.lang.Long pay_time) {
		 this.pay_time=pay_time;
	}
	public java.lang.Long getShipping_time() {
		return shipping_time;
	}
	public void setShipping_time(java.lang.Long shipping_time) {
		 this.shipping_time=shipping_time;
	}
	public java.lang.Integer getPack_id() {
		return pack_id;
	}
	public void setPack_id(java.lang.Integer pack_id) {
		 this.pack_id=pack_id;
	}
	public java.lang.Integer getCard_id() {
		return card_id;
	}
	public void setCard_id(java.lang.Integer card_id) {
		 this.card_id=card_id;
	}
	public java.lang.Integer getBonus_id() {
		return bonus_id;
	}
	public void setBonus_id(java.lang.Integer bonus_id) {
		 this.bonus_id=bonus_id;
	}
	public java.lang.String getInvoice_no() {
		return invoice_no;
	}
	public void setInvoice_no(java.lang.String invoice_no) {
		 this.invoice_no=invoice_no;
	}
	public java.lang.String getExtension_code() {
		return extension_code;
	}
	public void setExtension_code(java.lang.String extension_code) {
		 this.extension_code=extension_code;
	}
	public java.lang.Integer getExtension_id() {
		return extension_id;
	}
	public void setExtension_id(java.lang.Integer extension_id) {
		 this.extension_id=extension_id;
	}
	public java.lang.String getTo_buyer() {
		return to_buyer;
	}
	public void setTo_buyer(java.lang.String to_buyer) {
		 this.to_buyer=to_buyer;
	}
	public java.lang.String getPay_note() {
		return pay_note;
	}
	public void setPay_note(java.lang.String pay_note) {
		 this.pay_note=pay_note;
	}
	public java.lang.Integer getAgency_id() {
		return agency_id;
	}
	public void setAgency_id(java.lang.Integer agency_id) {
		 this.agency_id=agency_id;
	}
	public java.lang.String getInv_type() {
		return inv_type;
	}
	public void setInv_type(java.lang.String inv_type) {
		 this.inv_type=inv_type;
	}
	public java.math.BigDecimal getTax() {
		return tax;
	}
	public void setTax(java.math.BigDecimal tax) {
		 this.tax=tax;
	}
	public java.lang.Integer getIs_separate() {
		return is_separate;
	}
	public void setIs_separate(java.lang.Integer is_separate) {
		 this.is_separate=is_separate;
	}
	public java.lang.Integer getParent_id() {
		return parent_id;
	}
	public void setParent_id(java.lang.Integer parent_id) {
		 this.parent_id=parent_id;
	}
	public java.math.BigDecimal getDiscount() {
		return discount;
	}
	public void setDiscount(java.math.BigDecimal discount) {
		 this.discount=discount;
	}
}
