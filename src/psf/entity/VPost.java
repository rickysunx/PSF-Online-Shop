package psf.entity;
public class VPost extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.String username = null;
	protected java.lang.String avatarpic = null;
	protected java.lang.Integer showcount = null;
	protected java.lang.Integer shopexpcount = null;
	protected java.lang.Integer guidecount = null;
	protected java.lang.Integer postid = null;
	protected java.lang.Integer posttype = null;
	protected java.lang.Integer typeid = null;
	protected java.lang.Integer uid = null;
	protected java.lang.Integer replyid = null;
	protected java.lang.Integer shareid = null;
	protected java.lang.Integer forwardid = null;
	protected java.lang.String title = null;
	protected java.lang.String content = null;
	protected java.lang.Integer addtime = null;
	protected java.lang.String addip = null;
	protected java.lang.Integer delflag = null;
	protected java.lang.Integer cateid = null;
	protected java.lang.String catename = null;
	protected java.lang.Integer commentcount = null;
	protected java.lang.Integer sharecount = null;
	protected java.lang.Integer forwardcount = null;
	protected java.lang.Integer clickcount = null;
	protected java.lang.Integer likecount = null;
	protected java.lang.Integer lastreplytime = null;
	protected String [] _fields = new String[]{"username","avatarpic","showcount","shopexpcount","guidecount","postid","posttype","typeid","uid","replyid","shareid","forwardid","title","content","addtime","addip","delflag","cateid","catename","commentcount","sharecount","forwardcount","clickcount","likecount","lastreplytime"};

	public VPost() {
	}
	public String getTableName() {
		return "v_post";
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
	public java.lang.String getUsername() {
		return username;
	}
	public void setUsername(java.lang.String username) {
		 this.username=username;
	}
	public java.lang.String getAvatarpic() {
		return avatarpic;
	}
	public void setAvatarpic(java.lang.String avatarpic) {
		 this.avatarpic=avatarpic;
	}
	public java.lang.Integer getShowcount() {
		return showcount;
	}
	public void setShowcount(java.lang.Integer showcount) {
		 this.showcount=showcount;
	}
	public java.lang.Integer getShopexpcount() {
		return shopexpcount;
	}
	public void setShopexpcount(java.lang.Integer shopexpcount) {
		 this.shopexpcount=shopexpcount;
	}
	public java.lang.Integer getGuidecount() {
		return guidecount;
	}
	public void setGuidecount(java.lang.Integer guidecount) {
		 this.guidecount=guidecount;
	}
	public java.lang.Integer getPostid() {
		return postid;
	}
	public void setPostid(java.lang.Integer postid) {
		 this.postid=postid;
	}
	public java.lang.Integer getPosttype() {
		return posttype;
	}
	public void setPosttype(java.lang.Integer posttype) {
		 this.posttype=posttype;
	}
	public java.lang.Integer getTypeid() {
		return typeid;
	}
	public void setTypeid(java.lang.Integer typeid) {
		 this.typeid=typeid;
	}
	public java.lang.Integer getUid() {
		return uid;
	}
	public void setUid(java.lang.Integer uid) {
		 this.uid=uid;
	}
	public java.lang.Integer getReplyid() {
		return replyid;
	}
	public void setReplyid(java.lang.Integer replyid) {
		 this.replyid=replyid;
	}
	public java.lang.Integer getShareid() {
		return shareid;
	}
	public void setShareid(java.lang.Integer shareid) {
		 this.shareid=shareid;
	}
	public java.lang.Integer getForwardid() {
		return forwardid;
	}
	public void setForwardid(java.lang.Integer forwardid) {
		 this.forwardid=forwardid;
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
	public java.lang.Integer getAddtime() {
		return addtime;
	}
	public void setAddtime(java.lang.Integer addtime) {
		 this.addtime=addtime;
	}
	public java.lang.String getAddip() {
		return addip;
	}
	public void setAddip(java.lang.String addip) {
		 this.addip=addip;
	}
	public java.lang.Integer getDelflag() {
		return delflag;
	}
	public void setDelflag(java.lang.Integer delflag) {
		 this.delflag=delflag;
	}
	public java.lang.Integer getCateid() {
		return cateid;
	}
	public void setCateid(java.lang.Integer cateid) {
		 this.cateid=cateid;
	}
	public java.lang.String getCatename() {
		return catename;
	}
	public void setCatename(java.lang.String catename) {
		 this.catename=catename;
	}
	public java.lang.Integer getCommentcount() {
		return commentcount;
	}
	public void setCommentcount(java.lang.Integer commentcount) {
		 this.commentcount=commentcount;
	}
	public java.lang.Integer getSharecount() {
		return sharecount;
	}
	public void setSharecount(java.lang.Integer sharecount) {
		 this.sharecount=sharecount;
	}
	public java.lang.Integer getForwardcount() {
		return forwardcount;
	}
	public void setForwardcount(java.lang.Integer forwardcount) {
		 this.forwardcount=forwardcount;
	}
	public java.lang.Integer getClickcount() {
		return clickcount;
	}
	public void setClickcount(java.lang.Integer clickcount) {
		 this.clickcount=clickcount;
	}
	public java.lang.Integer getLikecount() {
		return likecount;
	}
	public void setLikecount(java.lang.Integer likecount) {
		 this.likecount=likecount;
	}
	public java.lang.Integer getLastreplytime() {
		return lastreplytime;
	}
	public void setLastreplytime(java.lang.Integer lastreplytime) {
		 this.lastreplytime=lastreplytime;
	}
}
