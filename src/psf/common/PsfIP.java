package psf.common;

import psf.entity.TPic;

/**
 * ip 格式转换
 * 
 * @author 王艳芳
 */
public class PsfIP {
	
	public static void main(String[] args) {
		try {
			System.out.println(ip2hex("122.155.102.1"));
			System.out.println(hex2ip("7A9B6601"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	private static char[] vv = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'} ;
	
	
	/**
	 * 转换IP格式，比如将122.155.102.1转换为7A9B6601
	 */
	public static String ip2hex(String ip) throws Exception {
		if(ip.indexOf(":")!=-1) return "00000000"; //ipv6
		String[] ss = ip.split("\\.");
		StringBuffer hex = new StringBuffer();
		for(int ii = 0; ii < 4; ii++){
			int isi = Integer.parseInt(ss[ii]);
			hex.append(vv[isi / 16]);
			hex.append(vv[isi % 16]);
		}
		return hex.toString();
	}
	/**
	 * 转换IP格式，比如将7A9B6601转换为122.155.102.1
	 */
	public static String hex2ip(String hexip) throws Exception {
		char[] cc = hexip.toCharArray();
		StringBuffer ip = new StringBuffer();
		for(int i = 0; i < 8; i++){
			if(i > 0){
				ip.append('.');
			}
			char ci = cc[i++];
			char ci2 = cc[i];
			int ici = (ci >= 'A' ? ci - 'A' + 10 : ci - '0') * 16 + (ci2 >= 'A' ? ci2 - 'A' + 10 : ci2 - '0'); 
			ip.append(ici);
		}
		return ip.toString();
	}
	
}
