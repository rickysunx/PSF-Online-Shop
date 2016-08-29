package psf.entity;
public class TUserAddress extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer addressid = null;
	protected java.lang.Integer uid = null;
	protected java.lang.Integer isdefault = null;
	protected java.lang.Integer expresszoneid = null;
	protected java.lang.String phone1 = null;
	protected java.lang.String phone2 = null;
	protected java.lang.String consignee = null;
	protected java.lang.String address = null;
	protected String [] _fields = new String[]{"addressid","uid","isdefault","expresszoneid","phone1","phone2","consignee","address"};

	public TUserAddress() {
	}
	public String getTableName() {
		return "t_user_address";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "addressid";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getAddressid() {
		return addressid;
	}
	public void setAddressid(java.lang.Integer addressid) {
		 this.addressid=addressid;
	}
	public java.lang.Integer getUid() {
		return uid;
	}
	public void setUid(java.lang.Integer uid) {
		 this.uid=uid;
	}
	public java.lang.Integer getIsdefault() {
		return isdefault;
	}
	public void setIsdefault(java.lang.Integer isdefault) {
		 this.isdefault=isdefault;
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
}
