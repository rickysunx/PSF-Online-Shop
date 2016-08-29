package psf.entity;
public class EcsAdminUser extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer user_id = null;
	protected java.lang.String user_name = null;
	protected java.lang.String email = null;
	protected java.lang.String password = null;
	protected java.lang.Integer add_time = null;
	protected java.lang.Integer last_login = null;
	protected java.lang.String last_ip = null;
	protected java.lang.String action_list = null;
	protected java.lang.String nav_list = null;
	protected java.lang.String lang_type = null;
	protected java.lang.Integer agency_id = null;
	protected java.lang.Integer suppliers_id = null;
	protected java.lang.String todolist = null;
	protected java.lang.Integer role_id = null;
	protected String [] _fields = new String[]{"user_id","user_name","email","password","add_time","last_login","last_ip","action_list","nav_list","lang_type","agency_id","suppliers_id","todolist","role_id"};

	public EcsAdminUser() {
	}
	public String getTableName() {
		return "ecs_admin_user";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "user_id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
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
	public java.lang.String getEmail() {
		return email;
	}
	public void setEmail(java.lang.String email) {
		 this.email=email;
	}
	public java.lang.String getPassword() {
		return password;
	}
	public void setPassword(java.lang.String password) {
		 this.password=password;
	}
	public java.lang.Integer getAdd_time() {
		return add_time;
	}
	public void setAdd_time(java.lang.Integer add_time) {
		 this.add_time=add_time;
	}
	public java.lang.Integer getLast_login() {
		return last_login;
	}
	public void setLast_login(java.lang.Integer last_login) {
		 this.last_login=last_login;
	}
	public java.lang.String getLast_ip() {
		return last_ip;
	}
	public void setLast_ip(java.lang.String last_ip) {
		 this.last_ip=last_ip;
	}
	public java.lang.String getAction_list() {
		return action_list;
	}
	public void setAction_list(java.lang.String action_list) {
		 this.action_list=action_list;
	}
	public java.lang.String getNav_list() {
		return nav_list;
	}
	public void setNav_list(java.lang.String nav_list) {
		 this.nav_list=nav_list;
	}
	public java.lang.String getLang_type() {
		return lang_type;
	}
	public void setLang_type(java.lang.String lang_type) {
		 this.lang_type=lang_type;
	}
	public java.lang.Integer getAgency_id() {
		return agency_id;
	}
	public void setAgency_id(java.lang.Integer agency_id) {
		 this.agency_id=agency_id;
	}
	public java.lang.Integer getSuppliers_id() {
		return suppliers_id;
	}
	public void setSuppliers_id(java.lang.Integer suppliers_id) {
		 this.suppliers_id=suppliers_id;
	}
	public java.lang.String getTodolist() {
		return todolist;
	}
	public void setTodolist(java.lang.String todolist) {
		 this.todolist=todolist;
	}
	public java.lang.Integer getRole_id() {
		return role_id;
	}
	public void setRole_id(java.lang.Integer role_id) {
		 this.role_id=role_id;
	}
}
