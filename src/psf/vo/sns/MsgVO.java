package psf.vo.sns;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import psf.entity.TMsg;
import psf.entity.TPic;


public class MsgVO extends TMsg implements Serializable {
	
	protected Integer uid = null;
	protected String username = null;
	protected String avatarFileName = null;
	
	protected String nowavatarFileName = null; //当前登录用户
	
	protected Integer msgType = null;  //receive(0) or send(1)
	protected String time = null;
	
	protected Integer newCount = null;
	protected Integer allCount = null;
	
	protected Integer lastUpdateTime = null;
	
	protected List<MsgVO> detailMsgList = new ArrayList<MsgVO>();
	protected List<TPic> picList = new ArrayList<TPic>();
	

	public List<TPic> getPicList() {
		return picList;
	}

	public void setPicList(List<TPic> picList) {
		this.picList = picList;
	}

	public Integer getLastUpdateTime() {
		return lastUpdateTime;
	}

	public void setLastUpdateTime(Integer lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
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

	public void setAvatarFileName(String avatarFileName) {
		this.avatarFileName = avatarFileName;
	}

	public String getNowavatarFileName() {
		return nowavatarFileName;
	}

	public void setNowavatarFileName(String nowavatarFileName) {
		this.nowavatarFileName = nowavatarFileName;
	}

	public Integer getMsgType() {
		return msgType;
	}

	public void setMsgType(Integer msgType) {
		this.msgType = msgType;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public Integer getNewCount() {
		return newCount;
	}

	public void setNewCount(Integer newCount) {
		this.newCount = newCount;
	}

	public Integer getAllCount() {
		return allCount;
	}

	public void setAllCount(Integer allCount) {
		this.allCount = allCount;
	}

	public List<MsgVO> getDetailMsgList() {
		return detailMsgList;
	}

	public void setDetailMsgList(List<MsgVO> detailMsgList) {
		this.detailMsgList = detailMsgList;
	}


}
