package psf.entity;
public class EcsBookingGoods extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer rec_id = null;
	protected java.lang.Integer user_id = null;
	protected java.lang.String email = null;
	protected java.lang.String link_man = null;
	protected java.lang.String tel = null;
	protected java.lang.Integer goods_id = null;
	protected java.lang.String goods_desc = null;
	protected java.lang.Integer goods_number = null;
	protected java.lang.Long booking_time = null;
	protected java.lang.Integer is_dispose = null;
	protected java.lang.String dispose_user = null;
	protected java.lang.Long dispose_time = null;
	protected java.lang.String dispose_note = null;
	protected String [] _fields = new String[]{"rec_id","user_id","email","link_man","tel","goods_id","goods_desc","goods_number","booking_time","is_dispose","dispose_user","dispose_time","dispose_note"};

	public EcsBookingGoods() {
	}
	public String getTableName() {
		return "ecs_booking_goods";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "rec_id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getRec_id() {
		return rec_id;
	}
	public void setRec_id(java.lang.Integer rec_id) {
		 this.rec_id=rec_id;
	}
	public java.lang.Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(java.lang.Integer user_id) {
		 this.user_id=user_id;
	}
	public java.lang.String getEmail() {
		return email;
	}
	public void setEmail(java.lang.String email) {
		 this.email=email;
	}
	public java.lang.String getLink_man() {
		return link_man;
	}
	public void setLink_man(java.lang.String link_man) {
		 this.link_man=link_man;
	}
	public java.lang.String getTel() {
		return tel;
	}
	public void setTel(java.lang.String tel) {
		 this.tel=tel;
	}
	public java.lang.Integer getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(java.lang.Integer goods_id) {
		 this.goods_id=goods_id;
	}
	public java.lang.String getGoods_desc() {
		return goods_desc;
	}
	public void setGoods_desc(java.lang.String goods_desc) {
		 this.goods_desc=goods_desc;
	}
	public java.lang.Integer getGoods_number() {
		return goods_number;
	}
	public void setGoods_number(java.lang.Integer goods_number) {
		 this.goods_number=goods_number;
	}
	public java.lang.Long getBooking_time() {
		return booking_time;
	}
	public void setBooking_time(java.lang.Long booking_time) {
		 this.booking_time=booking_time;
	}
	public java.lang.Integer getIs_dispose() {
		return is_dispose;
	}
	public void setIs_dispose(java.lang.Integer is_dispose) {
		 this.is_dispose=is_dispose;
	}
	public java.lang.String getDispose_user() {
		return dispose_user;
	}
	public void setDispose_user(java.lang.String dispose_user) {
		 this.dispose_user=dispose_user;
	}
	public java.lang.Long getDispose_time() {
		return dispose_time;
	}
	public void setDispose_time(java.lang.Long dispose_time) {
		 this.dispose_time=dispose_time;
	}
	public java.lang.String getDispose_note() {
		return dispose_note;
	}
	public void setDispose_note(java.lang.String dispose_note) {
		 this.dispose_note=dispose_note;
	}
}
