package psf.entity;
public class EcsAdPosition extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer position_id = null;
	protected java.lang.String position_name = null;
	protected java.lang.Integer ad_width = null;
	protected java.lang.Integer ad_height = null;
	protected java.lang.String position_desc = null;
	protected java.lang.String position_style = null;
	protected String [] _fields = new String[]{"position_id","position_name","ad_width","ad_height","position_desc","position_style"};

	public EcsAdPosition() {
	}
	public String getTableName() {
		return "ecs_ad_position";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "position_id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getPosition_id() {
		return position_id;
	}
	public void setPosition_id(java.lang.Integer position_id) {
		 this.position_id=position_id;
	}
	public java.lang.String getPosition_name() {
		return position_name;
	}
	public void setPosition_name(java.lang.String position_name) {
		 this.position_name=position_name;
	}
	public java.lang.Integer getAd_width() {
		return ad_width;
	}
	public void setAd_width(java.lang.Integer ad_width) {
		 this.ad_width=ad_width;
	}
	public java.lang.Integer getAd_height() {
		return ad_height;
	}
	public void setAd_height(java.lang.Integer ad_height) {
		 this.ad_height=ad_height;
	}
	public java.lang.String getPosition_desc() {
		return position_desc;
	}
	public void setPosition_desc(java.lang.String position_desc) {
		 this.position_desc=position_desc;
	}
	public java.lang.String getPosition_style() {
		return position_style;
	}
	public void setPosition_style(java.lang.String position_style) {
		 this.position_style=position_style;
	}
}
