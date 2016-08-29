package psf.vo.sns;

import java.io.Serializable;
import java.util.List;

import psf.common.PsfTime;
import psf.entity.TGroup;

/**
 * 
 * @author 肖慧
 *
 */
public class GroupVO extends TGroup implements Serializable {
	
	protected String displayName = null;	//圈主的显示名
	protected Integer topicCount = null;	//话题数
	protected String logo = null;
	
	protected String groupclass = null;	//圈子类别
	protected Integer postCount = null;	//发言数
	protected Boolean isJoin = false;
	protected Boolean isApplied = false;	//是否申请，且申请待处理
	protected Integer psfFriendCount = null;	//品友数：好友+关注+粉丝
	protected String zonename = null;	// 地区名
	
	protected List<TopicVO> hottopic = null;	//热门话题
	protected List<TopicVO> latesttopic = null;	//最新话题
	protected List<LikeUserVO> joiner = null;	//参与者
	protected Integer role = null;
	protected Integer managecount = null; //管理员数目
	
	public Integer getTopicCount() {
		return topicCount;
	}

	public void setTopicCount(Integer topicCount) {
		this.topicCount = topicCount;
	}

	public String getDisplayName() {
		return displayName;
	}

	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}
	
	public String getCreatetime(){
		PsfTime time = new PsfTime(this.addtime);
		return time.toChnDateString().split(" ")[0];
	}

	public String getGroupclass() {
		return groupclass;
	}

	public void setGroupclass(String groupclass) {
		this.groupclass = groupclass;
	}

	public Integer getPostCount() {
		return postCount;
	}

	public void setPostCount(Integer postCount) {
		this.postCount = postCount;
	}

	public Boolean getIsJoin() {
		return isJoin;
	}

	public void setIsJoin(Boolean isJoin) {
		this.isJoin = isJoin;
	}

	public Integer getPsfFriendCount() {
		return psfFriendCount;
	}

	public void setPsfFriendCount(Integer psfFriendCount) {
		this.psfFriendCount = psfFriendCount;
	}

	public String getZonename() {
		return zonename;
	}

	public void setZonename(String zonename) {
		this.zonename = zonename;
	}

	public List<LikeUserVO> getJoiner() {
		return joiner;
	}

	public void setJoiner(List<LikeUserVO> joiner) {
		this.joiner = joiner;
	}

	public List<TopicVO> getHottopic() {
		return hottopic;
	}

	public void setHottopic(List<TopicVO> hottopic) {
		this.hottopic = hottopic;
	}

	public List<TopicVO> getLatesttopic() {
		return latesttopic;
	}

	public void setLatesttopic(List<TopicVO> latesttopic) {
		this.latesttopic = latesttopic;
	}

	public Integer getRole() {
		return role;
	}

	public void setRole(Integer role) {
		this.role = role;
	}
	
	public String getGroupTypeName() {
		if(this.grouptype == null || this.grouptype.equals(1)){
			return "开放圈子(自由加入)";
		}else if(this.grouptype.equals(2)){
			return "开放圈子(申请加入)";
		}else if(this.grouptype.equals(3)){
			return "半开放圈子";
		}else if(this.grouptype.equals(3)){
			return "私密圈子";
		}else{
			return null;
		}
	}

	public Integer getManagecount() {
		return managecount;
	}

	public void setManagecount(Integer managecount) {
		this.managecount = managecount;
	}

	public Boolean getIsApplied() {
		return isApplied;
	}

	public void setIsApplied(Boolean isApplied) {
		this.isApplied = isApplied;
	}
}
