package psf.entity;
public class TUserCash extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer cashid = null;
	protected java.lang.Integer uid = null;
	protected java.lang.Integer addtime = null;
	protected java.math.BigDecimal amount = null;
	protected java.lang.String summary = null;
	protected String [] _fields = new String[]{"cashid","uid","addtime","amount","summary"};

	public TUserCash() {
	}
	public String getTableName() {
		return "t_user_cash";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "cashid";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getCashid() {
		return cashid;
	}
	public void setCashid(java.lang.Integer cashid) {
		 this.cashid=cashid;
	}
	public java.lang.Integer getUid() {
		return uid;
	}
	public void setUid(java.lang.Integer uid) {
		 this.uid=uid;
	}
	public java.lang.Integer getAddtime() {
		return addtime;
	}
	public void setAddtime(java.lang.Integer addtime) {
		 this.addtime=addtime;
	}
	public java.math.BigDecimal getAmount() {
		return amount;
	}
	public void setAmount(java.math.BigDecimal amount) {
		 this.amount=amount;
	}
	public java.lang.String getSummary() {
		return summary;
	}
	public void setSummary(java.lang.String summary) {
		 this.summary=summary;
	}
}
