package psf.vo.sns;

import java.io.Serializable;

/**
 * 圈子详细右侧推荐圈子对象
 * @author 肖慧
 *
 */
public class RightGroupVO implements Serializable {
	protected Integer groupid = null;
	protected String groupname = null;
	protected String logo = null;
	protected Integer grouptype = null;
	protected Boolean isJoin = false;
	public Integer getGroupid() {
		return groupid;
	}
	public void setGroupid(Integer groupid) {
		this.groupid = groupid;
	}
	public String getGroupname() {
		return groupname;
	}
	public void setGroupname(String groupname) {
		this.groupname = groupname;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public Boolean getIsJoin() {
		return isJoin;
	}
	public void setIsJoin(Boolean isJoin) {
		this.isJoin = isJoin;
	}
	public Integer getGrouptype() {
		return grouptype;
	}
	public void setGrouptype(Integer grouptype) {
		this.grouptype = grouptype;
	}
}
