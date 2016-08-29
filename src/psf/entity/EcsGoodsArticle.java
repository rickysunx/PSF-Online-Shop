package psf.entity;
public class EcsGoodsArticle extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer goods_id = null;
	protected java.lang.Integer article_id = null;
	protected java.lang.Integer admin_id = null;
	protected String [] _fields = new String[]{"goods_id","article_id","admin_id"};

	public EcsGoodsArticle() {
	}
	public String getTableName() {
		return "ecs_goods_article";
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
	public java.lang.Integer getArticle_id() {
		return article_id;
	}
	public void setArticle_id(java.lang.Integer article_id) {
		 this.article_id=article_id;
	}
	public java.lang.Integer getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(java.lang.Integer admin_id) {
		 this.admin_id=admin_id;
	}
}
