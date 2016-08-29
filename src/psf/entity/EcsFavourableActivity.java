package psf.entity;
public class EcsFavourableActivity extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer act_id = null;
	protected java.lang.String act_name = null;
	protected java.lang.Long start_time = null;
	protected java.lang.Long end_time = null;
	protected java.lang.String user_rank = null;
	protected java.lang.Integer act_range = null;
	protected java.lang.String act_range_ext = null;
	protected java.math.BigDecimal min_amount = null;
	protected java.math.BigDecimal max_amount = null;
	protected java.lang.Integer act_type = null;
	protected java.math.BigDecimal act_type_ext = null;
	protected java.lang.String gift = null;
	protected java.lang.Integer sort_order = null;
	protected String [] _fields = new String[]{"act_id","act_name","start_time","end_time","user_rank","act_range","act_range_ext","min_amount","max_amount","act_type","act_type_ext","gift","sort_order"};

	public EcsFavourableActivity() {
	}
	public String getTableName() {
		return "ecs_favourable_activity";
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
	public java.lang.String getAct_name() {
		return act_name;
	}
	public void setAct_name(java.lang.String act_name) {
		 this.act_name=act_name;
	}
	public java.lang.Long getStart_time() {
		return start_time;
	}
	public void setStart_time(java.lang.Long start_time) {
		 this.start_time=start_time;
	}
	public java.lang.Long getEnd_time() {
		return end_time;
	}
	public void setEnd_time(java.lang.Long end_time) {
		 this.end_time=end_time;
	}
	public java.lang.String getUser_rank() {
		return user_rank;
	}
	public void setUser_rank(java.lang.String user_rank) {
		 this.user_rank=user_rank;
	}
	public java.lang.Integer getAct_range() {
		return act_range;
	}
	public void setAct_range(java.lang.Integer act_range) {
		 this.act_range=act_range;
	}
	public java.lang.String getAct_range_ext() {
		return act_range_ext;
	}
	public void setAct_range_ext(java.lang.String act_range_ext) {
		 this.act_range_ext=act_range_ext;
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
	public java.lang.Integer getAct_type() {
		return act_type;
	}
	public void setAct_type(java.lang.Integer act_type) {
		 this.act_type=act_type;
	}
	public java.math.BigDecimal getAct_type_ext() {
		return act_type_ext;
	}
	public void setAct_type_ext(java.math.BigDecimal act_type_ext) {
		 this.act_type_ext=act_type_ext;
	}
	public java.lang.String getGift() {
		return gift;
	}
	public void setGift(java.lang.String gift) {
		 this.gift=gift;
	}
	public java.lang.Integer getSort_order() {
		return sort_order;
	}
	public void setSort_order(java.lang.Integer sort_order) {
		 this.sort_order=sort_order;
	}
}
