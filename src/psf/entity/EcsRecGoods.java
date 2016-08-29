package psf.entity;
public class EcsRecGoods extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Long id = null;
	protected java.lang.Integer goods_id = null;
	protected java.lang.Long rec_id = null;
	protected java.lang.Integer is_select = null;
	protected String [] _fields = new String[]{"Id","goods_id","rec_id","is_select"};

	public EcsRecGoods() {
	}
	public String getTableName() {
		return "ecs_rec_goods";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "Id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Long getId() {
		return id;
	}
	public void setId(java.lang.Long id) {
		 this.id=id;
	}
	public java.lang.Integer getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(java.lang.Integer goods_id) {
		 this.goods_id=goods_id;
	}
	public java.lang.Long getRec_id() {
		return rec_id;
	}
	public void setRec_id(java.lang.Long rec_id) {
		 this.rec_id=rec_id;
	}
	public java.lang.Integer getIs_select() {
		return is_select;
	}
	public void setIs_select(java.lang.Integer is_select) {
		 this.is_select=is_select;
	}
}
