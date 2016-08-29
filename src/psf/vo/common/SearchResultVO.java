package psf.vo.common;

public class SearchResultVO {
	public Integer oid; // 对象ID
	public Integer otype; // 对象类型：秀场，指南，体验，活动，圈子，微博
	public Integer uid; // 用户ID
	public Integer addtime; // 对象创建时间
	public String title; // 主题
	public String content; // 内容

	public Integer getOid() {
		return oid;
	}

	public void setOid(Integer oid) {
		this.oid = oid;
	}

	public Integer getOtype() {
		return otype;
	}

	public void setOtype(Integer otype) {
		this.otype = otype;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public Integer getAddtime() {
		return addtime;
	}

	public void setAddtime(Integer addtime) {
		this.addtime = addtime;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	// 返回已过时间描述
	/*
	 * public String getChntime(){ PsfTime time = new PsfTime(this.addtime);
	 * return time.getChnTimePassed(); }
	 */
	public String toString() {
		return oid + " " + otype + " " + uid + " " + addtime + " "
				+ title.trim() + " " + content.trim();
	}
}
