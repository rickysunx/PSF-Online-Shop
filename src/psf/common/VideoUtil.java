package psf.common;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import psf.vo.common.VideoVO;

/**
 * 获取视频地址和缩略图:优酷、土豆、酷6、6间房、56视频
 * 
 * @author 肖慧
 */
public class VideoUtil {
	/**
	 * 获取视频通用接口
	 * 
	 * @param url
	 * @return
	 */
	public static VideoVO getVideoInfo(String url) {
		VideoVO video = new VideoVO();
		if (url.indexOf("v.youku.com") != -1) {
			try {
				video = getYouKuVideo(url);
			} catch (Exception e) {
				e.printStackTrace();
				video = null;
			}
		} else if (url.indexOf("tudou.com") != -1) {
			try {
				video = getTudouVideo(url);
			} catch (Exception e) {
				e.printStackTrace();
				video = null;
			}
		} else if (url.indexOf("v.ku6.com") != -1) {
			try {
				video = getKu6Video(url);
			} catch (Exception e) {
				e.printStackTrace();
				video = null;
			}
		} else if (url.indexOf("6.cn") != -1) {
			try {
				video = get6Video(url);
			} catch (Exception e) {
				e.printStackTrace();
				video = null;
			}
		} else if (url.indexOf("56.com") != -1) {
			try {
				video = get56Video(url);
			} catch (Exception e) {
				e.printStackTrace();
				video = null;
			}
		} else {
			return null;
		}
		return video;
	}

	/**
	 * 获取优酷视频
	 * 
	 * @param url视频URL
	 */
	public static VideoVO getYouKuVideo(String url) throws Exception {
		Document doc = getURLContent(url);
		
		//获取标题
		Element head = doc.head();
		Elements metaTitle = head.children().select("meta[name=title]");
		String title = null;
		if(metaTitle.size()>0) {
			title = metaTitle.get(0).attr("content");
		}
		
		/**
		 * 获取视频缩略图
		 */
		String pic = getElementAttrById(doc, "s_sina", "href");
		int local = pic.indexOf("pic=");
		pic = pic.substring(local + 4);
		/**
		 * 获取视频地址
		 */
		String flash = getElementAttrById(doc, "link2", "value");
		/**
		 * 获取视频时间
		 */
		String time = getElementAttrById(doc, "download", "_href");
		String[] arrays = time.split("\\|");
		time = arrays[4];
		VideoVO video = new VideoVO();
		video.setPic(pic);
		video.setFlash(flash);
		video.setTime(time);
		video.setTitle(title);
		return video;
	}

	/**
	 * 
	 * 获取土豆视频
	 * 
	 * @param url视频URL
	 */
	public static VideoVO getTudouVideo(String url) throws Exception {
		Document doc = getURLContent(url);
		
		//获取标题
		String title = doc.title();
		int title_index = title.indexOf("_在线观看");
		if(title_index!=-1) {
			title = title.substring(0,title_index);
		}
		
		String content = doc.html();
		int beginLocal = content.indexOf("<script>document.domain");
		int endLocal = content.indexOf("</script>");
		content = content.substring(beginLocal, endLocal);
		/**
		 * 获取视频地址
		 */
		String flash = getScriptVarByName("iid_code", content);
		flash = "http://www.tudou.com/v/" + flash + "/v.swf";
		/**
		 * 获取视频缩略图
		 */
		String pic = getScriptVarByName("thumbnail", content);
		/**
		 * 获取视频时间
		 */
		String time = getScriptVarByName("time", content);
		VideoVO video = new VideoVO();
		video.setPic(pic);
		video.setFlash(flash);
		video.setTime(time);
		video.setTitle(title);
		return video;
	}

