package psf.tag.common;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;

import psf.PsfTag;

public class SimplepageTag extends PsfTag {
	protected int page;
	protected int pageCount;
	protected String action;
	protected String href;
	
	public int doEndTag() throws JspException{
		try{
			JspWriter out = pageContext.getOut();
			
			if(pageCount > 1){
				if(href==null || href.trim().length()==0) {
					href = "javascript:void(0);";
				}
				
				if(page == 1){
					out.println("<a style=\"color:gray\">上一组</a> <a href=\""+href+"\" onclick=\""+action.replace("#page#",String.valueOf(page+1))+"\">下一组</a>");
				}else if((page > 1)&&(page < pageCount)){
					out.println("<a href=\""+href+"\" onclick=\""+action.replace("#page#",String.valueOf(page-1))+"\">上一组</a> <a href=\""+href+"\" onclick=\""+action.replace("#page#",String.valueOf(page+1))+"\">下一组</a>");
				}else if(page == pageCount){
					out.println("<a href=\""+href+"\" onclick=\""+action.replace("#page#",String.valueOf(page-1))+"\">上一组</a> <a style=\"color:gray\">下一组</a>");
				}
			}
		}catch(Exception e){
			throw new JspException(e);
		}
		return EVAL_PAGE;
	}
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public String getHref() {
		return href;
	}
	public void setHref(String href) {
		this.href = href;
	}
}
