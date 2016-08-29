package psf.entity;
public class VProductPic extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer postid = null;
	protected java.lang.Integer picid = null;
	protected java.lang.Integer iscover = null;
	protected java.lang.String pictitle = null;
	protected java.lang.String picname = null;
	protected String [] _fields = new String[]{"postid","picid","iscover","pictitle","picname"};

	public VProductPic() {
	}
	public String getTableName() {
		return "v_product_pic";
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
	public java.lang.Integer getPostid() {
		return postid;
	}
	public void setPostid(java.lang.Integer postid) {
		 this.postid=postid;
	}
	public java.lang.Integer getPicid() {
		return picid;
	}
	public void setPicid(java.lang.Integer picid) {
		 this.picid=picid;
	}
	public java.lang.Integer getIscover() {
		return iscover;
	}
	public void setIscover(java.lang.Integer iscover) {
		 this.iscover=iscover;
	}
	public java.lang.String getPictitle() {
		return pictitle;
	}
	public void setPictitle(java.lang.String pictitle) {
		 this.pictitle=pictitle;
	}
	public java.lang.String getPicname() {
		return picname;
	}
	public void setPicname(java.lang.String picname) {
		 this.picname=picname;
	}
}
