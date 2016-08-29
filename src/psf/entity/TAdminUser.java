package psf.entity;
public class TAdminUser extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer adminid = null;
	protected java.lang.String adminname = null;
	protected java.lang.String adminpass = null;
	protected java.lang.Integer adminrole = null;
	protected String [] _fields = new String[]{"adminid","adminname","adminpass","adminrole"};

	public TAdminUser() {
	}
	public String getTableName() {
		return "t_admin_user";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "adminid";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getAdminid() {
		return adminid;
	}
	public void setAdminid(java.lang.Integer adminid) {
		 this.adminid=adminid;
	}
	public java.lang.String getAdminname() {
		return adminname;
	}
	public void setAdminname(java.lang.String adminname) {
		 this.adminname=adminname;
	}
	public java.lang.String getAdminpass() {
		return adminpass;
	}
	public void setAdminpass(java.lang.String adminpass) {
		 this.adminpass=adminpass;
	}
	public java.lang.Integer getAdminrole() {
		return adminrole;
	}
	public void setAdminrole(java.lang.Integer adminrole) {
		 this.adminrole=adminrole;
	}
}
