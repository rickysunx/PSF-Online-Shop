package psf.entity;
public class EcsAd extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer ad_id = null;
	protected java.lang.Integer position_id = null;
	protected java.lang.Integer media_type = null;
	protected java.lang.String ad_name = null;
	protected java.lang.String ad_link = null;
	protected java.lang.String ad_code = null;
	protected java.lang.Integer start_time = null;
	protected java.lang.Integer end_time = null;
	protected java.lang.String link_man = null;
	protected java.lang.String link_email = null;
	protected java.lang.String link_phone = null;
	protected java.lang.Integer click_count = null;
	protected java.lang.Integer enabled = null;
	protected String [] _fields = new String[]{"ad_id","position_id","media_type","ad_name","ad_link","ad_code","start_time","end_time","link_man","link_email","link_phone","click_count","enabled"};

	public EcsAd() {
	}
	public String getTableName() {
		return "ecs_ad";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "ad_id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getAd_id() {
		return ad_id;
	}
	public void setAd_id(java.lang.Integer ad_id) {
		 this.ad_id=ad_id;
	}
	public java.lang.Integer getPosition_id() {
		return position_id;
	}
	public void setPosition_id(java.lang.Integer position_id) {
		 this.position_id=position_id;
	}
	public java.lang.Integer getMedia_type() {
		return media_type;
	}
	public void setMedia_type(java.lang.Integer media_type) {
		 this.media_type=media_type;
	}
	public java.lang.String getAd_name() {
		return ad_name;
	}
	public void setAd_name(java.lang.String ad_name) {
		 this.ad_name=ad_name;
	}
	public java.lang.String getAd_link() {
		return ad_link;
	}
	public void setAd_link(java.lang.String ad_link) {
		 this.ad_link=ad_link;
	}
	public java.lang.String getAd_code() {
		return ad_code;
	}
	public void setAd_code(java.lang.String ad_code) {
		 this.ad_code=ad_code;
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
	public java.lang.String getLink_man() {
		return link_man;
	}
	public void setLink_man(java.lang.String link_man) {
		 this.link_man=link_man;
	}
	public java.lang.String getLink_email() {
		return link_email;
	}
	public void setLink_email(java.lang.String link_email) {
		 this.link_email=link_email;
	}
	public java.lang.String getLink_phone() {
		return link_phone;
	}
	public void setLink_phone(java.lang.String link_phone) {
		 this.link_phone=link_phone;
	}
	public java.lang.Integer getClick_count() {
		return click_count;
	}
	public void setClick_count(java.lang.Integer click_count) {
		 this.click_count=click_count;
	}
	public java.lang.Integer getEnabled() {
		return enabled;
	}
	public void setEnabled(java.lang.Integer enabled) {
		 this.enabled=enabled;
	}
}
