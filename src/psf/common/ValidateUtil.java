package psf.common;

import java.util.Collection;
import java.util.Map;
import java.util.regex.Pattern;

/**
 * 王艳芳
 */
public class ValidateUtil {
	
	private static Pattern emailPattern = Pattern.compile("^[0-9a-z]([-_.~]?[0-9a-z])*@[0-9a-z]([-.]?[0-9a-z])*\\.[a-z]{2,4}$");
	
	public static boolean isEmail(String s) throws Exception {
		return emailPattern.matcher(s).matches();
	}
	
	public static boolean isNull(Object obj) {
		return (obj == null);
	}
	public static boolean isZero(Integer n) {
		return (n==null || n==0);
	}
	public static boolean isNull(Integer n) {
		return(n == null);
	}
	public static boolean isNull(String s) {
		return(s==null || s.trim().length()==0);
	}
	public static boolean isNull(Collection c) {
		return(c==null || c.size()==0);
	}
	public static boolean isNull(Map m) {
		return(m==null || m.keySet().size()==0);
	}

	public static boolean notNull(Object obj) throws Exception {
		return ! isNull(obj);
	}
	public static boolean notNull(Integer obj) throws Exception {
		return ! isNull(obj);
	}
	public static boolean notNull(String obj) throws Exception {
		return ! isNull(obj);
	}
	public static boolean notNull(Collection obj) throws Exception {
		return ! isNull(obj);
	}
	public static boolean notNull(Map obj) throws Exception {
		return ! isNull(obj);
	}
	public static boolean notZero(Integer n) throws Exception {
		return !isZero(n);
	}
	
	public static void notNull(Object obj, String name) throws Exception {
		if(isNull(obj)){ThrowNullException(name);}
	}
	public static void notNull(Integer obj, String name) throws Exception {
		if(isNull(obj)){ThrowNullException(name);}
	}
	public static void notNull(String obj, String name) throws Exception {
		if(isNull(obj)){ThrowNullException(name);}
	}
	public static void notNull(Collection obj, String name) throws Exception {
		if(isNull(obj)){ThrowNullException(name);}
	}
	public static void notNull(Map obj, String name) throws Exception {
		if(isNull(obj)){ThrowNullException(name);}
	}
	private static void ThrowNullException(String name) throws Exception {
		throw new Exception("【" + name + "】不能为空！");
	}
	public static void validStringLength(String s, String fieldName, int lengthMax) throws Exception{
		if(s != null && s.length() > lengthMax){
			throw new Exception("【" + fieldName + "】长度不能大于" + lengthMax + "！：" + s);
		}
	}
	
}
