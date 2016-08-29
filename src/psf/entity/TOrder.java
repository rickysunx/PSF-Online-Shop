package psf.entity;
public class TOrder extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer orderid = null;
	protected java.lang.Integer uid = null;
	protected java.lang.String consignee = null;
	protected java.lang.Integer shipping_status = null;
	protected java.lang.Integer order_status = null;
	protected String [] _fields = new String[]{"orderid","uid","consignee","shipping_status","order_status"};

	public TOrder() {
	}
	public String getTableName() {
		return "t_order";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "null";
	}
	public boolean isAutoIncrease() {
		return true;
	};
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
	public java.lang.String getConsignee() {
		return consignee;
	}
	public void setConsignee(java.lang.String consignee) {
		 this.consignee=consignee;
	}
	public java.lang.Integer getShipping_status() {
		return shipping_status;
	}
	public void setShipping_status(java.lang.Integer shipping_status) {
		 this.shipping_status=shipping_status;
	}
	public java.lang.Integer getOrder_status() {
		return order_status;
	}
	public void setOrder_status(java.lang.Integer order_status) {
		 this.order_status=order_status;
	}
}
