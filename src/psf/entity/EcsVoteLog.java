package psf.entity;
public class EcsVoteLog extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer log_id = null;
	protected java.lang.Integer vote_id = null;
	protected java.lang.String ip_address = null;
	protected java.lang.Long vote_time = null;
	protected String [] _fields = new String[]{"log_id","vote_id","ip_address","vote_time"};

	public EcsVoteLog() {
	}
	public String getTableName() {
		return "ecs_vote_log";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "log_id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getLog_id() {
		return log_id;
	}
	public void setLog_id(java.lang.Integer log_id) {
		 this.log_id=log_id;
	}
	public java.lang.Integer getVote_id() {
		return vote_id;
	}
	public void setVote_id(java.lang.Integer vote_id) {
		 this.vote_id=vote_id;
	}
	public java.lang.String getIp_address() {
		return ip_address;
	}
	public void setIp_address(java.lang.String ip_address) {
		 this.ip_address=ip_address;
	}
	public java.lang.Long getVote_time() {
		return vote_time;
	}
	public void setVote_time(java.lang.Long vote_time) {
		 this.vote_time=vote_time;
	}
}
