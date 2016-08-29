package psf.vo.sns;

import java.io.Serializable;
import java.util.List;

import psf.entity.TFriend;
import psf.entity.TFriendGroup;
import psf.entity.TIntroduce;
import psf.entity.TUser;

public class IntroduceVO extends TIntroduce implements Serializable {
	
	protected String username = null;
	protected String time = null;
	protected String avatarFileName = null;
	
	protected List<SnsUserInfoVO> users = null;
	protected String uids = null;

	
	public String getUids() {
		return uids;
	}

	public void setUids(String uids) {
		this.uids = uids;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getAvatarFileName() {
		return avatarFileName;
	}

	public void setAvatarFileName(String avatarFileName) {
		this.avatarFileName = avatarFileName;
	}

	public List<SnsUserInfoVO> getUsers() {
		return users;
	}

	public void setUsers(List<SnsUserInfoVO> users) {
		this.users = users;
	}
	
	
	
}
