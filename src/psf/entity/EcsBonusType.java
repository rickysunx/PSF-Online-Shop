package psf.entity;
public class EcsBonusType extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer type_id = null;
	protected java.lang.String type_name = null;
	protected java.math.BigDecimal type_money = null;
	protected java.lang.Integer send_type = null;
	protected java.math.BigDecimal min_amount = null;
	protected java.math.BigDecimal max_amount = null;
	protected java.lang.Integer send_start_date = null;
	protected java.lang.Integer send_end_date = null;
	protected java.lang.Integer use_start_date = null;
	protected java.lang.Integer use_end_date = null;
	protected java.math.BigDecimal min_goods_amount = null;
	protected String [] _fields = new String[]{"type_id","type_name","type_money","send_type","min_amount","max_amount","send_start_date","send_end_date","use_start_date","use_end_date","min_goods_amount"};

	public EcsBonusType() {
	}
	public String getTableName() {
		return "ecs_bonus_type";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "type_id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getType_id() {
		return type_id;
	}
	public void setType_id(java.lang.Integer type_id) {
		 this.type_id=type_id;
	}
	public java.lang.String getType_name() {
		return type_name;
	}
	public void setType_name(java.lang.String type_name) {
		 this.type_name=type_name;
	}
	public java.math.BigDecimal getType_money() {
		return type_money;
	}
	public void setType_money(java.math.BigDecimal type_money) {
		 this.type_money=type_money;
	}
	public java.lang.Integer getSend_type() {
		return send_type;
	}
	public void setSend_type(java.lang.Integer send_type) {
		 this.send_type=send_type;
	}
	public java.math.BigDecimal getMin_amount() {
		return min_amount;
	}
	public void setMin_amount(java.math.BigDecimal min_amount) {
		 this.min_amount=min_amount;
	}
	public java.math.BigDecimal getMax_amount() {
		return max_amount;
	}
	public void setMax_amount(java.math.BigDecimal max_amount) {
		 this.max_amount=max_amount;
	}
	public java.lang.Integer getSend_start_date() {
		return send_start_date;
	}
	public void setSend_start_date(java.lang.Integer send_start_date) {
		 this.send_start_date=send_start_date;
	}
	public java.lang.Integer getSend_end_date() {
		return send_end_date;
	}
	public void setSend_end_date(java.lang.Integer send_end_date) {
		 this.send_end_date=send_end_date;
	}
	public java.lang.Integer getUse_start_date() {
		return use_start_date;
	}
	public void setUse_start_date(java.lang.Integer use_start_date) {
		 this.use_start_date=use_start_date;
	}
	public java.lang.Integer getUse_end_date() {
		return use_end_date;
	}
	public void setUse_end_date(java.lang.Integer use_end_date) {
		 this.use_end_date=use_end_date;
	}
	public java.math.BigDecimal getMin_goods_amount() {
		return min_goods_amount;
	}
	public void setMin_goods_amount(java.math.BigDecimal min_goods_amount) {
		 this.min_goods_amount=min_goods_amount;
	}
}
