package psf.common;

import java.io.RandomAccessFile;
import java.security.MessageDigest;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpMethod;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.methods.GetMethod;

public class PsfUtils {
	public static char [] digits = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".toCharArray();
	
	public static void main(String [] args) {
		try {
//			String str = "2关于中央深化文化体制改革等重大问题决定的说明";
//			String shortstr = getShortStr(str, 10, null, null);
//			System.out.println(shortstr);
//			System.out.println(md5("1"));
			
			int minPrice0 = 230;
			int maxPrice0 = 1543;
			int grade = 5;
			
			int span = maxPrice0-minPrice0;
			int spanPerGrade = span/grade;
			int numWidth = (int)Math.log10(spanPerGrade);
			int n = (int)Math.pow(10, numWidth);
			int nSpan = n*(int)Math.ceil((double)spanPerGrade/(double)n);
			int minPrice = (int)Math.floor((double)minPrice0/n)*n;
			int maxPrice = (int)Math.ceil((double)maxPrice0/n)*n;
			System.out.println("nSpan:"+nSpan+" numWidth:"+numWidth);
			System.out.println("minPrice:"+minPrice+" maxPrice:"+maxPrice);
			
			for (int i = minPrice; i < maxPrice; i+=nSpan) {
				System.out.print(""+i+"-"+(i+nSpan)+" ");
			}
			
			
			String content = "##MJ天团#MJ的太空舞步精彩绝伦啊";
			List<String> topics = getTopics(0,content);
			for(String topic : topics){
				System.out.println(topic);
			}
			
			System.out.println(generateCode(20));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static byte [] getUrlBytes(String url) throws Exception {
		HttpClient hc = new HttpClient();
		HttpMethod method = new GetMethod(url);
		
		int status = hc.executeMethod(method);
		if(status==HttpStatus.SC_OK) {
			byte [] picdata = method.getResponseBody();
			return picdata;
		}
		
		return null;
	}
	
	public static String md5(String s) throws Exception {		
		MessageDigest md5= MessageDigest.getInstance("MD5");
		md5.update(s.getBytes("utf-8"));
		StringBuffer sb = new StringBuffer();
		for(byte b:md5.digest()) {
			sb.append(String.format("%02x", b&0xff) );  
		}
		return sb.toString();
	}
	
	public static byte [] getFileBytes(String fileName) throws Exception {
		RandomAccessFile f = new RandomAccessFile(fileName, "r");
		long length = f.length();
		if(length>50000000) {
			f.close();
			throw new Exception("file too big");
		}
		byte [] bytes = new byte[(int)length];
		f.readFully(bytes);
		f.close();
		return bytes;
	}
	
	public static void writeFileBytes(String fileName,byte [] bytes) throws Exception {
		RandomAccessFile f = new RandomAccessFile(fileName, "rw");
		f.setLength(0);
		f.write(bytes);
		f.close();
	}
	
	public static String getShortStr(String str,int length, Integer postid, Integer posttype) throws Exception {
		int index = str.length();
		int len = str.getBytes().length;
		if(len<=length) return str;
		for(int i=0;i<str.length();i++) {
			byte [] bytes = str.substring(0,i).getBytes("GBK");
			if(bytes.length==length) {
				index = i;
				break;
			} else if(bytes.length>length) {
				index = i-1;
				break;
			}
		}
		return str.substring(0, index-1)+"...<a href='/post/"+postid+"' target='_blank'>查看全文</a>";
	}
	
	/**
	 * 匹配话题
	 * @param type 0-带“#”，1-仅话题标题,话题中不能包含"/"符号
	 * @param content
	 * @return
	 * @throws Exception
	 */
	public static List<String> getTopics(Integer type, String content) throws Exception {
		Pattern patter = Pattern.compile("#([^\\#|.]+)#");
		Matcher matcher = patter.matcher(content);
		
		List<String> topics = new ArrayList<String>();
		while (matcher.find()) {
	    	if(type.equals(0)){
	    		topics.add(matcher.group().replaceAll("/", ""));
	    	}else if(type.equals(1)){
	    		topics.add(matcher.group().replaceAll("/","").replaceAll("#", ""));
	    	}
	    }
	    return topics;
	}
	
	/**
	 * 随机生成字符串
	 * @param num 生成字符串的长度
	 * @return
	 * @throws Exception
	 */
	public static String generateCode(int num) throws Exception {
		StringBuffer sb = new StringBuffer();
		for(int i=0; i<num; i++){
			Random random = new Random();
			int index = random.nextInt(digits.length);
			sb.append(digits[index]);
		}
		return sb.toString();
	}
}
