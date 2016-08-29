package psf.entity;
public class EcsRole extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer role_id = null;
	protected java.lang.String role_name = null;
	protected java.lang.String action_list = null;
	protected java.lang.String role_describe = null;
	protected String [] _fields = new String[]{"role_id","role_name","action_list","role_describe"};

	public EcsRole() {
	}
	public String getTableName() {
		return "ecs_role";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "role_id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getRole_id() {
		return role_id;
	}
	public void setRole_id(java.lang.Integer role_id) {
		 this.role_id=role_id;
	}
	public java.lang.String getRole_name() {
		return role_name;
	}
	public void setRole_name(java.lang.String role_name) {
		 this.role_name=role_name;
	}
	public java.lang.String getAction_list() {
		return action_list;
	}
	public void setAction_list(java.lang.String action_list) {
		 this.action_list=action_list;
	}
	public java.lang.String getRole_describe() {
		return role_describe;
	}
	public void setRole_describe(java.lang.String role_describe) {
		 this.role_describe=role_describe;
	}
}
