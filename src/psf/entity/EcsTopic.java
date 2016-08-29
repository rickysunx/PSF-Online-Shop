package psf.entity;
public class EcsTopic extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Long topic_id = null;
	protected java.lang.String title = null;
	protected java.lang.String intro = null;
	protected java.lang.Integer start_time = null;
	protected java.lang.Integer end_time = null;
	protected java.lang.String data = null;
	protected java.lang.String template = null;
	protected java.lang.String css = null;
	protected java.lang.String topic_img = null;
	protected java.lang.String title_pic = null;
	protected java.lang.String base_style = null;
	protected java.lang.String htmls = null;
	protected java.lang.String keywords = null;
	protected java.lang.String description = null;
	protected String [] _fields = new String[]{"topic_id","title","intro","start_time","end_time","data","template","css","topic_img","title_pic","base_style","htmls","keywords","description"};

	public EcsTopic() {
	}
	public String getTableName() {
		return "ecs_topic";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "null";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Long getTopic_id() {
		return topic_id;
	}
	public void setTopic_id(java.lang.Long topic_id) {
		 this.topic_id=topic_id;
	}
	public java.lang.String getTitle() {
		return title;
	}
	public void setTitle(java.lang.String title) {
		 this.title=title;
	}
	public java.lang.String getIntro() {
		return intro;
	}
	public void setIntro(java.lang.String intro) {
		 this.intro=intro;
	}
	public java.lang.Integer getStart_time() {
		return start_time;
	}
	public void setStart_time(java.lang.Integer start_time) {
		 this.start_time=start_time;
	}
	public java.lang.Integer getEnd_time() {
		return end_time;
	}
	public void setEnd_time(java.lang.Integer end_time) {
		 this.end_time=end_time;
	}
	public java.lang.String getData() {
		return data;
	}
	public void setData(java.lang.String data) {
		 this.data=data;
	}
	public java.lang.String getTemplate() {
		return template;
	}
	public void setTemplate(java.lang.String template) {
		 this.template=template;
	}
	public java.lang.String getCss() {
		return css;
	}
	public void setCss(java.lang.String css) {
		 this.css=css;
	}
	public java.lang.String getTopic_img() {
		return topic_img;
	}
	public void setTopic_img(java.lang.String topic_img) {
		 this.topic_img=topic_img;
	}
	public java.lang.String getTitle_pic() {
		return title_pic;
	}
	public void setTitle_pic(java.lang.String title_pic) {
		 this.title_pic=title_pic;
	}
	public java.lang.String getBase_style() {
		return base_style;
	}
	public void setBase_style(java.lang.String base_style) {
		 this.base_style=base_style;
	}
	public java.lang.String getHtmls() {
		return htmls;
	}
	public void setHtmls(java.lang.String htmls) {
		 this.htmls=htmls;
	}
	public java.lang.String getKeywords() {
		return keywords;
	}
	public void setKeywords(java.lang.String keywords) {
		 this.keywords=keywords;
	}
	public java.lang.String getDescription() {
		return description;
	}
	public void setDescription(java.lang.String description) {
		 this.description=description;
	}
}
