package psf.entity;
public class EcsGoodsAttr extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Long goods_attr_id = null;
	protected java.lang.Integer goods_id = null;
	protected java.lang.Integer attr_id = null;
	protected java.lang.String attr_value = null;
	protected java.lang.String attr_price = null;
	protected java.lang.String taobao_code = null;
	protected String [] _fields = new String[]{"goods_attr_id","goods_id","attr_id","attr_value","attr_price","taobao_code"};

	public EcsGoodsAttr() {
	}
	public String getTableName() {
		return "ecs_goods_attr";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "goods_attr_id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Long getGoods_attr_id() {
		return goods_attr_id;
	}
	public void setGoods_attr_id(java.lang.Long goods_attr_id) {
		 this.goods_attr_id=goods_attr_id;
	}
	public java.lang.Integer getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(java.lang.Integer goods_id) {
		 this.goods_id=goods_id;
	}
	public java.lang.Integer getAttr_id() {
		return attr_id;
	}
	public void setAttr_id(java.lang.Integer attr_id) {
		 this.attr_id=attr_id;
	}
	public java.lang.String getAttr_value() {
		return attr_value;
	}
	public void setAttr_value(java.lang.String attr_value) {
		 this.attr_value=attr_value;
	}
	public java.lang.String getAttr_price() {
		return attr_price;
	}
	public void setAttr_price(java.lang.String attr_price) {
		 this.attr_price=attr_price;
	}
	public java.lang.String getTaobao_code() {
		return taobao_code;
	}
	public void setTaobao_code(java.lang.String taobao_code) {
		 this.taobao_code=taobao_code;
	}
}
