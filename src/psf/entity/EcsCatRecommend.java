package psf.entity;
public class EcsCatRecommend extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer cat_id = null;
	protected java.lang.Integer recommend_type = null;
	protected String [] _fields = new String[]{"cat_id","recommend_type"};

	public EcsCatRecommend() {
	}
	public String getTableName() {
		return "ecs_cat_recommend";
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
	public java.lang.Integer getCat_id() {
		return cat_id;
	}
	public void setCat_id(java.lang.Integer cat_id) {
		 this.cat_id=cat_id;
	}
	public java.lang.Integer getRecommend_type() {
		return recommend_type;
	}
	public void setRecommend_type(java.lang.Integer recommend_type) {
		 this.recommend_type=recommend_type;
	}
}
