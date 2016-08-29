package psf.entity;
public class TTopic extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer topicid = null;
	protected java.lang.String topictitle = null;
	protected java.lang.Integer topictype = null;
	protected java.lang.Integer groupid = null;
	protected java.lang.Integer uid = null;
	protected java.lang.Integer postcount = null;
	protected java.lang.Integer addtime = null;
	protected java.lang.Integer lastreplytime = null;
	protected java.lang.Integer delflag = null;
	protected String [] _fields = new String[]{"topicid","topictitle","topictype","groupid","uid","postcount","addtime","lastreplytime","delflag"};

	public TTopic() {
	}
	public String getTableName() {
		return "t_topic";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "topicid";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getTopicid() {
		return topicid;
	}
	public void setTopicid(java.lang.Integer topicid) {
		 this.topicid=topicid;
	}
	public java.lang.String getTopictitle() {
		return topictitle;
	}
	public void setTopictitle(java.lang.String topictitle) {
		 this.topictitle=topictitle;
	}
	public java.lang.Integer getTopictype() {
		return topictype;
	}
	public void setTopictype(java.lang.Integer topictype) {
		 this.topictype=topictype;
	}
	public java.lang.Integer getGroupid() {
		return groupid;
	}
	public void setGroupid(java.lang.Integer groupid) {
		 this.groupid=groupid;
	}
	public java.lang.Integer getUid() {
		return uid;
	}
	public void setUid(java.lang.Integer uid) {
		 this.uid=uid;
	}
	public java.lang.Integer getPostcount() {
		return postcount;
	}
	public void setPostcount(java.lang.Integer postcount) {
		 this.postcount=postcount;
	}
	public java.lang.Integer getAddtime() {
		return addtime;
	}
	public void setAddtime(java.lang.Integer addtime) {
		 this.addtime=addtime;
	}
	public java.lang.Integer getLastreplytime() {
		return lastreplytime;
	}
	public void setLastreplytime(java.lang.Integer lastreplytime) {
		 this.lastreplytime=lastreplytime;
	}
	public java.lang.Integer getDelflag() {
		return delflag;
	}
	public void setDelflag(java.lang.Integer delflag) {
		 this.delflag=delflag;
	}
}
