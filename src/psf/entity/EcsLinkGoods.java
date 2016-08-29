package psf.entity;
public class EcsLinkGoods extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer goods_id = null;
	protected java.lang.Integer link_goods_id = null;
	protected java.lang.Integer is_double = null;
	protected java.lang.Integer admin_id = null;
	protected String [] _fields = new String[]{"goods_id","link_goods_id","is_double","admin_id"};

	public EcsLinkGoods() {
	}
	public String getTableName() {
		return "ecs_link_goods";
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
	public java.lang.Integer getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(java.lang.Integer goods_id) {
		 this.goods_id=goods_id;
	}
	public java.lang.Integer getLink_goods_id() {
		return link_goods_id;
	}
	public void setLink_goods_id(java.lang.Integer link_goods_id) {
		 this.link_goods_id=link_goods_id;
	}
	public java.lang.Integer getIs_double() {
		return is_double;
	}
	public void setIs_double(java.lang.Integer is_double) {
		 this.is_double=is_double;
	}
	public java.lang.Integer getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(java.lang.Integer admin_id) {
		 this.admin_id=admin_id;
	}
}
