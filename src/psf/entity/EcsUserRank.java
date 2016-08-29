package psf.entity;
public class EcsUserRank extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer rank_id = null;
	protected java.lang.String rank_name = null;
	protected java.lang.Long min_points = null;
	protected java.lang.Long max_points = null;
	protected java.lang.Integer discount = null;
	protected java.lang.Integer show_price = null;
	protected java.lang.Integer special_rank = null;
	protected String [] _fields = new String[]{"rank_id","rank_name","min_points","max_points","discount","show_price","special_rank"};

	public EcsUserRank() {
	}
	public String getTableName() {
		return "ecs_user_rank";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "rank_id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getRank_id() {
		return rank_id;
	}
	public void setRank_id(java.lang.Integer rank_id) {
		 this.rank_id=rank_id;
	}
	public java.lang.String getRank_name() {
		return rank_name;
	}
	public void setRank_name(java.lang.String rank_name) {
		 this.rank_name=rank_name;
	}
	public java.lang.Long getMin_points() {
		return min_points;
	}
	public void setMin_points(java.lang.Long min_points) {
		 this.min_points=min_points;
	}
	public java.lang.Long getMax_points() {
		return max_points;
	}
	public void setMax_points(java.lang.Long max_points) {
		 this.max_points=max_points;
	}
	public java.lang.Integer getDiscount() {
		return discount;
	}
	public void setDiscount(java.lang.Integer discount) {
		 this.discount=discount;
	}
	public java.lang.Integer getShow_price() {
		return show_price;
	}
	public void setShow_price(java.lang.Integer show_price) {
		 this.show_price=show_price;
	}
	public java.lang.Integer getSpecial_rank() {
		return special_rank;
	}
	public void setSpecial_rank(java.lang.Integer special_rank) {
		 this.special_rank=special_rank;
	}
}
