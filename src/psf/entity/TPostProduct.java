package psf.entity;
public class TPostProduct extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer postid = null;
	protected java.lang.Integer pid = null;
	protected java.lang.Integer iscover = null;
	protected String [] _fields = new String[]{"postid","pid","iscover"};

	public TPostProduct() {
	}
	public String getTableName() {
		return "t_post_product";
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
	public java.lang.Integer getPid() {
		return pid;
	}
	public void setPid(java.lang.Integer pid) {
		 this.pid=pid;
	}
	public java.lang.Integer getIscover() {
		return iscover;
	}
	public void setIscover(java.lang.Integer iscover) {
		 this.iscover=iscover;
	}
}
