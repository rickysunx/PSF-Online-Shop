package psf.common;

import java.io.Serializable;
import java.util.List;

public class PageResult<E> implements Serializable {

	protected List list = null;
	protected int pageCount = 0;
	protected int itemCount = 0;

	public PageResult() {

	}

	public PageResult(List<E> list) {
		this.list = list;
	}

	public PageResult(List<E> list, int pageCount) {
		this.list = list;
		this.pageCount = pageCount;
	}

	public PageResult(List<E> list, int itemCount, int pageSize) {
		this.list = list;
		this.itemCount = itemCount;
		this.pageCount = (int) Math.ceil((double) itemCount / (double) pageSize);
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public List<E> getList() {
		return list;
	}

	public void setList(List<E> list) {
		this.list = list;
	}

	public int getItemCount() {
		return itemCount;
	}

	public void setItemCount(int itemCount) {
		this.itemCount = itemCount;
	}

}
