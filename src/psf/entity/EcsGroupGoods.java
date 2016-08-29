package psf.entity;
public class EcsGroupGoods extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer parent_id = null;
	protected java.lang.Integer goods_id = null;
	protected java.math.BigDecimal goods_price = null;
	protected java.lang.Integer admin_id = null;
	protected String [] _fields = new String[]{"parent_id","goods_id","goods_price","admin_id"};

	public EcsGroupGoods() {
	}
	public String getTableName() {
		return "ecs_group_goods";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "null";
	}
	public boolean isAutoIncrease() {
		return false;
	};
	public java.lang.Integer getParent_id() {
		return parent_id;
	}
	public void setParent_id(java.lang.Integer parent_id) {
		 this.parent_id=parent_id;
	}
	public java.lang.Integer getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(java.lang.Integer goods_id) {
		 this.goods_id=goods_id;
	}
	public java.math.BigDecimal getGoods_price() {
		return goods_price;
	}
	public void setGoods_price(java.math.BigDecimal goods_price) {
		 this.goods_price=goods_price;
	}
	public java.lang.Integer getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(java.lang.Integer admin_id) {
		 this.admin_id=admin_id;
	}
}
