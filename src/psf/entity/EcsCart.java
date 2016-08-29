package psf.entity;
public class EcsCart extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer rec_id = null;
	protected java.lang.Integer user_id = null;
	protected java.lang.String session_id = null;
	protected java.lang.Integer goods_id = null;
	protected java.lang.String goods_sn = null;
	protected java.lang.Integer product_id = null;
	protected java.lang.String goods_name = null;
	protected java.math.BigDecimal market_price = null;
	protected java.math.BigDecimal goods_price = null;
	protected java.lang.Integer goods_number = null;
	protected java.lang.String goods_attr = null;
	protected java.lang.Integer is_real = null;
	protected java.lang.String extension_code = null;
	protected java.lang.Integer parent_id = null;
	protected java.lang.Integer rec_type = null;
	protected java.lang.Integer is_gift = null;
	protected java.lang.Integer is_shipping = null;
	protected java.lang.Integer can_handsel = null;
	protected java.lang.String goods_attr_id = null;
	protected String [] _fields = new String[]{"rec_id","user_id","session_id","goods_id","goods_sn","product_id","goods_name","market_price","goods_price","goods_number","goods_attr","is_real","extension_code","parent_id","rec_type","is_gift","is_shipping","can_handsel","goods_attr_id"};

	public EcsCart() {
	}
	public String getTableName() {
		return "ecs_cart";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "rec_id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getRec_id() {
		return rec_id;
	}
	public void setRec_id(java.lang.Integer rec_id) {
		 this.rec_id=rec_id;
	}
	public java.lang.Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(java.lang.Integer user_id) {
		 this.user_id=user_id;
	}
	public java.lang.String getSession_id() {
		return session_id;
	}
	public void setSession_id(java.lang.String session_id) {
		 this.session_id=session_id;
	}
	public java.lang.Integer getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(java.lang.Integer goods_id) {
		 this.goods_id=goods_id;
	}
	public java.lang.String getGoods_sn() {
		return goods_sn;
	}
	public void setGoods_sn(java.lang.String goods_sn) {
		 this.goods_sn=goods_sn;
	}
	public java.lang.Integer getProduct_id() {
		return product_id;
	}
	public void setProduct_id(java.lang.Integer product_id) {
		 this.product_id=product_id;
	}
	public java.lang.String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(java.lang.String goods_name) {
		 this.goods_name=goods_name;
	}
	public java.math.BigDecimal getMarket_price() {
		return market_price;
	}
	public void setMarket_price(java.math.BigDecimal market_price) {
		 this.market_price=market_price;
	}
	public java.math.BigDecimal getGoods_price() {
		return goods_price;
	}
	public void setGoods_price(java.math.BigDecimal goods_price) {
		 this.goods_price=goods_price;
	}
	public java.lang.Integer getGoods_number() {
		return goods_number;
	}
	public void setGoods_number(java.lang.Integer goods_number) {
		 this.goods_number=goods_number;
	}
	public java.lang.String getGoods_attr() {
		return goods_attr;
	}
	public void setGoods_attr(java.lang.String goods_attr) {
		 this.goods_attr=goods_attr;
	}
	public java.lang.Integer getIs_real() {
		return is_real;
	}
	public void setIs_real(java.lang.Integer is_real) {
		 this.is_real=is_real;
	}
	public java.lang.String getExtension_code() {
		return extension_code;
	}
	public void setExtension_code(java.lang.String extension_code) {
		 this.extension_code=extension_code;
	}
	public java.lang.Integer getParent_id() {
		return parent_id;
	}
	public void setParent_id(java.lang.Integer parent_id) {
		 this.parent_id=parent_id;
	}
	public java.lang.Integer getRec_type() {
		return rec_type;
	}
	public void setRec_type(java.lang.Integer rec_type) {
		 this.rec_type=rec_type;
	}
	public java.lang.Integer getIs_gift() {
		return is_gift;
	}
	public void setIs_gift(java.lang.Integer is_gift) {
		 this.is_gift=is_gift;
	}
	public java.lang.Integer getIs_shipping() {
		return is_shipping;
	}
	public void setIs_shipping(java.lang.Integer is_shipping) {
		 this.is_shipping=is_shipping;
	}
	public java.lang.Integer getCan_handsel() {
		return can_handsel;
	}
	public void setCan_handsel(java.lang.Integer can_handsel) {
		 this.can_handsel=can_handsel;
	}
	public java.lang.String getGoods_attr_id() {
		return goods_attr_id;
	}
	public void setGoods_attr_id(java.lang.String goods_attr_id) {
		 this.goods_attr_id=goods_attr_id;
	}
}
