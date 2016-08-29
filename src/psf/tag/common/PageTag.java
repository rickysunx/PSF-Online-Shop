package psf.tag.common;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;

import psf.PsfTag;
import psf.common.PageUtils;

public class PageTag extends PsfTag {
	protected int page;
	protected int pageCount;
	protected String action;
	protected String href;
	
	
	public int doEndTag() throws JspException {
		try {
			JspWriter out = pageContext.getOut();
			
			if(href==null || href.trim().length()==0) {
				href = "javascript:void(0);";
			}
			
			out.println("<div class=\"psf_page\">");
			
			//输出上一页
			if(page==1) {
				out.println("<span class=\"prev_next prev disabled\"><em></em><i>上一页</i></span>");
			} else {
				out.println("<a class=\"prev_next prev\" href=\""+href.replace("#page#", ""+(page-1))+"\" onclick=\""+action.replace("#page#", ""+(page-1))+"\"><em></em><i>上一页</i></a>");
			}
			
			//输出页
			int [] pages = PageUtils.getPages(page, pageCount);
			for (int i = 0; i < pages.length; i++) {
				int p = pages[i];
				if(p==0) {
					out.println("<span class=\"dots\">…</span>");
				} else if(p==page) {
					out.println("<span class=\"current\">"+p+"</span>");
				} else {
					out.println("<a href=\""+href.replace("#page#", ""+p)+"\" onclick=\""+action.replace("#page#", ""+p)+"\">"+p+"</a>");
				}
			}
			
			if(page==pageCount) {
				out.println("<span class=\"prev_next next disabled\"><i>下一页</i><em></em></span>");
			} else {
				out.println("<a class=\"prev_next next\" href=\""+href.replace("#page#", ""+(page+1))+"\" onclick=\""+action.replace("#page#", ""+(page+1))+"\"><i>下一页</i><em></em></a>");
			}
			
			out.println("</div>");
			
		} catch (Exception e) {
			throw new JspException(e);
		}
		
		return EVAL_PAGE;
	}

	public int getPage() {
		return page;
	}


	public int getPageCount() {
		return pageCount;
	}


	public void setPage(int page) {
		this.page = page;
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
