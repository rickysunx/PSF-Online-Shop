package psf.common;

import java.util.ArrayList;
import java.util.List;

import psf.Psf;
import psf.entity.TUrl;
import psf.service.sns.SnsService;


public class PsfShortUrl {
	
	public static char [] digits = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".toCharArray();
	public static int [] digitNum = null;
	
	public static void main(String [] args) throws Exception {
//		long t1 = System.currentTimeMillis();
//		//BufferedWriter bw = new BufferedWriter(new FileWriter("c:\\num.txt"),1024000);
//		for(int i=10000000;i<10100000;i++) {
//			String s = int2strid(i);
//			int n = strid2int(s);
//			//bw.write(i+":"+s+":"+n+"\r\n");
//		}
//		//bw.flush();
//		//bw.close();
//		long t2 = System.currentTimeMillis();
//		System.out.println((t2-t1));
//		for (int i = 100000; i < 200000; i++) {
//			String s = int2strid(i);
//			System.out.println(i+":"+s+":"+strid2int(s));
//		}
		
		try {
			String content = "fdafasde http://t.psf100.com/ewq232 http://t.psf100.com/232中国";
			
			List<String> urlids = extractShortUrlIds(content);
			for(String s:urlids) {
				System.out.println(s);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static String int2strid(int id) throws Exception {
		int radix = digits.length;
		char [] buf = new char[Psf.ShortUrlIdLength];
		if(id<0) return null;
		
		long n = id;
		for (int i = 0; i < buf.length; i++) {
			long v =  (int)Math.round((Math.pow(radix, (buf.length-i-1))));
			buf[i] = digits[(int)(n/v)];
			n = n % v;
		}
		
		return new String(buf, 0, Psf.ShortUrlIdLength);
		
	}
	
	public static int strid2int(String s) throws Exception {
		int radix = digits.length;
		if(digitNum==null) {
			digitNum = new int[512];
			for (int i = 0; i < radix; i++) {
				digitNum[digits[i]] = i;
			}
		}
		int result = 0;
		char [] chars = s.toCharArray();
		
		for (int i = 0; i < chars.length; i++) {
			result = (result*radix+digitNum[chars[i]]);
		}
		
		return result;
	}
	
	/**
	 * 处理短超链，添加超链，或者增加视频缩略图
	 * @param s
	 * @throws Exception
	 */
	public static String processShortUrl(String content) throws Exception {
		SnsService snsService = new SnsService();
		List<String> urlIdList = extractShortUrlIds(content);
		String result = content;
		for (String sUrlId:urlIdList) {
			Integer urlid = strid2int(sUrlId);
			TUrl turl = snsService.queryUrlById(urlid);
			if(turl!=null) {
				int urltype = turl.getUrltype().intValue();
				String replaceHtml = null;
				if(urltype==Psf.UrlType_Normal) {
					replaceHtml = "<a href='"+turl.getOurl()+"' target='_blank'>"+Psf.ShortUrlPrefix+sUrlId+"</a>";
				} else if(urltype==Psf.UrlType_Video) {
					replaceHtml = 
						"<div class='psfVideoUrl'><a href='javascript:void(0);' onclick=\"psfVideoShowSwf('"+sUrlId+"');\">"+
								Psf.ShortUrlPrefix + sUrlId + "</a><em></em></div>" +
						"<div _title='"+(turl.getTitle()==null?"":turl.getTitle().replaceAll("'", "\\'"))+
							"' _swf='"+turl.getSwfurl()+"' class='psfVideoContainer' id='psfSwf_"+sUrlId+"'>" +
								"<img width='120' height='80' src='"+turl.getThumburl()+"'/>" +
								"<img class='videoplay' onclick=\"psfVideoShowSwf('"+sUrlId+"');\" src='/images/feedvideoplay.gif'/>" +
						"</div>";
						//turl.getTitle()==null?"":turl.getTitle() +
						//"<div id='psfSwf_"+turl.getUrlid()+"'></div>" +
						//"<script type=\"text/javascript\">" +
						//"swfobject.embedSWF(\"" + turl.getSwfurl()+"\",\"psfSwf_"+turl.getUrlid()+"\",'500','400','9.0.0');" +
						//"</script>";
				}
				result = result.replaceAll(Psf.ShortUrlPrefix+sUrlId, replaceHtml);
			}
		}
		
		return result;
	}
	
	public static boolean isValidStrId(String strid) throws Exception {
		char [] chars = strid.toCharArray();
		for (int i = 0; i < chars.length; i++) {
			boolean valid = false;
			for (int j = 0; j < digits.length; j++) {
				if(chars[i]==digits[j]) {
					valid = true;
					break;
				}
			}
			if(!valid) return false;
		}
		return true;
	}
	
	/**
	 * 抽取所有短URL的StrId
	 * @param content
	 * @return
	 * @throws Exception
	 */
	public static List<String> extractShortUrlIds(String content) throws Exception {
		if(content==null) return null;
		int fromIndex = 0;
		int index = 0;
		List<String> shortUrlIdList = new ArrayList<String>();
		while(index<content.length()) {
			index = content.indexOf(Psf.ShortUrlPrefix, fromIndex);
			
			if(index==-1) break;
			
			int idStart = index+Psf.ShortUrlPrefix.length();
			
			if(idStart<content.length()) {
				String strid = content.substring(idStart, idStart+Psf.ShortUrlIdLength);
				if(isValidStrId(strid)) {
					shortUrlIdList.add(strid);
				}
			}
			
			fromIndex = index+1;
		}
		return shortUrlIdList;
	}
}
