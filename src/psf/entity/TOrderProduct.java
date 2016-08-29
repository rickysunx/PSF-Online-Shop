package psf.entity;
public class TOrderProduct extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer orderid = null;
	protected java.lang.Integer pid = null;
	protected java.math.BigDecimal price = null;
	protected java.lang.Integer pcount = null;
	protected String [] _fields = new String[]{"orderid","pid","price","pcount"};

	public TOrderProduct() {
	}
	public String getTableName() {
		return "t_order_product";
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
	public java.lang.Integer getOrderid() {
		return orderid;
	}
	public void setOrderid(java.lang.Integer orderid) {
		 this.orderid=orderid;
	}
	public java.lang.Integer getPid() {
		return pid;
	}
	public void setPid(java.lang.Integer pid) {
		 this.pid=pid;
	}
	public java.math.BigDecimal getPrice() {
		return price;
	}
	public void setPrice(java.math.BigDecimal price) {
		 this.price=price;
	}
	public java.lang.Integer getPcount() {
		return pcount;
	}
	public void setPcount(java.lang.Integer pcount) {
		 this.pcount=pcount;
	}
}
