package psf.entity;
public class EcsUserFeed extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer feed_id = null;
	protected java.lang.Integer user_id = null;
	protected java.lang.Integer value_id = null;
	protected java.lang.Integer goods_id = null;
	protected java.lang.Integer feed_type = null;
	protected java.lang.Integer is_feed = null;
	protected String [] _fields = new String[]{"feed_id","user_id","value_id","goods_id","feed_type","is_feed"};

	public EcsUserFeed() {
	}
	public String getTableName() {
		return "ecs_user_feed";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "feed_id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getFeed_id() {
		return feed_id;
	}
	public void setFeed_id(java.lang.Integer feed_id) {
		 this.feed_id=feed_id;
	}
	public java.lang.Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(java.lang.Integer user_id) {
		 this.user_id=user_id;
	}
	public java.lang.Integer getValue_id() {
		return value_id;
	}
	public void setValue_id(java.lang.Integer value_id) {
		 this.value_id=value_id;
	}
	public java.lang.Integer getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(java.lang.Integer goods_id) {
		 this.goods_id=goods_id;
	}
	public java.lang.Integer getFeed_type() {
		return feed_type;
	}
	public void setFeed_type(java.lang.Integer feed_type) {
		 this.feed_type=feed_type;
	}
	public java.lang.Integer getIs_feed() {
		return is_feed;
	}
	public void setIs_feed(java.lang.Integer is_feed) {
		 this.is_feed=is_feed;
	}
}
