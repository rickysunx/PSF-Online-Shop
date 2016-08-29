package psf.vo.common;

import java.io.Serializable;

/**
 * 视频对象
 * 
 * @author 肖慧
 * 
 */
public class VideoVO implements Serializable {
	protected String title;
	protected String pic; // 视频缩略图
	protected String flash; // 视频链接
	protected String time; // 视频时间，有时无法获取

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public String getFlash() {
		return flash;
	}

	public void setFlash(String flash) {
		this.flash = flash;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	@Override
	public String toString() {
		return "title:"+title+"\r\npic:"+pic+"\r\nflash:"+flash+"\r\n\r\n";
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
}
