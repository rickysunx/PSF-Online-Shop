package psf.entity;
public class EcsEmailSendlist extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer id = null;
	protected java.lang.String email = null;
	protected java.lang.Integer template_id = null;
	protected java.lang.String email_content = null;
	protected java.lang.Integer error = null;
	protected java.lang.Integer pri = null;
	protected java.lang.Integer last_send = null;
	protected String [] _fields = new String[]{"id","email","template_id","email_content","error","pri","last_send"};

	public EcsEmailSendlist() {
	}
	public String getTableName() {
		return "ecs_email_sendlist";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getId() {
		return id;
	}
	public void setId(java.lang.Integer id) {
		 this.id=id;
	}
	public java.lang.String getEmail() {
		return email;
	}
	public void setEmail(java.lang.String email) {
		 this.email=email;
	}
	public java.lang.Integer getTemplate_id() {
		return template_id;
	}
	public void setTemplate_id(java.lang.Integer template_id) {
		 this.template_id=template_id;
	}
	public java.lang.String getEmail_content() {
		return email_content;
	}
	public void setEmail_content(java.lang.String email_content) {
		 this.email_content=email_content;
	}
	public java.lang.Integer getError() {
		return error;
	}
	public void setError(java.lang.Integer error) {
		 this.error=error;
	}
	public java.lang.Integer getPri() {
		return pri;
	}
	public void setPri(java.lang.Integer pri) {
		 this.pri=pri;
	}
	public java.lang.Integer getLast_send() {
		return last_send;
	}
	public void setLast_send(java.lang.Integer last_send) {
		 this.last_send=last_send;
	}
}
