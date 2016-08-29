package psf.entity;
public class EcsMailTemplates extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer template_id = null;
	protected java.lang.String template_code = null;
	protected java.lang.Integer is_html = null;
	protected java.lang.String template_subject = null;
	protected java.lang.String template_content = null;
	protected java.lang.Long last_modify = null;
	protected java.lang.Long last_send = null;
	protected java.lang.String type = null;
	protected String [] _fields = new String[]{"template_id","template_code","is_html","template_subject","template_content","last_modify","last_send","type"};

	public EcsMailTemplates() {
	}
	public String getTableName() {
		return "ecs_mail_templates";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "template_id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getTemplate_id() {
		return template_id;
	}
	public void setTemplate_id(java.lang.Integer template_id) {
		 this.template_id=template_id;
	}
	public java.lang.String getTemplate_code() {
		return template_code;
	}
	public void setTemplate_code(java.lang.String template_code) {
		 this.template_code=template_code;
	}
	public java.lang.Integer getIs_html() {
		return is_html;
	}
	public void setIs_html(java.lang.Integer is_html) {
		 this.is_html=is_html;
	}
	public java.lang.String getTemplate_subject() {
		return template_subject;
	}
	public void setTemplate_subject(java.lang.String template_subject) {
		 this.template_subject=template_subject;
	}
	public java.lang.String getTemplate_content() {
		return template_content;
	}
	public void setTemplate_content(java.lang.String template_content) {
		 this.template_content=template_content;
	}
	public java.lang.Long getLast_modify() {
		return last_modify;
	}
	public void setLast_modify(java.lang.Long last_modify) {
		 this.last_modify=last_modify;
	}
	public java.lang.Long getLast_send() {
		return last_send;
	}
	public void setLast_send(java.lang.Long last_send) {
		 this.last_send=last_send;
	}
	public java.lang.String getType() {
		return type;
	}
	public void setType(java.lang.String type) {
		 this.type=type;
	}
}
