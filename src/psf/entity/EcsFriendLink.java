package psf.entity;
public class EcsFriendLink extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer link_id = null;
	protected java.lang.String link_name = null;
	protected java.lang.String link_url = null;
	protected java.lang.String link_logo = null;
	protected java.lang.Integer show_order = null;
	protected String [] _fields = new String[]{"link_id","link_name","link_url","link_logo","show_order"};

	public EcsFriendLink() {
	}
	public String getTableName() {
		return "ecs_friend_link";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "link_id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getLink_id() {
		return link_id;
	}
	public void setLink_id(java.lang.Integer link_id) {
		 this.link_id=link_id;
	}
	public java.lang.String getLink_name() {
		return link_name;
	}
	public void setLink_name(java.lang.String link_name) {
		 this.link_name=link_name;
	}
	public java.lang.String getLink_url() {
		return link_url;
	}
	public void setLink_url(java.lang.String link_url) {
		 this.link_url=link_url;
	}
	public java.lang.String getLink_logo() {
		return link_logo;
	}
	public void setLink_logo(java.lang.String link_logo) {
		 this.link_logo=link_logo;
	}
	public java.lang.Integer getShow_order() {
		return show_order;
	}
	public void setShow_order(java.lang.Integer show_order) {
		 this.show_order=show_order;
	}
}
