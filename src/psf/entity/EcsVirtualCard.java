package psf.entity;
public class EcsVirtualCard extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer card_id = null;
	protected java.lang.Integer goods_id = null;
	protected java.lang.String card_sn = null;
	protected java.lang.String card_password = null;
	protected java.lang.Integer add_date = null;
	protected java.lang.Integer end_date = null;
	protected java.lang.Integer is_saled = null;
	protected java.lang.String order_sn = null;
	protected java.lang.Integer crc32 = null;
	protected String [] _fields = new String[]{"card_id","goods_id","card_sn","card_password","add_date","end_date","is_saled","order_sn","crc32"};

	public EcsVirtualCard() {
	}
	public String getTableName() {
		return "ecs_virtual_card";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "card_id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getCard_id() {
		return card_id;
	}
	public void setCard_id(java.lang.Integer card_id) {
		 this.card_id=card_id;
	}
	public java.lang.Integer getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(java.lang.Integer goods_id) {
		 this.goods_id=goods_id;
	}
	public java.lang.String getCard_sn() {
		return card_sn;
	}
	public void setCard_sn(java.lang.String card_sn) {
		 this.card_sn=card_sn;
	}
	public java.lang.String getCard_password() {
		return card_password;
	}
	public void setCard_password(java.lang.String card_password) {
		 this.card_password=card_password;
	}
	public java.lang.Integer getAdd_date() {
		return add_date;
	}
	public void setAdd_date(java.lang.Integer add_date) {
		 this.add_date=add_date;
	}
	public java.lang.Integer getEnd_date() {
		return end_date;
	}
	public void setEnd_date(java.lang.Integer end_date) {
		 this.end_date=end_date;
	}
	public java.lang.Integer getIs_saled() {
		return is_saled;
	}
	public void setIs_saled(java.lang.Integer is_saled) {
		 this.is_saled=is_saled;
	}
	public java.lang.String getOrder_sn() {
		return order_sn;
	}
	public void setOrder_sn(java.lang.String order_sn) {
		 this.order_sn=order_sn;
	}
	public java.lang.Integer getCrc32() {
		return crc32;
	}
	public void setCrc32(java.lang.Integer crc32) {
		 this.crc32=crc32;
	}
}
