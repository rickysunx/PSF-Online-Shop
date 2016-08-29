package psf.entity;
public class EcsTag extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer tag_id = null;
	protected java.lang.Integer user_id = null;
	protected java.lang.Integer goods_id = null;
	protected java.lang.String tag_words = null;
	protected String [] _fields = new String[]{"tag_id","user_id","goods_id","tag_words"};

	public EcsTag() {
	}
	public String getTableName() {
		return "ecs_tag";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "tag_id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getTag_id() {
		return tag_id;
	}
	public void setTag_id(java.lang.Integer tag_id) {
		 this.tag_id=tag_id;
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
	public java.lang.String getTag_words() {
		return tag_words;
	}
	public void setTag_words(java.lang.String tag_words) {
		 this.tag_words=tag_words;
	}
}
