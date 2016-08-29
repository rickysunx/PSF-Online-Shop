package psf.entity;
public class TPostTopic extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer postid = null;
	protected java.lang.Integer topicid = null;
	protected String [] _fields = new String[]{"postid","topicid"};

	public TPostTopic() {
	}
	public String getTableName() {
		return "t_post_topic";
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
	public java.lang.Integer getTopicid() {
		return topicid;
	}
	public void setTopicid(java.lang.Integer topicid) {
		 this.topicid=topicid;
	}
}
