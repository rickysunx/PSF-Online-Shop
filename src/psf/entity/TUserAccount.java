package psf.entity;
public class TUserAccount extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer accountid = null;
	protected java.lang.Integer uid = null;
	protected java.lang.String accountname = null;
	protected java.lang.String bankname = null;
	protected java.lang.String accountcode = null;
	protected String [] _fields = new String[]{"accountid","uid","accountname","bankname","accountcode"};

	public TUserAccount() {
	}
	public String getTableName() {
		return "t_user_account";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "accountid";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getAccountid() {
		return accountid;
	}
	public void setAccountid(java.lang.Integer accountid) {
		 this.accountid=accountid;
	}
	public java.lang.Integer getUid() {
		return uid;
	}
	public void setUid(java.lang.Integer uid) {
		 this.uid=uid;
	}
	public java.lang.String getAccountname() {
		return accountname;
	}
	public void setAccountname(java.lang.String accountname) {
		 this.accountname=accountname;
	}
	public java.lang.String getBankname() {
		return bankname;
	}
	public void setBankname(java.lang.String bankname) {
		 this.bankname=bankname;
	}
	public java.lang.String getAccountcode() {
		return accountcode;
	}
	public void setAccountcode(java.lang.String accountcode) {
		 this.accountcode=accountcode;
	}
}
