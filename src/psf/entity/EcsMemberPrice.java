package psf.entity;
public class EcsMemberPrice extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer price_id = null;
	protected java.lang.Integer goods_id = null;
	protected java.lang.Integer user_rank = null;
	protected java.math.BigDecimal user_price = null;
	protected String [] _fields = new String[]{"price_id","goods_id","user_rank","user_price"};

	public EcsMemberPrice() {
	}
	public String getTableName() {
		return "ecs_member_price";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "price_id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getPrice_id() {
		return price_id;
	}
	public void setPrice_id(java.lang.Integer price_id) {
		 this.price_id=price_id;
	}
	public java.lang.Integer getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(java.lang.Integer goods_id) {
		 this.goods_id=goods_id;
	}
	public java.lang.Integer getUser_rank() {
		return user_rank;
	}
	public void setUser_rank(java.lang.Integer user_rank) {
		 this.user_rank=user_rank;
	}
	public java.math.BigDecimal getUser_price() {
		return user_price;
	}
	public void setUser_price(java.math.BigDecimal user_price) {
		 this.user_price=user_price;
	}
}