	/**
	 * 
	 * 获取酷6视频
	 * 
	 * @param url视频URL
	 */
	public static VideoVO getKu6Video(String url) throws Exception {
		Document doc = getURLContent(url);
		
		//获取标题
		Element head = doc.head();
		Elements metaTitle = head.children().select("meta[name=title]");
		String title = null;
		if(metaTitle.size()>0) {
			title = metaTitle.get(0).attr("content");
		}
				
		/**
		 * 获取视频地址
		 */
		Element flashEt = doc.getElementById("outSideSwfCode");
		String flash = flashEt.attr("value");
		/**
		 * 获取视频缩略图
		 */
		Element picEt = doc.getElementById("plVideosList");
		String time = null;
		String pic = null;
		if (picEt != null) {
			Elements pics = picEt.getElementsByTag("img");
			pic = pics.get(0).attr("src");
			/**
			 * 获取视频时长
			 */
			Element timeEt = picEt.select("span.review>cite").first();
			time = timeEt.text();
		} else {
			pic = doc.getElementsByClass("s_pic").first().text();
		}
		VideoVO video = new VideoVO();
		video.setPic(pic);
		video.setFlash(flash);
		video.setTime(time);
		video.setTitle(title);
		return video;
	}

	/**
	 * 
	 * 获取6间房视频
	 * 
	 * @param url视频URL
	 */
	public static VideoVO get6Video(String url) throws Exception {
		Document doc = getURLContent(url);
		/**
		 * 获取视频缩略图
		 */
		Element picEt = doc.getElementsByClass("summary").first();
		String pic = picEt.getElementsByTag("img").first().attr("src");
		/**
		 * 获取视频时长
		 */
		String time = getVideoTime(doc, url, "watchUserVideo");
		if (time == null) {
			time = getVideoTime(doc, url, "watchRelVideo");
		}
		/**
		 * 获取视频地址
		 */
		Element flashEt = doc.getElementById("video-share-code");
		doc = Jsoup.parse(flashEt.attr("value"));
		String flash = doc.select("embed").attr("src");
		VideoVO video = new VideoVO();
		video.setPic(pic);
		video.setFlash(flash);
		video.setTime(time);
		return video;
	}

	/**
	 * 
	 * 获取56视频
	 * 
	 * @param url视频URL
	 */
	public static VideoVO get56Video(String url) throws Exception {
		Document doc = getURLContent(url);
		String content = doc.html();
		/**
		 * 获取视频缩略图
		 */
		int begin = content.indexOf("\"img\":\"");
		content = content.substring(begin + 7, begin + 200);
		int end = content.indexOf("\"};");
		String pic = content.substring(0, end).trim();
		pic = pic.replaceAll("\\\\", "");
		/**
		 * 获取视频地址
		 */
		String flash = "http://player.56.com"
				+ url.substring(url.lastIndexOf("/"), url.lastIndexOf(".html"))
				+ ".swf";
		VideoVO video = new VideoVO();
		video.setPic(pic);
		video.setFlash(flash);
		return video;
	}

	/**
	 * 获取6间房视频时长
	 */
	private static String getVideoTime(Document doc, String url, String id) {
		String time = null;
		Element timeEt = doc.getElementById(id);
		Elements links = timeEt.select("dt > a");
		for (Element link : links) {
			String linkHref = link.attr("href");
			if (linkHref.equalsIgnoreCase(url)) {
				time = link.parent().getElementsByTag("em").first().text();
				break;
			}
		}
		return time;
	}

	/**
	 * 获取script某个变量的值
	 * 
	 * @param name变量名称
	 * @return 返回获取的值
	 */
	private static String getScriptVarByName(String name, String content) {
		String script = content;
		int begin = script.indexOf(name);
		script = script.substring(begin + name.length() + 2);
		int end = script.indexOf(",");
		script = script.substring(0, end);
		String result = script.replaceAll("'", "");
		result = result.trim();
		return result;
	}

	/**
	 * 根据HTML的ID键及属于名，获取属于值
	 * 
	 * @param idHTML的ID键
	 * @param attrName属于名
	 * @return 返回属性值
	 */
	private static String getElementAttrById(Document doc, String id,
			String attrName) throws Exception {
		Element et = doc.getElementById(id);
		String attrValue = et.attr(attrName);
		return attrValue;
	}

	/**
	 * 获取网页的内容
	 */
	private static Document getURLContent(String url) throws Exception {
		Document doc = Jsoup.connect(url).data("query", "Java")
				.userAgent("Mozilla").cookie("auth", "token").timeout(6000)
				.post();
		return doc;
	}
	
	public static void main(String [] args) throws Exception {
		try {
			VideoVO v = getVideoInfo("http://www.tudou.com/programs/view/ncDNLCqkVS8/");
			System.out.println(v);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
