package psf.tag.common;

import java.net.URLEncoder;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;

import psf.PsfTag;

public class EncodeTag extends PsfTag {
	public String text = null;
	public String enc = null;
	public boolean sharp = false;
	public String getText() {
		return text;
	}
	public String getEnc() {
		return enc;
	}
	public void setText(String text) {
		this.text = text;
	}
	public void setEnc(String enc) {
		this.enc = enc;
	}
	@Override
	public int doEndTag() throws JspException {
		
		try {
			JspWriter out = pageContext.getOut();
			String s = URLEncoder.encode(text,enc);
			if(isSharp()) {
				s = s.replace("%", "#");
			}
			out.print(s);
		} catch (Exception e) {}
		
		return EVAL_PAGE;
	}
	public boolean isSharp() {
		return sharp;
	}
	public void setSharp(boolean sharp) {
		this.sharp = sharp;
	}
	
	
}
