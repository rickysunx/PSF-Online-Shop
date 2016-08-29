package psf.entity;
public class EcsPack extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer pack_id = null;
	protected java.lang.String pack_name = null;
	protected java.lang.String pack_img = null;
	protected java.math.BigDecimal pack_fee = null;
	protected java.lang.Integer free_money = null;
	protected java.lang.String pack_desc = null;
	protected String [] _fields = new String[]{"pack_id","pack_name","pack_img","pack_fee","free_money","pack_desc"};

	public EcsPack() {
	}
	public String getTableName() {
		return "ecs_pack";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "pack_id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getPack_id() {
		return pack_id;
	}
	public void setPack_id(java.lang.Integer pack_id) {
		 this.pack_id=pack_id;
	}
	public java.lang.String getPack_name() {
		return pack_name;
	}
	public void setPack_name(java.lang.String pack_name) {
		 this.pack_name=pack_name;
	}
	public java.lang.String getPack_img() {
		return pack_img;
	}
	public void setPack_img(java.lang.String pack_img) {
		 this.pack_img=pack_img;
	}
	public java.math.BigDecimal getPack_fee() {
		return pack_fee;
	}
	public void setPack_fee(java.math.BigDecimal pack_fee) {
		 this.pack_fee=pack_fee;
	}
	public java.lang.Integer getFree_money() {
		return free_money;
	}
	public void setFree_money(java.lang.Integer free_money) {
		 this.free_money=free_money;
	}
	public java.lang.String getPack_desc() {
		return pack_desc;
	}
	public void setPack_desc(java.lang.String pack_desc) {
		 this.pack_desc=pack_desc;
	}
}
