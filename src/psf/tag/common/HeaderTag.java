package psf.tag.common;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;

import psf.PsfTag;

public class HeaderTag extends PsfTag {
	
	public static String [] CssFiles = new String[] {
		"/css/common.css"
	};
	
	public static String [] JsFiles = new String[] {
		"/js/jquery.js","/js/jquery.cookie.js","/js/jquery-ui.js",
		"/js/psf.dialog.js","/js/psf.menu.js","/js/psf.editor.js",
		"/js/psf.tab.js","/js/common.js","/js/common/shortcut.js","/js/swfobject.js"
	};
	
	public int doEndTag() throws JspException {
		JspWriter out = pageContext.getOut();
		try {
			out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\"/>");
			out.println("<meta http-equiv=\"Pragma\" content=\"no-cache\"/>");
			out.println("<meta http-equiv=\"X-UA-Compatible\" content=\"IE=EmulateIE7\"/>");
			for(String css:CssFiles) {
				out.println("<link href=\""+css+"\" rel=\"stylesheet\" type=\"text/css\"/>");
			}
			for(String js:JsFiles) {
				out.println("<script src=\""+js+"\" type=\"text/javascript\"></script>");
			}
		} catch (IOException e) {
			throw new JspException(e);
		}
		return EVAL_PAGE;
	}
}
