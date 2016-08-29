package psf.entity;
public class EcsEmailList extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer id = null;
	protected java.lang.String email = null;
	protected java.lang.Integer stat = null;
	protected java.lang.String hash = null;
	protected String [] _fields = new String[]{"id","email","stat","hash"};

	public EcsEmailList() {
	}
	public String getTableName() {
		return "ecs_email_list";
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
	public java.lang.Integer getStat() {
		return stat;
	}
	public void setStat(java.lang.Integer stat) {
		 this.stat=stat;
	}
	public java.lang.String getHash() {
		return hash;
	}
	public void setHash(java.lang.String hash) {
		 this.hash=hash;
	}
}
