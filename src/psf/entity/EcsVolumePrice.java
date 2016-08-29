package psf.entity;
public class EcsVolumePrice extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer price_type = null;
	protected java.lang.Integer goods_id = null;
	protected java.lang.Integer volume_number = null;
	protected java.math.BigDecimal volume_price = null;
	protected String [] _fields = new String[]{"price_type","goods_id","volume_number","volume_price"};

	public EcsVolumePrice() {
	}
	public String getTableName() {
		return "ecs_volume_price";
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
	public java.lang.Integer getPrice_type() {
		return price_type;
	}
	public void setPrice_type(java.lang.Integer price_type) {
		 this.price_type=price_type;
	}
	public java.lang.Integer getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(java.lang.Integer goods_id) {
		 this.goods_id=goods_id;
	}
	public java.lang.Integer getVolume_number() {
		return volume_number;
	}
	public void setVolume_number(java.lang.Integer volume_number) {
		 this.volume_number=volume_number;
	}
	public java.math.BigDecimal getVolume_price() {
		return volume_price;
	}
	public void setVolume_price(java.math.BigDecimal volume_price) {
		 this.volume_price=volume_price;
	}
}
