package psf.entity;
public class EcsSessionsData extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.String sesskey = null;
	protected java.lang.Long expiry = null;
	protected java.lang.String data = null;
	protected String [] _fields = new String[]{"sesskey","expiry","data"};

	public EcsSessionsData() {
	}
	public String getTableName() {
		return "ecs_sessions_data";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "sesskey";
	}
	public boolean isAutoIncrease() {
		return false;
	};
	public java.lang.String getSesskey() {
		return sesskey;
	}
	public void setSesskey(java.lang.String sesskey) {
		 this.sesskey=sesskey;
	}
	public java.lang.Long getExpiry() {
		return expiry;
	}
	public void setExpiry(java.lang.Long expiry) {
		 this.expiry=expiry;
	}
	public java.lang.String getData() {
		return data;
	}
	public void setData(java.lang.String data) {
		 this.data=data;
	}
}
