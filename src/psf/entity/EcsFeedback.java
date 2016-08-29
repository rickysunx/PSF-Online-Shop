package psf.entity;
public class EcsFeedback extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer msg_id = null;
	protected java.lang.Integer parent_id = null;
	protected java.lang.Integer user_id = null;
	protected java.lang.String user_name = null;
	protected java.lang.String user_email = null;
	protected java.lang.String msg_title = null;
	protected java.lang.Integer msg_type = null;
	protected java.lang.Integer msg_status = null;
	protected java.lang.String msg_content = null;
	protected java.lang.Long msg_time = null;
	protected java.lang.String message_img = null;
	protected java.lang.Long order_id = null;
	protected java.lang.Integer msg_area = null;
	protected String [] _fields = new String[]{"msg_id","parent_id","user_id","user_name","user_email","msg_title","msg_type","msg_status","msg_content","msg_time","message_img","order_id","msg_area"};

	public EcsFeedback() {
	}
	public String getTableName() {
		return "ecs_feedback";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "msg_id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getMsg_id() {
		return msg_id;
	}
	public void setMsg_id(java.lang.Integer msg_id) {
		 this.msg_id=msg_id;
	}
	public java.lang.Integer getParent_id() {
		return parent_id;
	}
	public void setParent_id(java.lang.Integer parent_id) {
		 this.parent_id=parent_id;
	}
	public java.lang.Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(java.lang.Integer user_id) {
		 this.user_id=user_id;
	}
	public java.lang.String getUser_name() {
		return user_name;
	}
	public void setUser_name(java.lang.String user_name) {
		 this.user_name=user_name;
	}
	public java.lang.String getUser_email() {
		return user_email;
	}
	public void setUser_email(java.lang.String user_email) {
		 this.user_email=user_email;
	}
	public java.lang.String getMsg_title() {
		return msg_title;
	}
	public void setMsg_title(java.lang.String msg_title) {
		 this.msg_title=msg_title;
	}
	public java.lang.Integer getMsg_type() {
		return msg_type;
	}
	public void setMsg_type(java.lang.Integer msg_type) {
		 this.msg_type=msg_type;
	}
	public java.lang.Integer getMsg_status() {
		return msg_status;
	}
	public void setMsg_status(java.lang.Integer msg_status) {
		 this.msg_status=msg_status;
	}
	public java.lang.String getMsg_content() {
		return msg_content;
	}
	public void setMsg_content(java.lang.String msg_content) {
		 this.msg_content=msg_content;
	}
	public java.lang.Long getMsg_time() {
		return msg_time;
	}
	public void setMsg_time(java.lang.Long msg_time) {
		 this.msg_time=msg_time;
	}
	public java.lang.String getMessage_img() {
		return message_img;
	}
	public void setMessage_img(java.lang.String message_img) {
		 this.message_img=message_img;
	}
	public java.lang.Long getOrder_id() {
		return order_id;
	}
	public void setOrder_id(java.lang.Long order_id) {
		 this.order_id=order_id;
	}
	public java.lang.Integer getMsg_area() {
		return msg_area;
	}
	public void setMsg_area(java.lang.Integer msg_area) {
		 this.msg_area=msg_area;
	}
}
