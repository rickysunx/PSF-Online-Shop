package psf.vo.sns;

import java.io.Serializable;
import java.util.List;

import psf.entity.TPic;
import psf.entity.TPost;
import psf.vo.mall.BrandVO;

public class GuideVO extends TPost implements Serializable {
	protected String username = null; //发布者用户名
	protected String avatarName = null;	//用户头像
	protected CommentVO lastComment = null;	//最后的评论
	protected List<BrandVO> brands = null;	//品牌列表
	protected List<PostPicVO> pics = null;	//指南图片
	protected Boolean isLiked = false; //是否已经喜欢
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getAvatarName() {
		return avatarName;
	}
	public void setAvatarName(String avatarName) {
		this.avatarName = avatarName;
	}
	public CommentVO getLastComment() {
		return lastComment;
	}
	public void setLastComment(CommentVO lastComment) {
		this.lastComment = lastComment;
	}
	public List<BrandVO> getBrands() {
		return brands;
	}
	public void setBrands(List<BrandVO> brands) {
		this.brands = brands;
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
