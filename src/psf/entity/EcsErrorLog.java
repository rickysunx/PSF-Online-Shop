package psf.entity;
public class EcsErrorLog extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer id = null;
	protected java.lang.String info = null;
	protected java.lang.String file = null;
	protected java.lang.Integer time = null;
	protected String [] _fields = new String[]{"id","info","file","time"};

	public EcsErrorLog() {
	}
	public String getTableName() {
		return "ecs_error_log";
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
	public java.lang.String getInfo() {
		return info;
	}
	public void setInfo(java.lang.String info) {
		 this.info=info;
	}
	public java.lang.String getFile() {
		return file;
	}
	public void setFile(java.lang.String file) {
		 this.file=file;
	}
	public java.lang.Integer getTime() {
		return time;
	}
	public void setTime(java.lang.Integer time) {
		 this.time=time;
	}
}
