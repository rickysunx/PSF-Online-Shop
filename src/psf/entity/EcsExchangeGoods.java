package psf.entity;
public class EcsExchangeGoods extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer goods_id = null;
	protected java.lang.Long exchange_integral = null;
	protected java.lang.Integer is_exchange = null;
	protected java.lang.Integer is_hot = null;
	protected String [] _fields = new String[]{"goods_id","exchange_integral","is_exchange","is_hot"};

	public EcsExchangeGoods() {
	}
	public String getTableName() {
		return "ecs_exchange_goods";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "goods_id";
	}
	public boolean isAutoIncrease() {
		return false;
	};
	public java.lang.Integer getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(java.lang.Integer goods_id) {
		 this.goods_id=goods_id;
	}
	public java.lang.Long getExchange_integral() {
		return exchange_integral;
	}
	public void setExchange_integral(java.lang.Long exchange_integral) {
		 this.exchange_integral=exchange_integral;
	}
	public java.lang.Integer getIs_exchange() {
		return is_exchange;
	}
	public void setIs_exchange(java.lang.Integer is_exchange) {
		 this.is_exchange=is_exchange;
	}
	public java.lang.Integer getIs_hot() {
		return is_hot;
	}
	public void setIs_hot(java.lang.Integer is_hot) {
		 this.is_hot=is_hot;
	}
}
