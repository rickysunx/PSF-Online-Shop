package psf.vo.sns;

import psf.common.PsfTime;
import psf.entity.TTopic;

public class TopicVO extends TTopic {
	protected String groupname = null;	//话题所属圈子名称
	protected String grouplogo = null;	//话题所属圈子logo
	protected String username = null;
	protected String avatarFileName = null;
	protected PostListItemVO latestpost = null;	//最新发言
	protected Boolean isShow = true;	//是否向外公开
	
	public String getGroupname() {
		return groupname;
	}
	public void setGroupname(String groupname) {
		this.groupname = groupname;
	}
	public String getAvatarFileName() {
		return avatarFileName;
	}
	public void setAvatarFileName(String avatarFileName) {
		this.avatarFileName = avatarFileName;
	}
	public String getGrouplogo() {
		return grouplogo;
	}
	public void setGrouplogo(String grouplogo) {
		this.grouplogo = grouplogo;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public PostListItemVO getLatestpost() {
		return latestpost;
	}
	public void setLatestpost(PostListItemVO latestpost) {
		this.latestpost = latestpost;
	}
	
	public String getTimepassed(){
		PsfTime time = new PsfTime(this.addtime);
		return time.getTimePassed();
	}
	public Boolean getIsShow() {
		return isShow;
	}
	public void setIsShow(Boolean isShow) {
		this.isShow = isShow;
	}
}
