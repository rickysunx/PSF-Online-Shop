package psf.vo.sns;

import java.io.Serializable;
import java.util.List;

import psf.common.PsfTime;
import psf.entity.TComment;

/**
 * 评论扩展类：toid和touid实时变动，replyid为最顶层评论ID
 * @author siv_user
 *
 */
public class CommentVO extends TComment implements Serializable {
	
	protected String username = null;
	protected String remarkname = null;
	protected Integer showCount = null;
	protected Integer shopexpCount = null;
	protected Integer guideCount = null;
	protected Integer forwardCount = null;
	protected Integer shareCount = null;	
	protected Integer commentCount = null;	//回复数
	protected String tousername = null;
	protected String avatarFileName = null;
	
	protected List<CommentVO> replyComments = null;
	protected String commentInfo = null;

	protected String fromGroupName = null;	//评论出自圈子名称
	protected String fromPostTitle = null;	//评论出自话题
	
	public String getCommentInfo() {
		return commentInfo;
	}

	public void setCommentInfo(String commentInfo) {
		this.commentInfo = commentInfo;
	}

	public String getTousername() {
		return tousername;
	}

	public void setTousername(String tousername) {
		this.tousername = tousername;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	public String getAvatarFileName() {
		return avatarFileName;
	}

	public void setAvatarFileName(String avatarName) {
		this.avatarFileName = avatarName;
	}

	public List<CommentVO> getReplyComments() {
		return replyComments;
	}

	public void setReplyComments(List<CommentVO> replyComments) {
		this.replyComments = replyComments;
	}
	
	public String getChnTime() {
		return new PsfTime(getAddtime()).toChnDateString();
	}
	
	public String getTimepassed() {
		return new PsfTime(getAddtime()).getTimePassed();
	}

	public Integer getShowCount() {
		return showCount;
	}

	public void setShowCount(Integer showCount) {
		this.showCount = showCount;
	}

	public Integer getShopexpCount() {
		return shopexpCount;
	}

	public void setShopexpCount(Integer shopexpCount) {
		this.shopexpCount = shopexpCount;
	}

	public Integer getGuideCount() {
		return guideCount;
	}

	public void setGuideCount(Integer guideCount) {
		this.guideCount = guideCount;
	}

	public String getFromGroupName() {
		return fromGroupName;
	}

	public void setFromGroupName(String fromGroupName) {
		this.fromGroupName = fromGroupName;
	}

	public String getFromPostTitle() {
		return fromPostTitle;
	}

	public void setFromPostTitle(String fromPostTitle) {
		this.fromPostTitle = fromPostTitle;
	}

	public Integer getForwardCount() {
		return forwardCount;
	}

	public void setForwardCount(Integer forwardCount) {
		this.forwardCount = forwardCount;
	}

	public Integer getShareCount() {
		return shareCount;
	}

	public void setShareCount(Integer shareCount) {
		this.shareCount = shareCount;
	}

	public Integer getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(Integer commentCount) {
		this.commentCount = commentCount;
	}

	public String getRemarkname() {
		return remarkname;
	}

	public void setRemarkname(String remarkname) {
		this.remarkname = remarkname;
	}
	
}
