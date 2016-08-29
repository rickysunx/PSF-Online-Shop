package psf.common.htmlparser;

import org.htmlparser.Node;
import org.htmlparser.Text;
import org.htmlparser.tags.ScriptTag;
import org.htmlparser.tags.StyleTag;
import org.htmlparser.util.Translate;
import org.htmlparser.visitors.NodeVisitor;

public class PsfTextExtractingVisitor extends NodeVisitor {

	protected StringBuffer sb = new StringBuffer();
	
	public void visitStringNode(Text stringNode) {
		Node p = stringNode.getParent();
		if(p!=null) {
			if(p instanceof StyleTag || p instanceof ScriptTag) {
				return;
			}
		}
		String text = stringNode.getText();
		text = text.replaceAll(" ", "");
		text = text.replaceAll("\r\n", "");
		text = text.replaceAll("\n", "");
		text = Translate.decode(text);
		
        sb.append(text);
	}
	
	public String getText() {
		return sb.toString();
	}

}
