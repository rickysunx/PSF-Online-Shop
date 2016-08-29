package psf.entity;
public class TBadword extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer badwordid = null;
	protected java.lang.Integer badwordtype = null;
	protected java.lang.String badword = null;
	protected java.lang.Integer weight = null;
	protected String [] _fields = new String[]{"badwordid","badwordtype","badword","weight"};

	public TBadword() {
	}
	public String getTableName() {
		return "t_badword";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "badwordid";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getBadwordid() {
		return badwordid;
	}
	public void setBadwordid(java.lang.Integer badwordid) {
		 this.badwordid=badwordid;
	}
	public java.lang.Integer getBadwordtype() {
		return badwordtype;
	}
	public void setBadwordtype(java.lang.Integer badwordtype) {
		 this.badwordtype=badwordtype;
	}
	public java.lang.String getBadword() {
		return badword;
	}
	public void setBadword(java.lang.String badword) {
		 this.badword=badword;
	}
	public java.lang.Integer getWeight() {
		return weight;
	}
	public void setWeight(java.lang.Integer weight) {
		 this.weight=weight;
	}
}
