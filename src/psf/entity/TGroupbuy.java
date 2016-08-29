package psf.entity;
public class TGroupbuy extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer groupbuyid = null;
	protected java.lang.Integer uid = null;
	protected java.lang.Integer pid = null;
	protected java.lang.String title = null;
	protected java.lang.Integer ucount = null;
	protected java.math.BigDecimal price = null;
	protected java.lang.Integer starttime = null;
	protected java.lang.Integer endtime = null;
	protected java.lang.Integer picid = null;
	protected java.lang.Integer status = null;
	protected String [] _fields = new String[]{"groupbuyid","uid","pid","title","ucount","price","starttime","endtime","picid","status"};

	public TGroupbuy() {
	}
	public String getTableName() {
		return "t_groupbuy";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "groupbuyid";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getGroupbuyid() {
		return groupbuyid;
	}
	public void setGroupbuyid(java.lang.Integer groupbuyid) {
		 this.groupbuyid=groupbuyid;
	}
	public java.lang.Integer getUid() {
		return uid;
	}
	public void setUid(java.lang.Integer uid) {
		 this.uid=uid;
	}
	public java.lang.Integer getPid() {
		return pid;
	}
	public void setPid(java.lang.Integer pid) {
		 this.pid=pid;
	}
	public java.lang.String getTitle() {
		return title;
	}
	public void setTitle(java.lang.String title) {
		 this.title=title;
	}
	public java.lang.Integer getUcount() {
		return ucount;
	}
	public void setUcount(java.lang.Integer ucount) {
		 this.ucount=ucount;
	}
	public java.math.BigDecimal getPrice() {
		return price;
	}
	public void setPrice(java.math.BigDecimal price) {
		 this.price=price;
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
	public java.lang.Integer getPicid() {
		return picid;
	}
	public void setPicid(java.lang.Integer picid) {
		 this.picid=picid;
	}
	public java.lang.Integer getStatus() {
		return status;
	}
	public void setStatus(java.lang.Integer status) {
		 this.status=status;
	}
}
