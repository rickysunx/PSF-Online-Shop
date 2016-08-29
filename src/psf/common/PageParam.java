package psf.common;

import java.io.Serializable;

public class PageParam implements Serializable {
	
	protected int page = 0;
	protected int pageSize = 20;
	
	public PageParam(int page) {
		this.page = page;
	}
	
	public PageParam(int page,int pageSize) {
		this.page = page;
		this.pageSize = pageSize;
	}
	
	public int getOffset() {
		return (page-1)*pageSize;
	}
	
	public int getRows() {
		return pageSize;
	}

	public int getPage() {
		return page;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
}
