package psf.entity;
public class EcsPackageGoods extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer package_id = null;
	protected java.lang.Integer goods_id = null;
	protected java.lang.Integer product_id = null;
	protected java.lang.Integer goods_number = null;
	protected java.lang.Integer admin_id = null;
	protected String [] _fields = new String[]{"package_id","goods_id","product_id","goods_number","admin_id"};

	public EcsPackageGoods() {
	}
	public String getTableName() {
		return "ecs_package_goods";
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
	public java.lang.Integer getPackage_id() {
		return package_id;
	}
	public void setPackage_id(java.lang.Integer package_id) {
		 this.package_id=package_id;
	}
	public java.lang.Integer getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(java.lang.Integer goods_id) {
		 this.goods_id=goods_id;
	}
	public java.lang.Integer getProduct_id() {
		return product_id;
	}
	public void setProduct_id(java.lang.Integer product_id) {
		 this.product_id=product_id;
	}
	public java.lang.Integer getGoods_number() {
		return goods_number;
	}
	public void setGoods_number(java.lang.Integer goods_number) {
		 this.goods_number=goods_number;
	}
	public java.lang.Integer getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(java.lang.Integer admin_id) {
		 this.admin_id=admin_id;
	}
}
