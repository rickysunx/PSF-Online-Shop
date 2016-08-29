package psf.entity;
public class EcsGoodsGallery extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer img_id = null;
	protected java.lang.Integer goods_id = null;
	protected java.lang.String img_url = null;
	protected java.lang.String img_desc = null;
	protected java.lang.String thumb_url = null;
	protected java.lang.String img_original = null;
	protected java.lang.String taobao_code = null;
	protected String [] _fields = new String[]{"img_id","goods_id","img_url","img_desc","thumb_url","img_original","taobao_code"};

	public EcsGoodsGallery() {
	}
	public String getTableName() {
		return "ecs_goods_gallery";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "img_id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getImg_id() {
		return img_id;
	}
	public void setImg_id(java.lang.Integer img_id) {
		 this.img_id=img_id;
	}
	public java.lang.Integer getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(java.lang.Integer goods_id) {
		 this.goods_id=goods_id;
	}
	public java.lang.String getImg_url() {
		return img_url;
	}
	public void setImg_url(java.lang.String img_url) {
		 this.img_url=img_url;
	}
	public java.lang.String getImg_desc() {
		return img_desc;
	}
	public void setImg_desc(java.lang.String img_desc) {
		 this.img_desc=img_desc;
	}
	public java.lang.String getThumb_url() {
		return thumb_url;
	}
	public void setThumb_url(java.lang.String thumb_url) {
		 this.thumb_url=thumb_url;
	}
	public java.lang.String getImg_original() {
		return img_original;
	}
	public void setImg_original(java.lang.String img_original) {
		 this.img_original=img_original;
	}
	public java.lang.String getTaobao_code() {
		return taobao_code;
	}
	public void setTaobao_code(java.lang.String taobao_code) {
		 this.taobao_code=taobao_code;
	}
}
