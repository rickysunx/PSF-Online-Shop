package psf.entity;
public class EcsAdminMessage extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer message_id = null;
	protected java.lang.Integer sender_id = null;
	protected java.lang.Integer receiver_id = null;
	protected java.lang.Long sent_time = null;
	protected java.lang.Long read_time = null;
	protected java.lang.Integer readed = null;
	protected java.lang.Integer deleted = null;
	protected java.lang.String title = null;
	protected java.lang.String message = null;
	protected String [] _fields = new String[]{"message_id","sender_id","receiver_id","sent_time","read_time","readed","deleted","title","message"};

	public EcsAdminMessage() {
	}
	public String getTableName() {
		return "ecs_admin_message";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "message_id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getMessage_id() {
		return message_id;
	}
	public void setMessage_id(java.lang.Integer message_id) {
		 this.message_id=message_id;
	}
	public java.lang.Integer getSender_id() {
		return sender_id;
	}
	public void setSender_id(java.lang.Integer sender_id) {
		 this.sender_id=sender_id;
	}
	public java.lang.Integer getReceiver_id() {
		return receiver_id;
	}
	public void setReceiver_id(java.lang.Integer receiver_id) {
		 this.receiver_id=receiver_id;
	}
	public java.lang.Long getSent_time() {
		return sent_time;
	}
	public void setSent_time(java.lang.Long sent_time) {
		 this.sent_time=sent_time;
	}
	public java.lang.Long getRead_time() {
		return read_time;
	}
	public void setRead_time(java.lang.Long read_time) {
		 this.read_time=read_time;
	}
	public java.lang.Integer getReaded() {
		return readed;
	}
	public void setReaded(java.lang.Integer readed) {
		 this.readed=readed;
	}
	public java.lang.Integer getDeleted() {
		return deleted;
	}
	public void setDeleted(java.lang.Integer deleted) {
		 this.deleted=deleted;
	}
	public java.lang.String getTitle() {
		return title;
	}
	public void setTitle(java.lang.String title) {
		 this.title=title;
	}
	public java.lang.String getMessage() {
		return message;
	}
	public void setMessage(java.lang.String message) {
		 this.message=message;
	}
}
