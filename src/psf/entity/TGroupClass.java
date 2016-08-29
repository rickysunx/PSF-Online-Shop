package psf.entity;
public class TGroupClass extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer groupclassid = null;
	protected java.lang.String groupclassname = null;
	protected String [] _fields = new String[]{"groupclassid","groupclassname"};

	public TGroupClass() {
	}
	public String getTableName() {
		return "t_group_class";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "groupclassid";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getGroupclassid() {
		return groupclassid;
	}
	public void setGroupclassid(java.lang.Integer groupclassid) {
		 this.groupclassid=groupclassid;
	}
	public java.lang.String getGroupclassname() {
		return groupclassname;
	}
	public void setGroupclassname(java.lang.String groupclassname) {
		 this.groupclassname=groupclassname;
	}
}
