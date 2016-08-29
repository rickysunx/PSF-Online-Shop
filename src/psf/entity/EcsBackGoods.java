package psf.entity;
public class EcsBackGoods extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer rec_id = null;
	protected java.lang.Integer back_id = null;
	protected java.lang.Integer goods_id = null;
	protected java.lang.Integer product_id = null;
	protected java.lang.String product_sn = null;
	protected java.lang.String goods_name = null;
	protected java.lang.String brand_name = null;
	protected java.lang.String goods_sn = null;
	protected java.lang.Integer is_real = null;
	protected java.lang.Integer send_number = null;
	protected java.lang.String goods_attr = null;
	protected String [] _fields = new String[]{"rec_id","back_id","goods_id","product_id","product_sn","goods_name","brand_name","goods_sn","is_real","send_number","goods_attr"};

	public EcsBackGoods() {
	}
	public String getTableName() {
		return "ecs_back_goods";
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
	public java.lang.Integer getBack_id() {
		return back_id;
	}
	public void setBack_id(java.lang.Integer back_id) {
		 this.back_id=back_id;
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
	public java.lang.String getProduct_sn() {
		return product_sn;
	}
	public void setProduct_sn(java.lang.String product_sn) {
		 this.product_sn=product_sn;
	}
	public java.lang.String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(java.lang.String goods_name) {
		 this.goods_name=goods_name;
	}
	public java.lang.String getBrand_name() {
		return brand_name;
	}
	public void setBrand_name(java.lang.String brand_name) {
		 this.brand_name=brand_name;
	}
	public java.lang.String getGoods_sn() {
		return goods_sn;
	}
	public void setGoods_sn(java.lang.String goods_sn) {
		 this.goods_sn=goods_sn;
	}
	public java.lang.Integer getIs_real() {
		return is_real;
	}
	public void setIs_real(java.lang.Integer is_real) {
		 this.is_real=is_real;
	}
	public java.lang.Integer getSend_number() {
		return send_number;
	}
	public void setSend_number(java.lang.Integer send_number) {
		 this.send_number=send_number;
	}
	public java.lang.String getGoods_attr() {
		return goods_attr;
	}
	public void setGoods_attr(java.lang.String goods_attr) {
		 this.goods_attr=goods_attr;
	}
}
