package psf.vo.sns;

import java.io.Serializable;
import java.util.List;

import psf.entity.TPic;
import psf.entity.TPost;

public class ShopexpVO extends TPost implements Serializable { 
	protected String username = null; //发布者用户名
	protected String avatarname = null;
	
	protected CommentVO lastComment = null;	//最后一天评论信息
	
	protected List<PostPicVO> pics = null;	//体验图片
	
	protected Boolean isLiked = false;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getAvatarname() {
		return avatarname;
	}
	public void setAvatarname(String avatarname) {
		this.avatarname = avatarname;
	}
	public CommentVO getLastComment() {
		return lastComment;
	}
	public void setLastComment(CommentVO lastComment) {
		this.lastComment = lastComment;
	}
	public List<PostPicVO> getPics() {
		return pics;
	}
	public void setPics(List<PostPicVO> pics) {
		this.pics = pics;
	}
	public Boolean getIsLiked() {
		return isLiked;
	}
	public void setIsLiked(Boolean isLiked) {
		this.isLiked = isLiked;
	}
	
}
