package psf.vo.sns;

import java.io.Serializable;

public class AtUserVO implements Serializable {
	protected Integer uid = null;
	protected String  userName = null;
	protected String  remarkName = null;
	
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getRemarkName() {
		return remarkName;
	}
	public void setRemarkName(String remarkName) {
		this.remarkName = remarkName;
	}
	
	
}
