package psf.entity;
public class EcsWholesale extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer act_id = null;
	protected java.lang.Integer goods_id = null;
	protected java.lang.String goods_name = null;
	protected java.lang.String rank_ids = null;
	protected java.lang.String prices = null;
	protected java.lang.Integer enabled = null;
	protected String [] _fields = new String[]{"act_id","goods_id","goods_name","rank_ids","prices","enabled"};

	public EcsWholesale() {
	}
	public String getTableName() {
		return "ecs_wholesale";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "act_id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getAct_id() {
		return act_id;
	}
	public void setAct_id(java.lang.Integer act_id) {
		 this.act_id=act_id;
	}
	public java.lang.Integer getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(java.lang.Integer goods_id) {
		 this.goods_id=goods_id;
	}
	public java.lang.String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(java.lang.String goods_name) {
		 this.goods_name=goods_name;
	}
	public java.lang.String getRank_ids() {
		return rank_ids;
	}
	public void setRank_ids(java.lang.String rank_ids) {
		 this.rank_ids=rank_ids;
	}
	public java.lang.String getPrices() {
		return prices;
	}
	public void setPrices(java.lang.String prices) {
		 this.prices=prices;
	}
	public java.lang.Integer getEnabled() {
		return enabled;
	}
	public void setEnabled(java.lang.Integer enabled) {
		 this.enabled=enabled;
	}
}
