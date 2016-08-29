package psf.entity;
public class EcsPlugins extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.String code = null;
	protected java.lang.String version = null;
	protected java.lang.String library = null;
	protected java.lang.Integer assign = null;
	protected java.lang.Long install_date = null;
	protected String [] _fields = new String[]{"code","version","library","assign","install_date"};

	public EcsPlugins() {
	}
	public String getTableName() {
		return "ecs_plugins";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "code";
	}
	public boolean isAutoIncrease() {
		return false;
	};
	public java.lang.String getCode() {
		return code;
	}
	public void setCode(java.lang.String code) {
		 this.code=code;
	}
	public java.lang.String getVersion() {
		return version;
	}
	public void setVersion(java.lang.String version) {
		 this.version=version;
	}
	public java.lang.String getLibrary() {
		return library;
	}
	public void setLibrary(java.lang.String library) {
		 this.library=library;
	}
	public java.lang.Integer getAssign() {
		return assign;
	}
	public void setAssign(java.lang.Integer assign) {
		 this.assign=assign;
	}
	public java.lang.Long getInstall_date() {
		return install_date;
	}
	public void setInstall_date(java.lang.Long install_date) {
		 this.install_date=install_date;
	}
}
