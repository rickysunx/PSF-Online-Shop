package psf.vo.sns;

import java.io.Serializable;

import psf.common.PsfTime;

/**
 * 粉丝对象
 */
public class LikeUserVO implements Serializable {
	protected Integer uid = null;
	protected String avatarFileName = null;
	
	//圈友属性
	protected String username = null;	
	protected PostListItemVO lastpost = null;
	protected Integer role = null;
	protected Integer postcount = null;
	protected Integer addtime = null;
	protected Integer lasttime = null;
	
	protected Boolean isFollow = false;

	public Integer getUid() {
		return uid;
	}

	public String getAvatarFileName() {
		return avatarFileName;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public void setAvatarFileName(String avatarFileName) {
		this.avatarFileName = avatarFileName;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public PostListItemVO getLastpost() {
		return lastpost;
	}

	public void setLastpost(PostListItemVO lastpost) {
		this.lastpost = lastpost;
	}

	public Integer getRole() {
		return role;
	}

	public void setRole(Integer role) {
		this.role = role;
	}
	
	public String getRoleName(){
		if(getRole() != null){
			if(getRole().equals(0)){
				return "圈友";
			}else if(getRole().equals(1)){
				return "管理员";
			}else if(getRole().equals(2)){
				return "圈主";
			}else{
				return null;
			}
		}
		else{
			return null;
		}
	}

	public Integer getPostcount() {
		return postcount;
	}

	public void setPostcount(Integer postcount) {
		this.postcount = postcount;
	}

	public Integer getAddtime() {
		return addtime;
	}

	public void setAddtime(Integer addtime) {
		this.addtime = addtime;
	}

	public Integer getLasttime() {
		return lasttime;
	}

	public void setLasttime(Integer lasttime) {
		this.lasttime = lasttime;
	}
	
	public String getChnAddtime() {
		if(getAddtime() != null){
			PsfTime time = new PsfTime(getAddtime());
			return time.toChnDateString().split(" ")[0];
		}else{
			return null;
		}
	}
	
	public String getChnLasttime() {
		if(getLasttime() != null){
			PsfTime time = new PsfTime(getLasttime());
			return time.getTimePassed();
		}else{
			return null;
		}
	}

	public Boolean getIsFollow() {
		return isFollow;
	}

	public void setIsFollow(Boolean isFollow) {
		this.isFollow = isFollow;
	}
}
