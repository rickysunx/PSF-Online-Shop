package psf.entity;
public class EcsRegExtendInfo extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Long id = null;
	protected java.lang.Integer user_id = null;
	protected java.lang.Long reg_field_id = null;
	protected java.lang.String content = null;
	protected String [] _fields = new String[]{"Id","user_id","reg_field_id","content"};

	public EcsRegExtendInfo() {
	}
	public String getTableName() {
		return "ecs_reg_extend_info";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "Id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Long getId() {
		return id;
	}
	public void setId(java.lang.Long id) {
		 this.id=id;
	}
	public java.lang.Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(java.lang.Integer user_id) {
		 this.user_id=user_id;
	}
	public java.lang.Long getReg_field_id() {
		return reg_field_id;
	}
	public void setReg_field_id(java.lang.Long reg_field_id) {
		 this.reg_field_id=reg_field_id;
	}
	public java.lang.String getContent() {
		return content;
	}
	public void setContent(java.lang.String content) {
		 this.content=content;
	}
}
