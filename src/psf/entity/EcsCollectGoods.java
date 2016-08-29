package psf.entity;
public class EcsCollectGoods extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer rec_id = null;
	protected java.lang.Integer user_id = null;
	protected java.lang.Integer goods_id = null;
	protected java.lang.Long add_time = null;
	protected java.lang.Integer is_attention = null;
	protected String [] _fields = new String[]{"rec_id","user_id","goods_id","add_time","is_attention"};

	public EcsCollectGoods() {
	}
	public String getTableName() {
		return "ecs_collect_goods";
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
	public java.lang.Integer getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(java.lang.Integer goods_id) {
		 this.goods_id=goods_id;
	}
	public java.lang.Long getAdd_time() {
		return add_time;
	}
	public void setAdd_time(java.lang.Long add_time) {
		 this.add_time=add_time;
	}
	public java.lang.Integer getIs_attention() {
		return is_attention;
	}
	public void setIs_attention(java.lang.Integer is_attention) {
		 this.is_attention=is_attention;
	}
}
