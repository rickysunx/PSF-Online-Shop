package psf.entity;
public class TProductScore extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer pid = null;
	protected java.lang.Integer orderid = null;
	protected java.lang.Integer uid = null;
	protected java.lang.Integer addtime = null;
	protected java.lang.Integer score = null;
	protected String [] _fields = new String[]{"pid","orderid","uid","addtime","score"};

	public TProductScore() {
	}
	public String getTableName() {
		return "t_product_score";
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
	public java.lang.Integer getPid() {
		return pid;
	}
	public void setPid(java.lang.Integer pid) {
		 this.pid=pid;
	}
	public java.lang.Integer getOrderid() {
		return orderid;
	}
	public void setOrderid(java.lang.Integer orderid) {
		 this.orderid=orderid;
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
	public java.lang.Integer getScore() {
		return score;
	}
	public void setScore(java.lang.Integer score) {
		 this.score=score;
	}
}
