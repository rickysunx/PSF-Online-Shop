package psf.entity;
public class EcsComment extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Long comment_id = null;
	protected java.lang.Integer comment_type = null;
	protected java.lang.Integer id_value = null;
	protected java.lang.String email = null;
	protected java.lang.String user_name = null;
	protected java.lang.String content = null;
	protected java.lang.Integer comment_rank = null;
	protected java.lang.Long add_time = null;
	protected java.lang.String ip_address = null;
	protected java.lang.Integer status = null;
	protected java.lang.Long parent_id = null;
	protected java.lang.Long user_id = null;
	protected String [] _fields = new String[]{"comment_id","comment_type","id_value","email","user_name","content","comment_rank","add_time","ip_address","status","parent_id","user_id"};

	public EcsComment() {
	}
	public String getTableName() {
		return "ecs_comment";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "comment_id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Long getComment_id() {
		return comment_id;
	}
	public void setComment_id(java.lang.Long comment_id) {
		 this.comment_id=comment_id;
	}
	public java.lang.Integer getComment_type() {
		return comment_type;
	}
	public void setComment_type(java.lang.Integer comment_type) {
		 this.comment_type=comment_type;
	}
	public java.lang.Integer getId_value() {
		return id_value;
	}
	public void setId_value(java.lang.Integer id_value) {
		 this.id_value=id_value;
	}
	public java.lang.String getEmail() {
		return email;
	}
	public void setEmail(java.lang.String email) {
		 this.email=email;
	}
	public java.lang.String getUser_name() {
		return user_name;
	}
	public void setUser_name(java.lang.String user_name) {
		 this.user_name=user_name;
	}
	public java.lang.String getContent() {
		return content;
	}
	public void setContent(java.lang.String content) {
		 this.content=content;
	}
	public java.lang.Integer getComment_rank() {
		return comment_rank;
	}
	public void setComment_rank(java.lang.Integer comment_rank) {
		 this.comment_rank=comment_rank;
	}
	public java.lang.Long getAdd_time() {
		return add_time;
	}
	public void setAdd_time(java.lang.Long add_time) {
		 this.add_time=add_time;
	}
	public java.lang.String getIp_address() {
		return ip_address;
	}
	public void setIp_address(java.lang.String ip_address) {
		 this.ip_address=ip_address;
	}
	public java.lang.Integer getStatus() {
		return status;
	}
	public void setStatus(java.lang.Integer status) {
		 this.status=status;
	}
	public java.lang.Long getParent_id() {
		return parent_id;
	}
	public void setParent_id(java.lang.Long parent_id) {
		 this.parent_id=parent_id;
	}
	public java.lang.Long getUser_id() {
		return user_id;
	}
	public void setUser_id(java.lang.Long user_id) {
		 this.user_id=user_id;
	}
}
