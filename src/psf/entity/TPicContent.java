package psf.entity;
public class TPicContent extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer picid = null;
	protected java.lang.Integer width = null;
	protected java.lang.Integer height = null;
	protected java.lang.Integer thumbid = null;
	protected byte [] content = null;
	protected String [] _fields = new String[]{"picid","width","height","thumbid","content"};

	public TPicContent() {
	}
	public String getTableName() {
		return "t_pic_content";
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
	public java.lang.Integer getPicid() {
		return picid;
	}
	public void setPicid(java.lang.Integer picid) {
		 this.picid=picid;
	}
	public java.lang.Integer getWidth() {
		return width;
	}
	public void setWidth(java.lang.Integer width) {
		 this.width=width;
	}
	public java.lang.Integer getHeight() {
		return height;
	}
	public void setHeight(java.lang.Integer height) {
		 this.height=height;
	}
	public java.lang.Integer getThumbid() {
		return thumbid;
	}
	public void setThumbid(java.lang.Integer thumbid) {
		 this.thumbid=thumbid;
	}
	public byte [] getContent() {
		return content;
	}
	public void setContent(byte [] content) {
		 this.content=content;
	}
}
