package psf.common;

import java.util.List;

import org.htmlparser.Parser;

import psf.common.htmlparser.PsfImageExtractingVisitor;
import psf.common.htmlparser.PsfTextExtractingVisitor;

public class PsfHtmlUtils {
	
	public static void main(String [] args) {
		try {
//			byte [] content = PsfUtils.getFileBytes("c:\\网易.htm");
//			String szContent = new String(content,"GBK");
//			decodeImages(szContent);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static String decodeText(String html) throws Exception {
		if(html==null) return "";
		Parser p = Parser.createParser(html,"UTF-8");
		PsfTextExtractingVisitor v = new PsfTextExtractingVisitor();
		p.visitAllNodesWith(v);
		String s = v.getText();
		return s;
	}
	
	public static List<String> decodeImages(String html) throws Exception {
		Parser p = new Parser(html);
		PsfImageExtractingVisitor v = new PsfImageExtractingVisitor();
		p.visitAllNodesWith(v);
		return v.getImageList();
	}
	
}
