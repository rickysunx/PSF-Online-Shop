package psf.entity;
public class EcsArticle extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer article_id = null;
	protected java.lang.Integer cat_id = null;
	protected java.lang.String title = null;
	protected java.lang.String content = null;
	protected java.lang.String author = null;
	protected java.lang.String author_email = null;
	protected java.lang.String keywords = null;
	protected java.lang.Integer article_type = null;
	protected java.lang.Integer is_open = null;
	protected java.lang.Long add_time = null;
	protected java.lang.String file_url = null;
	protected java.lang.Integer open_type = null;
	protected java.lang.String link = null;
	protected java.lang.String description = null;
	protected String [] _fields = new String[]{"article_id","cat_id","title","content","author","author_email","keywords","article_type","is_open","add_time","file_url","open_type","link","description"};

	public EcsArticle() {
	}
	public String getTableName() {
		return "ecs_article";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "article_id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getArticle_id() {
		return article_id;
	}
	public void setArticle_id(java.lang.Integer article_id) {
		 this.article_id=article_id;
	}
	public java.lang.Integer getCat_id() {
		return cat_id;
	}
	public void setCat_id(java.lang.Integer cat_id) {
		 this.cat_id=cat_id;
	}
	public java.lang.String getTitle() {
		return title;
	}
	public void setTitle(java.lang.String title) {
		 this.title=title;
	}
	public java.lang.String getContent() {
		return content;
	}
	public void setContent(java.lang.String content) {
		 this.content=content;
	}
	public java.lang.String getAuthor() {
		return author;
	}
	public void setAuthor(java.lang.String author) {
		 this.author=author;
	}
	public java.lang.String getAuthor_email() {
		return author_email;
	}
	public void setAuthor_email(java.lang.String author_email) {
		 this.author_email=author_email;
	}
	public java.lang.String getKeywords() {
		return keywords;
	}
	public void setKeywords(java.lang.String keywords) {
		 this.keywords=keywords;
	}
	public java.lang.Integer getArticle_type() {
		return article_type;
	}
	public void setArticle_type(java.lang.Integer article_type) {
		 this.article_type=article_type;
	}
	public java.lang.Integer getIs_open() {
		return is_open;
	}
	public void setIs_open(java.lang.Integer is_open) {
		 this.is_open=is_open;
	}
	public java.lang.Long getAdd_time() {
		return add_time;
	}
	public void setAdd_time(java.lang.Long add_time) {
		 this.add_time=add_time;
	}
	public java.lang.String getFile_url() {
		return file_url;
	}
	public void setFile_url(java.lang.String file_url) {
		 this.file_url=file_url;
	}
	public java.lang.Integer getOpen_type() {
		return open_type;
	}
	public void setOpen_type(java.lang.Integer open_type) {
		 this.open_type=open_type;
	}
	public java.lang.String getLink() {
		return link;
	}
	public void setLink(java.lang.String link) {
		 this.link=link;
	}
	public java.lang.String getDescription() {
		return description;
	}
	public void setDescription(java.lang.String description) {
		 this.description=description;
	}
}
