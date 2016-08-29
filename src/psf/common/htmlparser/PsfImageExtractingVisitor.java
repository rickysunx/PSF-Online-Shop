package psf.common.htmlparser;

import java.util.ArrayList;
import java.util.List;

import org.htmlparser.Tag;
import org.htmlparser.tags.ImageTag;
import org.htmlparser.visitors.NodeVisitor;

public class PsfImageExtractingVisitor extends NodeVisitor {
	protected List<String> imageList = new ArrayList<String>();
	
	public void visitTag(Tag tag) {
		if(tag!=null && tag instanceof ImageTag) {
			String src = tag.getAttribute("src");
			imageList.add(src);
			System.out.println(src);
		}
	}
	
	public List<String> getImageList() {
		return imageList;
	}
}
