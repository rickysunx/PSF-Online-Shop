package psf.vo.sns;

import java.io.Serializable;
import java.util.List;

import psf.Psf;
import psf.common.PsfTime;
import psf.vo.mall.BrandVO;
import psf.vo.mall.ProductVO;

public class PostListItemVO implements Serializable {

	protected Integer postid = null;
	protected Integer otype = null;
	
	/*用户属性*/
	protected Integer uid = null;
	protected String userName = null;
	protected String avatarFileName = null; //<picid>.jpg
	protected String signature = null;
	protected Integer showCount = null;
	protected Integer expCount = null;
	protected Integer guideCount = null;
	
	protected Integer shareCount = null;
	protected Integer forwardCount = null;
	protected Integer commentCount = null;
	protected Integer likeCount = null;
	
	protected String title = "";
	protected String content = null;
	protected String listContent = null;
	protected Integer addtime = null;
	
	protected boolean likedByMe = false;
	protected Integer forwardid = null;
	protected List<LikeUserVO> likeUserList = null;
	
	protected List<ProductVO> productList = null;
	protected List<PostPicVO> postpicList = null;
	protected List<BrandVO> brandList = null;
	
	protected PostListItemVO parentPost = null;	//父帖
	
	protected Integer typeid = null;	//圈子或者活动ID
	protected GroupVO group = null;	//圈子发言来自圈子
	protected TopicVO topic = null;	//圈子发言来自话题
	protected Boolean isShow = true;	//圈子中的发言是否对外公开
	
	protected Integer cateid = null;	//指南品牌所属分类ID
	protected String catename = null;	//指南品牌所属分类名称

	public Integer getUid() {
		return uid;
	}

	public String getUserName() {
		return userName;
	}
	
	public String getSignature() {
		return signature;
	}

	public void setSignature(String signature) {
		this.signature = signature;
	}

	//返回应该显示的图标的CSS样式
	public String getIconClass() {
		if(otype==Psf.OTYPE_Blog) return "icon_blog";
		if(otype==Psf.OTYPE_Show) return "icon_show";
		if(otype==Psf.OTYPE_Shopexp) return "icon_shopexp";
		if(otype==Psf.OTYPE_Guide) return "icon_guide";
		if(otype==Psf.OTYPE_Group) return "icon_user";
		if(otype==Psf.OTYPE_Forward) return "icon_forward";
		return "icon_blog";
	}

	public Integer getShowCount() {
		return showCount;
	}

	public Integer getExpCount() {
		return expCount;
	}

	public Integer getGuideCount() {
		return guideCount;
	}

	public Integer getShareCount() {
		return shareCount;
	}

	public Integer getForwardCount() {
		return forwardCount;
	}

	public Integer getCommentCount() {
		return commentCount;
	}

	public Integer getOtype() {
		return otype;
	}

	public String getTitle() {
		return title;
	}

	public String getContent() {
		return content;
	}

	public Integer getAddtime() {
		return addtime;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setShowCount(Integer showCount) {
		this.showCount = showCount;
	}

	public void setExpCount(Integer expCount) {
		this.expCount = expCount;
	}

	public void setGuideCount(Integer guideCount) {
		this.guideCount = guideCount;
	}

	public void setShareCount(Integer shareCount) {
		this.shareCount = shareCount;
	}

	public void setForwardCount(Integer forwardCount) {
		this.forwardCount = forwardCount;
	}

	public void setCommentCount(Integer commentCount) {
		this.commentCount = commentCount;
	}

	public void setOtype(Integer otype) {
		this.otype = otype;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setAddtime(Integer addtime) {
		this.addtime = addtime;
	}
	
	public String getTimepassed() {
		PsfTime time = new PsfTime(getAddtime());
		return time.getTimePassed();
	}
	
	public String getChnTime() {	// 公告发布时间
		PsfTime time = new PsfTime(getAddtime());
		return time.toChnDateString().split(" ")[0];
	}
	
	public String getAvatarFileName() {
		return avatarFileName;
	}

	public Integer getLikeCount() {
		return likeCount;
	}

	public void setAvatarFileName(String avatarFileName) {
		this.avatarFileName = avatarFileName;
	}

	public void setLikeCount(Integer likeCount) {
		this.likeCount = likeCount;
	}

	public List<LikeUserVO> getLikeUserList() {
		return likeUserList;
	}

	public void setLikeUserList(List<LikeUserVO> likeUserList) {
		this.likeUserList = likeUserList;
	}

	public Integer getPostid() {
		return postid;
	}

	public void setPostid(Integer postid) {
		this.postid = postid;
	}

	public boolean isLikedByMe() {
		return likedByMe;
	}

	public void setLikedByMe(boolean liked) {
		this.likedByMe = liked;
	}

	public Integer getForwardid() {
		return forwardid;
	}

	public void setForwardid(Integer forwardid) {
		this.forwardid = forwardid;
	}

	public String getListContent() {
		return listContent;
	}

	public void setListContent(String listContent) {
		this.listContent = listContent;
	}

	public List<ProductVO> getProductList() {
		return productList;
	}

	public List<PostPicVO> getPostpicList() {
		return postpicList;
	}

	public void setProductList(List<ProductVO> productList) {
		this.productList = productList;
	}

	public void setPostpicList(List<PostPicVO> postpicList) {
		this.postpicList = postpicList;
	}

	public List<BrandVO> getBrandList() {
		return brandList;
	}

	public void setBrandList(List<BrandVO> brandList) {
		this.brandList = brandList;
	}

	public Integer getTypeid() {
		return typeid;
	}

	public void setTypeid(Integer typeid) {
		this.typeid = typeid;
	}
	
	public GroupVO getGroup() {
		return group;
	}

	public void setGroup(GroupVO group) {
		this.group = group;
	}

	public PostListItemVO getParentPost() {
		return parentPost;
	}

	public void setParentPost(PostListItemVO parentPost) {
		this.parentPost = parentPost;
	}

	public Integer getCateid() {
		return cateid;
	}

	public void setCateid(Integer cateid) {
		this.cateid = cateid;
	}

	public String getCatename() {
		return catename;
	}

	public void setCatename(String catename) {
		this.catename = catename;
	}

	public TopicVO getTopic() {
		return topic;
	}

	public void setTopic(TopicVO topic) {
		this.topic = topic;
	}

	public Boolean getIsShow() {
		return isShow;
	}

	public void setIsShow(Boolean isShow) {
		this.isShow = isShow;
	}
}
