package psf.entity;
public class TEventMember extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer eventid = null;
	protected java.lang.Integer uid = null;
	protected String [] _fields = new String[]{"eventid","uid"};

	public TEventMember() {
	}
	public String getTableName() {
		return "t_event_member";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "null";
	}
	public boolean isAutoIncrease() {
		return false;
	};
	public java.lang.Integer getEventid() {
		return eventid;
	}
	public void setEventid(java.lang.Integer eventid) {
		 this.eventid=eventid;
	}
	public java.lang.Integer getUid() {
		return uid;
	}
	public void setUid(java.lang.Integer uid) {
		 this.uid=uid;
	}
}
