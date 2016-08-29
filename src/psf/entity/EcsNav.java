package psf.entity;
public class EcsNav extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer id = null;
	protected java.lang.String ctype = null;
	protected java.lang.Integer cid = null;
	protected java.lang.String name = null;
	protected java.lang.Integer ifshow = null;
	protected java.lang.Integer vieworder = null;
	protected java.lang.Integer opennew = null;
	protected java.lang.String url = null;
	protected java.lang.String type = null;
	protected String [] _fields = new String[]{"id","ctype","cid","name","ifshow","vieworder","opennew","url","type"};

	public EcsNav() {
	}
	public String getTableName() {
		return "ecs_nav";
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
	public java.lang.String getCtype() {
		return ctype;
	}
	public void setCtype(java.lang.String ctype) {
		 this.ctype=ctype;
	}
	public java.lang.Integer getCid() {
		return cid;
	}
	public void setCid(java.lang.Integer cid) {
		 this.cid=cid;
	}
	public java.lang.String getName() {
		return name;
	}
	public void setName(java.lang.String name) {
		 this.name=name;
	}
	public java.lang.Integer getIfshow() {
		return ifshow;
	}
	public void setIfshow(java.lang.Integer ifshow) {
		 this.ifshow=ifshow;
	}
	public java.lang.Integer getVieworder() {
		return vieworder;
	}
	public void setVieworder(java.lang.Integer vieworder) {
		 this.vieworder=vieworder;
	}
	public java.lang.Integer getOpennew() {
		return opennew;
	}
	public void setOpennew(java.lang.Integer opennew) {
		 this.opennew=opennew;
	}
	public java.lang.String getUrl() {
		return url;
	}
	public void setUrl(java.lang.String url) {
		 this.url=url;
	}
	public java.lang.String getType() {
		return type;
	}
	public void setType(java.lang.String type) {
		 this.type=type;
	}
}
