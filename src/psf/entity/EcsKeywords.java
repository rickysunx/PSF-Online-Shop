package psf.entity;
public class EcsKeywords extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.sql.Date date = null;
	protected java.lang.String searchengine = null;
	protected java.lang.String keyword = null;
	protected java.lang.Integer count = null;
	protected String [] _fields = new String[]{"date","searchengine","keyword","count"};

	public EcsKeywords() {
	}
	public String getTableName() {
		return "ecs_keywords";
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
	public java.sql.Date getDate() {
		return date;
	}
	public void setDate(java.sql.Date date) {
		 this.date=date;
	}
	public java.lang.String getSearchengine() {
		return searchengine;
	}
	public void setSearchengine(java.lang.String searchengine) {
		 this.searchengine=searchengine;
	}
	public java.lang.String getKeyword() {
		return keyword;
	}
	public void setKeyword(java.lang.String keyword) {
		 this.keyword=keyword;
	}
	public java.lang.Integer getCount() {
		return count;
	}
	public void setCount(java.lang.Integer count) {
		 this.count=count;
	}
}
