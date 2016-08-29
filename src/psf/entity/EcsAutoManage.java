package psf.entity;
public class EcsAutoManage extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer item_id = null;
	protected java.lang.String type = null;
	protected java.lang.Integer starttime = null;
	protected java.lang.Integer endtime = null;
	protected String [] _fields = new String[]{"item_id","type","starttime","endtime"};

	public EcsAutoManage() {
	}
	public String getTableName() {
		return "ecs_auto_manage";
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
	public java.lang.Integer getItem_id() {
		return item_id;
	}
	public void setItem_id(java.lang.Integer item_id) {
		 this.item_id=item_id;
	}
	public java.lang.String getType() {
		return type;
	}
	public void setType(java.lang.String type) {
		 this.type=type;
	}
	public java.lang.Integer getStarttime() {
		return starttime;
	}
	public void setStarttime(java.lang.Integer starttime) {
		 this.starttime=starttime;
	}
	public java.lang.Integer getEndtime() {
		return endtime;
	}
	public void setEndtime(java.lang.Integer endtime) {
		 this.endtime=endtime;
	}
}
