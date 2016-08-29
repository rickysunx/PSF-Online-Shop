package psf.entity;
public class EcsAdminLog extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Long log_id = null;
	protected java.lang.Long log_time = null;
	protected java.lang.Integer user_id = null;
	protected java.lang.String log_info = null;
	protected java.lang.String ip_address = null;
	protected String [] _fields = new String[]{"log_id","log_time","user_id","log_info","ip_address"};

	public EcsAdminLog() {
	}
	public String getTableName() {
		return "ecs_admin_log";
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
	public java.lang.Long getLog_id() {
		return log_id;
	}
	public void setLog_id(java.lang.Long log_id) {
		 this.log_id=log_id;
	}
	public java.lang.Long getLog_time() {
		return log_time;
	}
	public void setLog_time(java.lang.Long log_time) {
		 this.log_time=log_time;
	}
	public java.lang.Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(java.lang.Integer user_id) {
		 this.user_id=user_id;
	}
	public java.lang.String getLog_info() {
		return log_info;
	}
	public void setLog_info(java.lang.String log_info) {
		 this.log_info=log_info;
	}
	public java.lang.String getIp_address() {
		return ip_address;
	}
	public void setIp_address(java.lang.String ip_address) {
		 this.ip_address=ip_address;
	}
}
