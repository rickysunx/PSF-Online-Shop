package psf.entity;
public class EcsVote extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer vote_id = null;
	protected java.lang.String vote_name = null;
	protected java.lang.Long start_time = null;
	protected java.lang.Long end_time = null;
	protected java.lang.Integer can_multi = null;
	protected java.lang.Long vote_count = null;
	protected String [] _fields = new String[]{"vote_id","vote_name","start_time","end_time","can_multi","vote_count"};

	public EcsVote() {
	}
	public String getTableName() {
		return "ecs_vote";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "vote_id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getVote_id() {
		return vote_id;
	}
	public void setVote_id(java.lang.Integer vote_id) {
		 this.vote_id=vote_id;
	}
	public java.lang.String getVote_name() {
		return vote_name;
	}
	public void setVote_name(java.lang.String vote_name) {
		 this.vote_name=vote_name;
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
	public java.lang.Integer getCan_multi() {
		return can_multi;
	}
	public void setCan_multi(java.lang.Integer can_multi) {
		 this.can_multi=can_multi;
	}
	public java.lang.Long getVote_count() {
		return vote_count;
	}
	public void setVote_count(java.lang.Long vote_count) {
		 this.vote_count=vote_count;
	}
}
