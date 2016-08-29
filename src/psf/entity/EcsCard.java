package psf.entity;
public class EcsCard extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer card_id = null;
	protected java.lang.String card_name = null;
	protected java.lang.String card_img = null;
	protected java.math.BigDecimal card_fee = null;
	protected java.math.BigDecimal free_money = null;
	protected java.lang.String card_desc = null;
	protected String [] _fields = new String[]{"card_id","card_name","card_img","card_fee","free_money","card_desc"};

	public EcsCard() {
	}
	public String getTableName() {
		return "ecs_card";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "card_id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getCard_id() {
		return card_id;
	}
	public void setCard_id(java.lang.Integer card_id) {
		 this.card_id=card_id;
	}
	public java.lang.String getCard_name() {
		return card_name;
	}
	public void setCard_name(java.lang.String card_name) {
		 this.card_name=card_name;
	}
	public java.lang.String getCard_img() {
		return card_img;
	}
	public void setCard_img(java.lang.String card_img) {
		 this.card_img=card_img;
	}
	public java.math.BigDecimal getCard_fee() {
		return card_fee;
	}
	public void setCard_fee(java.math.BigDecimal card_fee) {
		 this.card_fee=card_fee;
	}
	public java.math.BigDecimal getFree_money() {
		return free_money;
	}
	public void setFree_money(java.math.BigDecimal free_money) {
		 this.free_money=free_money;
	}
	public java.lang.String getCard_desc() {
		return card_desc;
	}
	public void setCard_desc(java.lang.String card_desc) {
		 this.card_desc=card_desc;
	}
}
