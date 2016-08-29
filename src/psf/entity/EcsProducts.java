package psf.entity;
public class EcsProducts extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer product_id = null;
	protected java.lang.Integer goods_id = null;
	protected java.lang.String goods_attr = null;
	protected java.lang.String product_sn = null;
	protected java.lang.Integer product_number = null;
	protected java.math.BigDecimal product_price = null;
	protected String [] _fields = new String[]{"product_id","goods_id","goods_attr","product_sn","product_number","product_price"};

	public EcsProducts() {
	}
	public String getTableName() {
		return "ecs_products";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "product_id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getProduct_id() {
		return product_id;
	}
	public void setProduct_id(java.lang.Integer product_id) {
		 this.product_id=product_id;
	}
	public java.lang.Integer getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(java.lang.Integer goods_id) {
		 this.goods_id=goods_id;
	}
	public java.lang.String getGoods_attr() {
		return goods_attr;
	}
	public void setGoods_attr(java.lang.String goods_attr) {
		 this.goods_attr=goods_attr;
	}
	public java.lang.String getProduct_sn() {
		return product_sn;
	}
	public void setProduct_sn(java.lang.String product_sn) {
		 this.product_sn=product_sn;
	}
	public java.lang.Integer getProduct_number() {
		return product_number;
	}
	public void setProduct_number(java.lang.Integer product_number) {
		 this.product_number=product_number;
	}
	public java.math.BigDecimal getProduct_price() {
		return product_price;
	}
	public void setProduct_price(java.math.BigDecimal product_price) {
		 this.product_price=product_price;
	}
}
