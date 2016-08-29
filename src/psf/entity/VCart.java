package psf.entity;
public class VCart extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer pid = null;
	protected java.lang.Integer pcount = null;
	protected java.lang.Integer uid = null;
	protected java.lang.String sessionid = null;
	protected java.lang.Integer goods_id = null;
	protected java.lang.String goods_sn = null;
	protected java.lang.String goods_thumb = null;
	protected java.lang.String goods_name = null;
	protected java.math.BigDecimal shop_price = null;
	protected java.math.BigDecimal market_price = null;
	protected String [] _fields = new String[]{"pid","pcount","uid","sessionid","goods_id","goods_sn","goods_thumb","goods_name","shop_price","market_price"};

	public VCart() {
	}
	public String getTableName() {
		return "v_cart";
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
	public java.lang.Integer getPid() {
		return pid;
	}
	public void setPid(java.lang.Integer pid) {
		 this.pid=pid;
	}
	public java.lang.Integer getPcount() {
		return pcount;
	}
	public void setPcount(java.lang.Integer pcount) {
		 this.pcount=pcount;
	}
	public java.lang.Integer getUid() {
		return uid;
	}
	public void setUid(java.lang.Integer uid) {
		 this.uid=uid;
	}
	public java.lang.String getSessionid() {
		return sessionid;
	}
	public void setSessionid(java.lang.String sessionid) {
		 this.sessionid=sessionid;
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
	public java.lang.String getGoods_thumb() {
		return goods_thumb;
	}
	public void setGoods_thumb(java.lang.String goods_thumb) {
		 this.goods_thumb=goods_thumb;
	}
	public java.lang.String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(java.lang.String goods_name) {
		 this.goods_name=goods_name;
	}
	public java.math.BigDecimal getShop_price() {
		return shop_price;
	}
	public void setShop_price(java.math.BigDecimal shop_price) {
		 this.shop_price=shop_price;
	}
	public java.math.BigDecimal getMarket_price() {
		return market_price;
	}
	public void setMarket_price(java.math.BigDecimal market_price) {
		 this.market_price=market_price;
	}
}
