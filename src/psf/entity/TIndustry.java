package psf.entity;
public class TIndustry extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer industryid = null;
	protected java.lang.String industryname = null;
	protected java.lang.Integer parentid = null;
	protected String [] _fields = new String[]{"industryid","industryname","parentid"};

	public TIndustry() {
	}
	public String getTableName() {
		return "t_industry";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "industryid";
	}
	public boolean isAutoIncrease() {
		return false;
	};
	public java.lang.Integer getIndustryid() {
		return industryid;
	}
	public void setIndustryid(java.lang.Integer industryid) {
		 this.industryid=industryid;
	}
	public java.lang.String getIndustryname() {
		return industryname;
	}
	public void setIndustryname(java.lang.String industryname) {
		 this.industryname=industryname;
	}
	public java.lang.Integer getParentid() {
		return parentid;
	}
	public void setParentid(java.lang.Integer parentid) {
		 this.parentid=parentid;
	}
}
