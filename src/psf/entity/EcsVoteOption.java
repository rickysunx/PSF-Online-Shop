package psf.entity;
public class EcsVoteOption extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer option_id = null;
	protected java.lang.Integer vote_id = null;
	protected java.lang.String option_name = null;
	protected java.lang.Long option_count = null;
	protected java.lang.Integer option_order = null;
	protected String [] _fields = new String[]{"option_id","vote_id","option_name","option_count","option_order"};

	public EcsVoteOption() {
	}
	public String getTableName() {
		return "ecs_vote_option";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "option_id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getOption_id() {
		return option_id;
	}
	public void setOption_id(java.lang.Integer option_id) {
		 this.option_id=option_id;
	}
	public java.lang.Integer getVote_id() {
		return vote_id;
	}
	public void setVote_id(java.lang.Integer vote_id) {
		 this.vote_id=vote_id;
	}
	public java.lang.String getOption_name() {
		return option_name;
	}
	public void setOption_name(java.lang.String option_name) {
		 this.option_name=option_name;
	}
	public java.lang.Long getOption_count() {
		return option_count;
	}
	public void setOption_count(java.lang.Long option_count) {
		 this.option_count=option_count;
	}
	public java.lang.Integer getOption_order() {
		return option_order;
	}
	public void setOption_order(java.lang.Integer option_order) {
		 this.option_order=option_order;
	}
}
