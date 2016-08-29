package psf.action.sns;

import psf.Psf;
import psf.PsfAction;
import psf.common.VideoUtil;
import psf.entity.TUrl;
import psf.framework.PsfException;
import psf.vo.common.VideoVO;

public class BlogAction extends PsfAction {
	
	/**
	 * param:url
	 * return:shorturl
	 * @throws Exception
	 */
	public void getVideoInfo() throws Exception {
		String videoUrl = p("url");
		try {
			VideoVO vvo = VideoUtil.getVideoInfo(videoUrl);
			if(vvo==null) throw new PsfException("视频URL不支持：["+videoUrl+"]");
			
			TUrl turl = new TUrl();
			turl.setOurl(videoUrl);
			turl.setSwfurl(vvo.getFlash());
			turl.setThumburl(vvo.getPic());
			turl.setUrltype(Psf.UrlType_Video);
			turl.setTitle(vvo.getTitle());
			String shorturl = snsService.addUrl(turl);
			
			set("success",1);
			set("shorturl",shorturl);
		} catch (Exception e) {
			e.printStackTrace();
			set("success",0);
			set("info",e.getMessage());
		}
	}
}
