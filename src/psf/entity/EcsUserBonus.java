package psf.entity;
public class EcsUserBonus extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer bonus_id = null;
	protected java.lang.Integer bonus_type_id = null;
	protected java.math.BigInteger bonus_sn = null;
	protected java.lang.Integer user_id = null;
	protected java.lang.Long used_time = null;
	protected java.lang.Integer order_id = null;
	protected java.lang.Integer emailed = null;
	protected String [] _fields = new String[]{"bonus_id","bonus_type_id","bonus_sn","user_id","used_time","order_id","emailed"};

	public EcsUserBonus() {
	}
	public String getTableName() {
		return "ecs_user_bonus";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "bonus_id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getBonus_id() {
		return bonus_id;
	}
	public void setBonus_id(java.lang.Integer bonus_id) {
		 this.bonus_id=bonus_id;
	}
	public java.lang.Integer getBonus_type_id() {
		return bonus_type_id;
	}
	public void setBonus_type_id(java.lang.Integer bonus_type_id) {
		 this.bonus_type_id=bonus_type_id;
	}
	public java.math.BigInteger getBonus_sn() {
		return bonus_sn;
	}
	public void setBonus_sn(java.math.BigInteger bonus_sn) {
		 this.bonus_sn=bonus_sn;
	}
	public java.lang.Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(java.lang.Integer user_id) {
		 this.user_id=user_id;
	}
	public java.lang.Long getUsed_time() {
		return used_time;
	}
	public void setUsed_time(java.lang.Long used_time) {
		 this.used_time=used_time;
	}
	public java.lang.Integer getOrder_id() {
		return order_id;
	}
	public void setOrder_id(java.lang.Integer order_id) {
		 this.order_id=order_id;
	}
	public java.lang.Integer getEmailed() {
		return emailed;
	}
	public void setEmailed(java.lang.Integer emailed) {
		 this.emailed=emailed;
	}
}
