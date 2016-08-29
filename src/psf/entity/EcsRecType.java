package psf.entity;
public class EcsRecType extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer rec_id = null;
	protected java.lang.String rec_name = null;
	protected java.lang.String rec_desc = null;
	protected java.lang.Integer rec_order = null;
	protected String [] _fields = new String[]{"rec_id","rec_name","rec_desc","rec_order"};

	public EcsRecType() {
	}
	public String getTableName() {
		return "ecs_rec_type";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "rec_id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getRec_id() {
		return rec_id;
	}
	public void setRec_id(java.lang.Integer rec_id) {
		 this.rec_id=rec_id;
	}
	public java.lang.String getRec_name() {
		return rec_name;
	}
	public void setRec_name(java.lang.String rec_name) {
		 this.rec_name=rec_name;
	}
	public java.lang.String getRec_desc() {
		return rec_desc;
	}
	public void setRec_desc(java.lang.String rec_desc) {
		 this.rec_desc=rec_desc;
	}
	public java.lang.Integer getRec_order() {
		return rec_order;
	}
	public void setRec_order(java.lang.Integer rec_order) {
		 this.rec_order=rec_order;
	}
}
